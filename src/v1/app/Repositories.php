<?php

use Domain\Repository\BuildingRepository;
use Domain\Repository\CategoryRepository;
use Domain\Repository\CompanyRepository;
use Psr\Container\ContainerInterface;

$container = $app->getContainer();

$container['building_repository'] = function (ContainerInterface $c): BuildingRepository {
    return new BuildingRepository($c->get('db'));
};

$container['category_repository'] = function (ContainerInterface $c): CategoryRepository {
    return new CategoryRepository($c->get('db'));
};

$container['company_repository'] = function (ContainerInterface $c): CompanyRepository {
    return new CompanyRepository($c->get('db'));
};