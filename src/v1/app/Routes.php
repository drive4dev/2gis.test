<?php

use App\Controllers\BuildingController;
use App\Controllers\CategoryController;
use App\Controllers\CompanyController;
use Slim\App;

$app->group('/api/v1', function (App $app) {

    $app->get('/building/{id:[0-9]+}/companies', BuildingController::class . ':companies');

    $app->get('/category/{id:[0-9]+}/companies', CategoryController::class . ':companies');

    // http://2gis.test/api/v1/company/radius?lat=85&lon=-25&rad=7000
    $app->get('/company/radius', CompanyController::class . ':radius');

    $app->get('/building', BuildingController::class . ':index');

    $app->get('/company/{id:[0-9]+}', CompanyController::class . ':getOne');

    //http://2gis.test/api/v1/category?id=7
    $app->get('/category', CategoryController::class . ':index');
});