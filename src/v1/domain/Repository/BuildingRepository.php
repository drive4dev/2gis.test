<?php

namespace Domain\Repository;


use Domain\Entity\Building;

class BuildingRepository extends BaseRepository
{
    /**
     * @param $id
     * @return Building|null
     */
    public function getById($id)
    {
        $query = 'SELECT * FROM building WHERE id = :id';
        $statement = $this->getDb()->prepare($query);
        $statement->bindParam(':id', $id);
        $statement->execute();

        $statement->setFetchMode(\PDO::FETCH_CLASS, Building::class );
        return $statement->fetch();
    }

    /**
     * @return array
     */
    public function getList(): array
    {
        $query = 'SELECT * from building order by id';
        $statement = $this->getDb()->prepare($query);
        $statement->execute();

        return $statement->fetchAll(\PDO::FETCH_CLASS, Building::class);
    }

}