<?php

namespace Domain\Repository;


abstract class BaseRepository
{
    protected $db;

    /**
     * BaseRepository constructor.
     * @param \PDO $db
     */
    public function __construct(\PDO $db)
    {
        $this->db = $db;
    }

    /**
     * @return \PDO
     */
    protected function getDb() : \PDO
    {
        return $this->db;
    }
}