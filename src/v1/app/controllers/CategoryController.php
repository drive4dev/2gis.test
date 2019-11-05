<?php

namespace App\Controllers;

use Domain\Service\CategoryService;
use Slim\Http\Request;
use Slim\Http\Response;

class CategoryController extends BaseController
{
    private function getCategoryService(): CategoryService
    {
        return $this->container->get('category_service');
    }

    public function companies(Request $request, Response $response, array $args)
    {
        $this->setParams($request, $response, $args);

        return $this->jsonResponse(
            'success',
            $this->getCategoryService()->getAttachedCompanies($this->args['id']),
            200);
    }
}