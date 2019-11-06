<?php
/**
 * Created by PhpStorm.
 * User: maggotik
 * Date: 11/4/19
 * Time: 7:28 PM
 */

namespace Domain\Service;


use Domain\Exception\NotFoundException;
use Domain\Exception\NotValidParamsException;
use Domain\Repository\BuildingRepository;
use Domain\Repository\CompanyRepository;

class BuildingService
{
    private $buildingRepository;
    private $companyRepository;

    public function __construct(BuildingRepository $buildingRepository, CompanyRepository $companyRepository)
    {
        $this->buildingRepository = $buildingRepository;
        $this->companyRepository = $companyRepository;
    }

    public function getAttachedCompanies(int $id)
    {
        $companies = $this->companyRepository->getByBuildingId($id);

        if (empty($companies)) {
            throw new NotFoundException('Companies not found', 404);
        }

        return $companies;
    }

    public function getList(int $limit = 10,int $offset = 0)
    {

        if (!$this->isValidLimit($limit)) {
            throw new NotValidParamsException('Limit not valid or to big');
        }

        if (!$this->isValidOffset($offset)) {
            throw new NotValidParamsException('Offset not valid or to big');
        }

        $buildings = $this->buildingRepository->getList($limit, $offset);
        if (empty($buildings)) {
            throw new NotFoundException('Buildings not found', 404);
        }

        return $buildings;
    }

    private function isValidLimit($limit)
    {
        //todo
        return true;
    }

    private function isValidOffset($offset)
    {
        //todo
        return true;
    }

}