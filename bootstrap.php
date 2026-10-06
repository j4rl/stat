<?php
declare(strict_types=1);
header('Cache-Control: no-store');
header('X-Content-Type-Options: nosniff');
header('Referrer-Policy: same-origin');
header("Content-Security-Policy: default-src 'self'; script-src 'self'; style-src 'self'; connect-src 'self'; img-src 'self' data:; base-uri 'none'; frame-ancestors 'none'");
if (!is_file(__DIR__ . '/config.php')) {
    http_response_code(503);
    exit('Kopiera config.example.php till config.php och fyll i anslutning och lösenordshash.');
}
$config = require __DIR__ . '/config.php';
if (empty($config['admin_password_hash'])) {
    http_response_code(503);
    exit('Ange admin_password_hash i config.php först.');
}
if (!hash_equals($config['admin_user'], $_SERVER['PHP_AUTH_USER'] ?? '') ||
    !password_verify($_SERVER['PHP_AUTH_PW'] ?? '', $config['admin_password_hash'])) {
    header('WWW-Authenticate: Basic realm="j4rl statistik", charset="UTF-8"');
    http_response_code(401);
    exit('Inloggning krävs.');
}
