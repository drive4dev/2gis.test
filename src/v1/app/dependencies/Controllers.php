<?php

use App\Controllers\BuildingController;
use App\Controllers\CategoryController;
use App\Controllers\CompanyController;
use Domain\Repository\BuildingRepository;
use Domain\Repository\CategoryRepository;
use Domain\Repository\CompanyRepository;
use Domain\Service\CategoryService;
use Domain\Service\CompanyService;
use Psr\Container\ContainerInterface;

return [
    BuildingController::class => function (ContainerInterface $container) {
        return new BuildingController(
            $container->get(BuildingRepository::class),
            $container->get(CompanyRepository::class));
    },
    CategoryController::class => function (ContainerInterface $container) {
        return new CategoryController(
            $container->get(CategoryRepository::class),
            $container->get(CompanyRepository::class),
            $container->get(CategoryService::class)
        );
    },
    CompanyController::class => function (ContainerInterface $container) {
        return new CompanyController($container->get(CompanyRepository::class), $container->get(CompanyService::class));
    },
];