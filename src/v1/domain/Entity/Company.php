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
    /**
     * @property int $id
     */
    public $id;

    /**
     * @property string $name
     */
    public $name;

    /**
     * @property int $building_id
     */
    public $building_id;

    /**
     * @property string $phones
     */
    public $phones;
}