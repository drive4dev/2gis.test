<?php
/**
 * Created by PhpStorm.
 * User: maggotik
 * Date: 11/4/19
 * Time: 7:19 PM
 */

use Domain\Service\BuildingService;
use Domain\Service\CategoryService;
use Domain\Service\CompanyService;
use Psr\Container\ContainerInterface;

$container = $app->getContainer();

$container['building_service'] = function (ContainerInterface $container): BuildingService {
    return new BuildingService($container->get('building_repository'));
};

$container['category_service'] = function (ContainerInterface $container): CategoryService {
    return new CategoryService($container->get('category_repository'));
};

$container['company_service'] = function (ContainerInterface $container): CompanyService {
    return new CompanyService($container->get('company_repository'));
};

