<?php

namespace Domain\Repository;


abstract class BaseRepository implements RepositoryInterface
{
    protected $db;

    public function __construct(\PDO $db)
    {
        $this->db = $db;
    }

    protected function getDb()
    {
        return $this->db;
    }
}