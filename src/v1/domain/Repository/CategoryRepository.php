<?php

namespace Domain\Repository;


use Domain\Entity\Category;

class CategoryRepository extends BaseRepository
{
    /**
     * @param int $id
     * @return Category|null
     */
    public function getById(int $id)
    {
        $query = 'SELECT * FROM category where id =:id';
        $statement = $this->getDb()->prepare($query);
        $statement->bindParam(':id', $id);
        $statement->execute();
        $statement->setFetchMode(\PDO::FETCH_CLASS, Category::class);

        return $statement->fetch();
    }


    /**
     * @return array
     */
    public function getAll(): array
    {
        $query = 'SELECT * FROM category ORDER BY lft';
        $statement = $this->getDb()->prepare($query);
        $statement->execute();

        return $statement->fetchAll(\PDO::FETCH_CLASS, Category::class);
    }

    /**
     * @param int $id
     * @return array
     */
    public function getWithChildren(int $id): array
    {
        $parent = $this->getById($id);

        if (!$parent) {
            return [];
        }

        $query = 'SELECT * FROM category WHERE lft >= :lft AND rgt <= :rgt ORDER BY lft';
        $statement = $this->getDb()->prepare($query);
        $statement->execute([
            ':lft' => $parent->lft,
            ':rgt' => $parent->rgt
        ]);

        return $statement->fetchAll(\PDO::FETCH_CLASS, Category::class);
    }

    /**
     * @param int $id
     * @return array
     */
    public function getChildren(int $id): array
    {
        $parent = $this->getById($id);

        if (!$parent) {
            return [];
        }

        $query = 'SELECT * FROM category WHERE lft > :lft AND rgt < :rgt ORDER BY lft';
        $statement = $this->getDb()->prepare($query);
        $statement->execute([
            ':lft' => $parent->lft,
            ':rgt' => $parent->rgt
        ]);

        return $statement->fetchAll(\PDO::FETCH_CLASS, Category::class);
    }

}