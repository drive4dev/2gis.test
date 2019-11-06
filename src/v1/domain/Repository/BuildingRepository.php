<?php

namespace Domain\Repository;

use Domain\Exception\NotFoundException;

class BuildingRepository extends BaseRepository
{
    public function getList($limit, $offset) : array
    {
        $query = 'SELECT * from building order by id LIMIT :limit offset :offset';
        $statement = $this->getDb()->prepare($query);
        $statement->execute([':limit' => $limit, ':offset' => $offset]);

         return $statement->fetchAll(\PDO::FETCH_OBJ);
    }

}