<?php

use craft\helpers\App;

return [
    'checkDevServer' => true,
    'devServerInternal' => 'http://localhost:3000/',
    'devServerPublic' => Craft::getAlias( alias: '@web' ) . ':3000',
    'errorEntry' => 'src/js/App.js',
    'manifestPath' => '@webroot/dist/manifest.json',
    'serverPublic' => Craft::getAlias( alias: '@web' ) . '/dist/',
    'useDevServer' => (bool) App::env( name: 'VITE_USE_DEV_SERVER'),
    'cacheKeySuffix' => '',
    'includeReactRefreshShim' => false,
    'includeModulePreloadShim' => true,
    'criticalPath' => Craft::getAlias( alias: '@web' ) . '/dist/criticalcss',
    'criticalSuffix' =>'_critical.min.css',
];