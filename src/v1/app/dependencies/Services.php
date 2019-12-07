<?php
/**
 * Created by PhpStorm.
 * User: maggotik
 * Date: 11/4/19
 * Time: 7:19 PM
 */

use Domain\Repository\CompanyRepository;
use Domain\Service\CategoryService;
use Domain\Service\CompanyService;
use Psr\Container\ContainerInterface;


return [
    CompanyService::class => function (ContainerInterface $container): CompanyService {
        return new CompanyService($container->get(CompanyRepository::class));
    },
    CategoryService::class => function (): CategoryService {
        return new CategoryService();
    }
];