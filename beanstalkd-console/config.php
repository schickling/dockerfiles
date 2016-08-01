<?php

$GLOBALS['config'] = array(
    /**
     * List of servers available for all users
     */
    'servers' => array(/* 'Local Beanstalkd' => 'beanstalk://localhost:11300', ... */),
    /**
     * Saved samples jobs are kept in this file, must be writable
     */
    'storage' => dirname(__FILE__) . DIRECTORY_SEPARATOR . 'storage.json',
    /**
     * Optional Basic Authentication
     */
    'auth' => array(
        'enabled' => getenv('AUTH') == 'enable' ? true : false,
        'username' => getenv('AUTH_USERNAME') ?: 'admin',
        'password' => getenv('AUTH_PASSWORD') ?: 'password',
    ),
    /**
     * Version number
     */
    'version' => '1.7.4',
);

