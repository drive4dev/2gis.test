<?php

$basePath = __DIR__ . '/../../../';

require $basePath . 'vendor/autoload.php';

$config = require __DIR__ . '/../config/main.php';

$config['displayErrorDetails'] = true;
$config['addContentLengthHeader'] = false;

$app = new \Slim\App(['settings' => $config]);

require __DIR__ . '/dependencies/Main.php';
require __DIR__ . '/Routes.php';