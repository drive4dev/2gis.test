<?php

use Domain\Repository\BuildingRepository;
use Domain\Repository\CategoryRepository;
use Domain\Repository\CompanyRepository;
use Psr\Container\ContainerInterface;


return [
    BuildingRepository::class => function (ContainerInterface $container): BuildingRepository {
        return new BuildingRepository($container->get('db'));
    },
    CategoryRepository::class => function (ContainerInterface $container): CategoryRepository {
        return new CategoryRepository($container->get('db'));
    },
    CompanyRepository::class => function (ContainerInterface $container): CompanyRepository {
        return new CompanyRepository($container->get('db'));
    }
];