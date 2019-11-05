<?php
/**
 * Created by PhpStorm.
 * User: maggotik
 * Date: 11/4/19
 * Time: 6:30 PM
 */

namespace Domain\Entity;


class Company
{
    private $id;
    private $name;
    private $building_id;
    private $phones;

    public function getId()
    {
        return $this->id;
    }

    public function getName()
    {
        return $this->name;
    }

    public function getBuildingId()
    {
        return $this->building_id;
    }

    public function getPhones()
    {
        return $this->building_id;
    }
}