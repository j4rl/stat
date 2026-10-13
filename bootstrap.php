<?php
declare(strict_types=1);
header('Cache-Control: no-store');
header('X-Content-Type-Options: nosniff');
header('Referrer-Policy: same-origin');
header("Content-Security-Policy: default-src 'self'; script-src 'self'; style-src 'self'; connect-src 'self'; img-src 'self' data:; base-uri 'none'; frame-ancestors 'none'");
if (!is_file(__DIR__ . '/config.php')) {
    http_response_code(503);
    exit('Kopiera config.example.php till config.php och fyll i databasanslutningen.');
}
$config = require __DIR__ . '/config.php';
