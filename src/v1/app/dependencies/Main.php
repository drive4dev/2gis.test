<?php

use Psr\Container\ContainerInterface;

return array_merge([
    'db' => function (ContainerInterface $container): PDO {
        $db = $container->get('settings')['db'];

        $connection = sprintf("pgsql:host=%s;port=%d;dbname=%s;user=%s;password=%s",
            $db['host'],
            $db['port'],
            $db['dbname'],
            $db['user'],
            $db['password']);

        $pdo = new PDO($connection);

        return $pdo;
    }],
    require __DIR__ . '/Repositories.php',
    require __DIR__ . '/Services.php',
    require __DIR__ . '/Controllers.php'
);