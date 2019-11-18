<?php
/**
 * Created by PhpStorm.
 * User: maggotik
 * Date: 11/4/19
 * Time: 6:27 PM
 */

namespace App\Controllers;

use Domain\Exception\NotValidParamsException;
use Domain\Repository\CompanyRepository;
use Domain\Service\CompanyService;
use Slim\Http\Request;
use Slim\Http\Response;

class CompanyController extends BaseController
{
    private $companyService;
    private $companyRepository;

    public function __construct(CompanyRepository $companyRepository, CompanyService $companyService)
    {
        $this->companyRepository = $companyRepository;
        $this->companyService = $companyService;
    }

    public function getOne(Request $request, Response $response, array $args)
    {
        $this->setParams($request, $response, $args);

        $company = $this->companyRepository->getById($this->args['id']);

        return $this->jsonResponse(
            'success',
            $company,
            200
        );
    }

    public function radius(Request $request, Response $response, array $args)
    {
        $this->setParams($request, $response, $args);

        try {
            $companies = $this->companyService->getWithinRadius($this->request->getQueryParams());
        } catch (NotValidParamsException $exception) {
            return $this->jsonResponse('error', $exception->getMessage(), 200);
        }

        return $this->jsonResponse('success', $companies, 200);
    }

    public function rectangle(Request $request, Response $response, array $args)
    {
        $this->setParams($request, $response, $args);
        try {
            $companies = $this->companyService->getByRectangle($this->request->getQueryParams());
        } catch (NotValidParamsException $exception) {
            return $this->jsonResponse('error', $exception->getMessage(), 200);
        }

        return $this->jsonResponse('success', $companies, 200);
    }
}