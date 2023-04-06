.PHONY: build dev composer craft pulldb up install
init: up
	ddev craft setup/app-id
	ddev craft setup/security-key
	ddev import-db --src=db/dig-conference.sql
	ddev describe
build: up
	ddev exec npm run build
dev: up
	ddev exec npm run serve
composer: up
	ddev composer \
		$(filter-out $@,$(MAKECMDGOALS))
craft: up
	ddev exec php craft \
		$(filter-out $@,$(MAKECMDGOALS))
pulldb: up
	ddev exec npm run pulldb
pullassets: up
	ddev exec npm run pullassets
pushdb: up
	ddev exec npm run pushdb
install: up build
	ddev exec php craft setup/app-id \
		$(filter-out $@,$(MAKECMDGOALS))
	ddev exec php craft setup/security-key \
		$(filter-out $@,$(MAKECMDGOALS))
	ddev exec php craft install \
		$(filter-out $@,$(MAKECMDGOALS))
	ddev exec php craft plugin/install agnostic-fetch
	ddev exec php craft plugin/install async-queue
	ddev exec php craft plugin/install cp-field-inspect
	ddev exec php craft plugin/install imager-x
	ddev exec php craft plugin/install knock-knock
	ddev exec php craft plugin/install typedlinkfield
	ddev exec php craft plugin/install redactor
	ddev exec php craft plugin/install seomatic
	ddev exec php craft plugin/install vite
up:
	if [ ! "$$(ddev describe | grep OK)" ]; then \
        ddev auth ssh; \
        ddev start; \
        ddev composer install; \
        ddev exec npm install; \
    fi
%:
	@:
# ref: https://stackoverflow.com/questions/6273608/how-to-pass-argument-to-makefile-from-command-line
