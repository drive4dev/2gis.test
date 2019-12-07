<?php

$basePath = __DIR__ . '/../../../';

require $basePath . 'vendor/autoload.php';

$container = array_merge(
    ['settings' => require __DIR__ . '/../config/main.php'],
    require __DIR__ . '/dependencies/Main.php');

$app = new \Slim\App($container);

require __DIR__ . '/Routes.php';