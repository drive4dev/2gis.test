<?php
/**
 * Created by PhpStorm.
 * User: maggotik
 * Date: 11/4/19
 * Time: 7:29 PM
 */

namespace Domain\Service;


use Domain\Exception\NotFoundException;
use Domain\Repository\CompanyRepository;

class CategoryService
{
    private $companyRepository;

    public function __construct(CompanyRepository $companyRepository)
    {
        $this->companyRepository = $companyRepository;
    }

    public function getAttachedCompanies(int $id)
    {
        $companies = $this->companyRepository->getByCategoryId($id);

        if (empty($companies)) {
            throw new NotFoundException('Companies not found', 404);
        }

        return $companies;
    }
}