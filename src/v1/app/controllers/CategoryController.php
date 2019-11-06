<?php

namespace App\Controllers;

use Domain\Repository\CategoryRepository;
use Domain\Repository\CompanyRepository;
use Domain\Service\CategoryService;
use Slim\Http\Request;
use Slim\Http\Response;

class CategoryController extends BaseController
{
    private $categoryRepository;
    private $companyRepository;
    private $categoryService;

    public function __construct(
        CategoryRepository $categoryRepository,
        CompanyRepository $companyRepository,
        CategoryService $categoryService)
    {
        $this->categoryRepository = $categoryRepository;
        $this->companyRepository = $companyRepository;
        $this->categoryService = $categoryService;
    }

    public function index(Request $request, Response $response, array $args)
    {
        $this->setParams($request, $response, $args);

        $id = 1;
        if (!empty($this->request->getQueryParam('id'))) {
            $id = (int)$this->request->getQueryParam('id');
        }

        $categories = $this->categoryRepository->getWithChildren($id);

        if (!$categories) {
            return $this->jsonResponse('error', 'Category not found', 404);
        }

        return $this->jsonResponse('success', $this->categoryService->buildTrees($categories), 200);
    }

    public function companies(Request $request, Response $response, array $args)
    {
        $this->setParams($request, $response, $args);

        $categories = $this->categoryRepository->getWithChildren((int)$this->args['id']);

        if (empty($categories)) {
            return $this->jsonResponse('error', 'Category not found', 404);
        }

        $categoryIds = [];
        foreach ($categories as $category) {
            $categoryIds[] = $category->id;
        }

        return $this->jsonResponse('success', $this->companyRepository->getByCategoryId($categoryIds), 200);
    }
}