<?php
/**
 * Created by PhpStorm.
 * User: maggotik
 * Date: 11/4/19
 * Time: 7:12 PM
 */

namespace Domain\Service;


use Domain\Exception\NotFoundException;
use Domain\Exception\NotValidParamsException;
use Domain\Repository\CompanyRepository;

class CompanyService
{
    const WGS84_ZER0_LATITUDE_LENGTH = 110.574;
    const WGS84_ZER0_LONGITUDE_LENGTH = 111.320;

    private $companyRepository;

    public function __construct(CompanyRepository $companyRepository)
    {
        $this->companyRepository = $companyRepository;
    }

    public function getWithinRadius($params)
    {
        if (!$this->validateRadiusParams($params)) {
            throw new NotValidParamsException("Raduis params not valid");
        }

        $radius = (float)$params['rad'];
        $pointLatitude = (float)$params['lat'];
        $pointLongitude = (float)$params['lon'];

        $radiusLatitudeDiff = round($radius / self::WGS84_ZER0_LATITUDE_LENGTH, 5);
        $radiusLongitudeDiff = round($radius / (self::WGS84_ZER0_LONGITUDE_LENGTH * cos(deg2rad($pointLatitude))), 5);

        $filterParams = [
            ':minLat' => $pointLatitude - $radiusLatitudeDiff,
            ':maxLat' => $pointLatitude + $radiusLatitudeDiff,
            ':minLon' => $pointLongitude - $radiusLongitudeDiff,
            ':maxLon' => $pointLongitude + $radiusLongitudeDiff,
        ];

        $companies = $this->companyRepository->getWithinRadius($filterParams);

        if (empty($companies)) {
            throw new NotFoundException('Companies not found', 404);
        }

        return $companies;
    }

    //TODO утащить валидацию
    private function validateRadiusParams($params)
    {
        if (!$this->isValidLatitude((float)$params['lat'])) {
            return false;
        }

        if (!$this->isValidLongitude((float)$params['lon'])) {
            return false;
        }

        if (!$this->isValidRadius((float)$params['rad'])) {
            return false;
        }

        return true;
    }

    private function isValidLatitude($lat)
    {
        if ($lat > 90 || $lat < -90) {
            return false;
        }

        return true;
    }

    private function isValidLongitude($lon)
    {
        if ($lon > 180 || $lon < -180) {
            return false;
        }

        return true;
    }

    private function isValidRadius($length)
    {
        if ($length <= 0) {
            return false;
        }

        return true;
    }
}