<?php
/**
 * Created by PhpStorm.
 * User: maggotik
 * Date: 11/4/19
 * Time: 7:09 PM
 */

namespace Domain\Service;


use Domain\Repository\RepositoryInterface;

abstract class BaseService
{
    protected $repository;

    public function __construct(RepositoryInterface $repository)
    {
        $this->repository = $repository;
    }

}