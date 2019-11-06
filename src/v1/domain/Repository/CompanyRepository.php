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
    public function getByBuildingId(int $id): array
    {
        $query = 'SELECT * FROM company WHERE building_id =:id';
        $statement = $this->getDb()->prepare($query);
        $statement->bindParam('id', $id);
        $statement->execute();

        return $statement->fetchAll(\PDO::FETCH_OBJ);
    }

    public function getByCategoryId(int $id): array
    {
        $query = "select c.id, c.name, c.phones, b.address
                      from company_category  as cc
	                  join company as c on cc.company_id = c.id
	                  join building as b on c.building_id = b.id
                  where category_id = :category_id";
        $statement = $this->getDb()->prepare($query);
        $statement->bindParam('category_id', $id);
        $statement->execute();

        return $statement->fetchAll(\PDO::FETCH_OBJ);
    }

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

        return $statement->fetchAll(\PDO::FETCH_OBJ);
    }
}