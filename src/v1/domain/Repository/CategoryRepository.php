<?php

namespace Domain\Repository;


use Domain\Exception\NotFoundException;

class CategoryRepository extends BaseRepository
{
    public function getAttachedCompanies(int $id): array
    {
        $query = "select c.id, c.name, c.phones, b.address
                      from company_category  as cc
	                  join company as c on cc.company_id = c.id
	                  join building as b on c.building_id = b.id
                  where category_id = :category_id";
        $statement = $this->getDb()->prepare($query);
        $statement->bindParam('category_id', $id);
        $statement->execute();

        $companies = $statement->fetchAll(\PDO::FETCH_OBJ);

        if (empty($companies)) {
            throw new NotFoundException('Companies not found');
        }

        return $companies;
    }
}