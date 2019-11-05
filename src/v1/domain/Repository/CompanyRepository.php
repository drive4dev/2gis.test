<?php
/**
 * Created by PhpStorm.
 * User: maggotik
 * Date: 11/4/19
 * Time: 6:28 PM
 */

namespace Domain\Repository;


class CompanyRepository extends BaseRepository
{
    public function getWithinRadius($filterParams)
    {
        $query = 'select c.id, c.name, c.phones
            from building as b 
            join company as c on b.id = c.building_id
            where
            b.latitude between :minLat and :maxLat
            and b.longitude between :minLon and :maxLon
          ';
        $statement = $this->getDb()->prepare($query);
        $statement->execute($filterParams);

        $companies = $statement->fetchAll(\PDO::FETCH_OBJ);
        return $companies;
    }
}