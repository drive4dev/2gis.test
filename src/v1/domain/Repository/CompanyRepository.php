<?php
/**
 * Created by PhpStorm.
 * User: maggotik
 * Date: 11/4/19
 * Time: 6:28 PM
 */

namespace Domain\Repository;


use Domain\Entity\Company;

class CompanyRepository extends BaseRepository
{

    /**
     * @param int $id
     * @return Company|null
     */
    public function getById(int $id)
    {
        $query = 'SELECT * FROM company WHERE id=:id';
        $statement = $this->getDb()->prepare($query);
        $statement->bindParam('id', $id);
        $statement->execute();
        $statement->setFetchMode(\PDO::FETCH_CLASS, Company::class);

        return $statement->fetch();
    }

    /**
     * @param int $id
     * @return array
     */
    public function getByBuildingId(int $id): array
    {
        $query = 'SELECT * FROM company WHERE building_id =:id';
        $statement = $this->getDb()->prepare($query);
        $statement->bindParam('id', $id);
        $statement->execute();

        return $statement->fetchAll(\PDO::FETCH_CLASS, Company::class);
    }

    /**
     * @param array $ids
     * @return array
     */
    public function getByCategoryId(array $ids): array
    {
        $query = "select c.*
                      from company_category  as cc
	                  join company as c on cc.company_id = c.id
	                  join building as b on c.building_id = b.id
                  where category_id in (" . implode(', ', $ids) . ")
                  order by c.id
                  ";

        $statement = $this->getDb()->prepare($query);
        $statement->execute();

        return $statement->fetchAll(\PDO::FETCH_CLASS, Company::class);
    }

    /**
     * @param array $filterParams
     * @return array
     */
    public function getWithinRadius(array $filterParams): array
    {

        $query = 'select c.* from building as b
          join company as c on b.id = c.building_id
          where
          (63781 * 
            acos(sin(:centerLatitude) * sin(radians(b.latitude)) + cos(:centerLatitude) * cos(radians(b.latitude)) * cos(:centerLongitude - radians(b.longitude)))
          < :distance)
        ';

        $statement = $this->getDb()->prepare($query);
        $statement->execute($filterParams);

        $companies = $statement->fetchAll(\PDO::FETCH_CLASS, Company::class);
        return $companies;
    }

    public function getByRectangle(array $filterParams): array
    {
        $query = 'select c.*
            from building as b 
            join company as c on b.id = c.building_id
            where
            b.latitude between :minLat and :maxLat
            and b.longitude between :minLon and :maxLon
          ';

        $statement = $this->getDb()->prepare($query);
        $statement->execute($filterParams);

        return $statement->fetchAll(\PDO::FETCH_CLASS, Company::class);
    }

}