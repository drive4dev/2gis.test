<?php

namespace Domain\Entity;


class Category
{
    private $id;
    private $name;
    private $lft;
    private $rgt;
    private $level;


    public function getId()
    {
        return $this->id;
    }

    public function getName()
    {
        return $this->name;
    }

    public function getLft()
    {
        return $this->lft;
    }

    public function getRgt()
    {
        return $this->rgt;
    }

    public function getLevel()
    {
        return $this->level;
    }

}