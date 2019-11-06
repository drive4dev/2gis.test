<?php

namespace Domain\Repository;


abstract class BaseRepository
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