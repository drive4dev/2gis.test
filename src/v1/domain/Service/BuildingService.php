<?php
/**
 * Created by PhpStorm.
 * User: maggotik
 * Date: 11/4/19
 * Time: 7:28 PM
 */

namespace Domain\Service;


use Domain\Exception\NotValidParamsException;

class BuildingService extends BaseService
{

    public function getAttachedCompanies(int $id)
    {
        return $this->repository->getAttachedCompanies($id);
    }

    public function getList($limit = 10, $offset = 0)
    {

        if (!$this->isValidLimit($limit)) {
            throw new NotValidParamsException('Limit not valid or to big');
        }

        if (!$this->isValidOffset($offset)) {
            throw new NotValidParamsException('Offset not valid or to big');
        }

        return $this->repository->getList($limit, $offset);
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