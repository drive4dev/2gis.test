<?php

namespace Domain\Repository;

use Domain\Exception\NotFoundException;

class BuildingRepository extends BaseRepository
{
    public function getAttachedCompanies(int $id): array
    {
        $query = 'SELECT * FROM company WHERE building_id =:id';
        $statement = $this->getDb()->prepare($query);
        $statement->bindParam('id', $id);
        $statement->execute();

        $companies = $statement->fetchAll(\PDO::FETCH_OBJ);

        if (empty($companies)) {
            throw new NotFoundException('Companies not found', 404);
        }

        return $companies;
    }

    public function getList($limit, $offset)
    {
        $query = 'SELECT * from building order by id LIMIT :limit offset :offset';
        $statement = $this->getDb()->prepare($query);
        $statement->execute([':limit' => $limit, ':offset' => $offset]);

        $buildings = $statement->fetchAll(\PDO::FETCH_OBJ);

        if (empty($buildings)) {
            throw new NotFoundException('Buildings not found', 404);
        }

        return $buildings;
    }

}