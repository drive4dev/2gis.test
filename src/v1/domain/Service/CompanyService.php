<?php
/**
 * Created by PhpStorm.
 * User: maggotik
 * Date: 11/4/19
 * Time: 7:12 PM
 */

namespace Domain\Service;

use Domain\Exception\NotValidParamsException;
use Domain\Repository\CompanyRepository;

class CompanyService
{
    const WGS84_ZER0_LATITUDE_LENGTH = 110.574;
    const WGS84_ZER0_LONGITUDE_LENGTH = 111.320;

    private $companyRepository;

    /**
     * CompanyService constructor.
     * @param CompanyRepository $companyRepository
     */
    public function __construct(CompanyRepository $companyRepository)
    {
        $this->companyRepository = $companyRepository;
    }

    /**
     * @param $params
     * @return array
     */
    public function getWithinRadius($params): array
    {
        if (!$this->validateRadiusParams($params)) {
            throw new NotValidParamsException("Raduis params not valid");
        }

        $radius = (float)$params['rad'];
        $centerLatitude = deg2rad((float)$params['lat']);
        $centerLongitude = deg2rad((float)$params['lon']);


        $filterParams = [
            ':centerLatitude' => $centerLatitude,
            ':centerLongitude' => $centerLongitude,
            ':distance' => $radius
        ];

        return $this->companyRepository->getWithinRadius($filterParams);
    }


    /**
     * @param $params
     * @return array
     */
    public function getByRectangle($params)
    {
        if (!$this->validateRectangleParams($params)) {
            throw new NotValidParamsException("Rectangle params not valid");
        }

        $pointLatitude = (float)$params['lat'];
        $pointLongitude = (float)$params['lon'];

        $rectangleLength = (float)$params['length'];
        $rectangleWidth = (float)$params['width'];

        $latitudeDiff = round($rectangleLength / 2 / self::WGS84_ZER0_LATITUDE_LENGTH, 5);
        $longitudeDiff = round($rectangleWidth / 2 / (self::WGS84_ZER0_LONGITUDE_LENGTH * cos(deg2rad($pointLatitude))), 5);

        $filterParams = [
            ':minLat' => $pointLatitude - $latitudeDiff,
            ':maxLat' => $pointLatitude + $latitudeDiff,
            ':minLon' => $pointLongitude - $longitudeDiff,
            ':maxLon' => $pointLongitude + $longitudeDiff,
        ];

        return $this->companyRepository->getByRectangle($filterParams);
    }

    /**
     * @param $params
     * @return bool
     */
    private function validateRectangleParams($params): bool
    {
        if (!$this->isValidLatitude((float)$params['lat'])) {
            return false;
        }

        if (!$this->isValidLongitude((float)$params['lon'])) {
            return false;
        }


        if (!$this->isValidLength((float)$params['length'])) {
            return false;
        }

        if (!$this->isValidLength((float)$params['width'])) {
            return false;
        }

        return true;
    }

    /**
     * @param $params
     * @return bool
     */
    private function validateRadiusParams($params): bool
    {
        if (!$this->isValidLatitude((float)$params['lat'])) {
            return false;
        }

        if (!$this->isValidLongitude((float)$params['lon'])) {
            return false;
        }

        if (!$this->isValidLength((float)$params['rad'])) {
            return false;
        }

        return true;
    }

    /**
     * @param $lat
     * @return bool
     */
    private function isValidLatitude($lat): bool
    {
        if ($lat > 90 || $lat < -90) {
            return false;
        }

        return true;
    }

    /**
     * @param $lon
     * @return bool
     */
    private function isValidLongitude($lon): bool
    {
        if ($lon > 180 || $lon < -180) {
            return false;
        }

        return true;
    }

    /**
     * @param $length
     * @return bool
     */
    private function isValidLength($length): bool
    {
        if ($length <= 0) {
            return false;
        }

        return true;
    }
}