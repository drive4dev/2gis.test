<?php

use App\Controllers\BuildingController;
use App\Controllers\CategoryController;
use App\Controllers\CompanyController;
use Slim\App;

$app->group('/api/v1', function (App $app) {


    $app->get('/building', BuildingController::class . ':index');

    $app->get('/building/{id:[0-9]+}/companies', BuildingController::class . ':companies');


    $app->get('/company/{id:[0-9]+}', CompanyController::class . ':getOne');

    $app->get('/company/radius', CompanyController::class . ':radius');

    $app->get('/category', CategoryController::class . ':index');

    $app->get('/category/{id:[0-9]+}', CategoryController::class . ':getOne');

    $app->get('/category/{id:[0-9]+}/companies', CategoryController::class . ':companies');
});