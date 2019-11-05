<?php

namespace App\Controllers;

use Domain\Service\BuildingService;
use Slim\Http\Request;
use Slim\Http\Response;

class BuildingController extends BaseController
{
    private function getBuildingService(): BuildingService
    {
        return $this->container->get('building_service');
    }

    public function companies(Request $request, Response $response, array $args)
    {
        $this->setParams($request, $response, $args);

        return $this->jsonResponse(
            'success',
            $this->getBuildingService()->getAttachedCompanies($args['id']),
            200);
    }

    public function index(Request $request, Response $response, array $args)
    {
        $this->setParams($request, $response, $args);

        return $this->jsonResponse(
            'success',
            $this->getBuildingService()->getList($this->args['limit'], $this->args['start']),
            200
        );
    }
}