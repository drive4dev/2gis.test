<?php

namespace App\Controllers;

use Psr\Container\ContainerInterface;
use Slim\Http\Request;
use Slim\Http\Response;

abstract class BaseController
{
    /**
     * @var ContainerInterface
     */
    protected $container;

    /**
     * @var Request
     */
    protected $request;

    /**
     * @var Response
     */
    protected $response;

    /**
     * @var array
     */
    protected $args;

    public function __construct(ContainerInterface $container)
    {
        $this->container = $container;
    }

    protected function setParams(Request $request, Response $response, array $args)
    {
        $this->request = $request;
        $this->response = $response;
        $this->args = $args;
    }

    protected function jsonResponse(string $status, $message, int $code):  Response
    {
        $result = [
            'code' => $code,
            'status' => $status,
            'message' => $message,
        ];
        return $this->response->withJson($result, $code, JSON_PRETTY_PRINT);
    }
}