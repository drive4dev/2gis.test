<?php
/**
 * Created by PhpStorm.
 * User: maggotik
 * Date: 11/4/19
 * Time: 6:27 PM
 */

namespace App\Controllers;

use Domain\Service\CompanyService;
use Slim\Http\Request;
use Slim\Http\Response;

class CompanyController extends BaseController
{
    private function getCompanyService(): CompanyService
    {
        return $this->container->get('company_service');
    }

    public function get(){


    }

    public function radius(Request $request, Response $response, array $args)
    {
        $this->setParams($request, $response, $args);

        return $this->jsonResponse(
            'success',
            $this->getCompanyService()->getWithinRadius($this->request->getQueryParams()),
            200);
    }

}