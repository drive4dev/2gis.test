<?php
/**
 * Created by PhpStorm.
 * User: maggotik
 * Date: 11/4/19
 * Time: 7:29 PM
 */

namespace Domain\Service;


class CategoryService extends BaseService
{

    public function getAttachedCompanies(int $id)
    {
        return $this->repository->getAttachedCompanies($id);
    }
}