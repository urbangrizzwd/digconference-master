# DIG Conference - Technical Challenge

## Overview
At this time, we’d like to invite you take our skills challenge; see instructions below and don’t hesitate to reach out with any questions.

To get you started, we've attached a zip file with the starter code for the project. The mockup for the homepage design is in a folder within the project.

The reason for this exercise is to assess your general aptitude as well as your problem-solving style. We want you to have some fun and code this the way you would any other personal project.

You may take as long as you like to complete the challenge, but we recommend that you restrict yourself to about 8 hours and use this limitation to help you make decisions about what to focus on.

This is a basic website landing page design for a fictional conference. It is similar to something you may receive in your day-to-day work at Emergent Method. The links on the page do not need to direct anywhere, and if you'd like to add an interactive component, you are welcome to create a workshop filter feature. When the user checks a category, it should filter the results accordingly to show workshops within that category based on the icons. Again, this is an advanced feature that is completely optional for this position.

What we'd like in return is a desktop-friendly homepage that uses the back-end Craft CMS implementation we've populated for you. When you're ready to submit the project, please share with us your git repository via GitHub. We’d like to see this back by COB Wednesday 4/19 but let us know if you need more time.

## Initial Setup
1. Unzip the project and transfer to the folder you'll be using for local development.
2. Install [Docker Desktop](https://docs.docker.com/docker-for-mac/install/) if you don't already have it installed.
3. We use DDEV to run our projects locally. You may use any LAMP stack you choose, but the setup for DDEV is pretty straightforward, and it ensures that our team is using the same server configuration. Instructions for adding DDEV to your local machine are [here](https://ddev.readthedocs.io/en/stable/users/install/ddev-installation/).
4. If you're using DDEV, open the terminal, and run
    ```
    make init
    ```
    This should install all project dependencies including Craft CMS, Vite (for compiling front-end code), and all plugins. It will also import the database saved in the DB folder.
5. Run "ddev launch" to open the site in the browser.
6. To reach the back end of the site, add "/admin" to the URL. In the email we sent you, a username and password will give you access. Here's information about [how the Craft control works](https://craftcms.com/docs/4.x/control-panel.html).

## The Challenge

* Using the XD file we supplied as a guide, use the [Craft CMS templating system](https://craftcms.com/docs/4.x/dev/twig-primer.html#types-of-twig-code) to re-create it as closely as possible using [Twig](https://twig.symfony.com/) to pull in data. You'll be working mostly off of the index.twig, header.twig, and footer.twig files, but feel free to componentize as you see fit.
* You **do not need** to build out the mobile view of the page.
* We use TailwindCSS to style most of our projects. We encourage you to give this a shot, and can find [documentation here](https://tailwindcss.com/).
* Vite is our compiler of choice. While developing, you can use the command "make dev" to watch for any changes and automatically refresh the browser. To ready for production, simply run "make build."
* You can also utilize any JS library to add interactivity to the page, particularly with the workshop filtering. We recommend using [Sprig](https://putyourlightson.com/plugins/sprig) (plugin included), [Alpine JS](https://alpinejs.dev/), and/or [Svelte](https://svelte.dev/). Again, **this is optional and NOT a requirement for the this position**. Just if you want to have fun with it.
* We ask that you use version control and share your repo with us once complete. Please comment your code and reach out to use with any questions at [web@emergentmethod.com](mailto:web@emergentmethod.com).

Thanks again, and we look forward to reviewing your work!
The EM Dev Team