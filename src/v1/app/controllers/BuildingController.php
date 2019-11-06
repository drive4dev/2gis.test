<?php

namespace App\Controllers;

use Domain\Repository\BuildingRepository;
use Domain\Repository\CompanyRepository;
use Slim\Http\Request;
use Slim\Http\Response;

class BuildingController extends BaseController
{
    private $buildingRepository;
    private $companyRepository;

    public function __construct(BuildingRepository $buildingRepository, CompanyRepository $companyRepository)
    {
        $this->buildingRepository = $buildingRepository;
        $this->companyRepository = $companyRepository;
    }

    public function companies(Request $request, Response $response, array $args)
    {
        $this->setParams($request, $response, $args);

        $building = $this->buildingRepository->getById((int)$this->args['id']);

        if (!$building) {
            return $this->jsonResponse('error', 'Building not found', 404);
        }

        return $this->jsonResponse('success', $this->companyRepository->getByBuildingId($building->id), 200);
    }

    public function index(Request $request, Response $response, array $args)
    {
        $this->setParams($request, $response, $args);

        $buildings = $this->buildingRepository->getList();

        return $this->jsonResponse('success', $buildings, 200);
    }
}