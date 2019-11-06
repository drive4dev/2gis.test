<?php

use Domain\Repository\BuildingRepository;
use Domain\Repository\CategoryRepository;
use Domain\Repository\CompanyRepository;
use Psr\Container\ContainerInterface;

$container = $app->getContainer();

$container[BuildingRepository::class] = function (ContainerInterface $c): BuildingRepository {
    return new BuildingRepository($c->get('db'));
};

$container[CategoryRepository::class] = function (ContainerInterface $c): CategoryRepository {
    return new CategoryRepository($c->get('db'));
};

$container[CompanyRepository::class] = function (ContainerInterface $c): CompanyRepository {
    return new CompanyRepository($c->get('db'));
};