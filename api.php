<?php
require __DIR__ . '/bootstrap.php';
header('Content-Type: application/json; charset=utf-8');
date_default_timezone_set('Europe/Stockholm');
$days = $_GET['days'] ?? '30';
if (!is_string($days) || !in_array($days, ['7', '30', '90', '365', 'all'], true)) {
    http_response_code(400); exit(json_encode(['error' => 'Ogiltig period.']));
}
try {
    mysqli_report(MYSQLI_REPORT_ERROR | MYSQLI_REPORT_STRICT);
    $db = new mysqli($config['db_host'], $config['db_user'], $config['db_password'], $config['db_name'], $config['db_port']);
    $db->set_charset('utf8mb4');
    $stmt = $db->prepare('SET time_zone = ?');
    $stmt->bind_param('s', $config['db_timezone']); $stmt->execute();
    $tables = [];
    foreach ($db->query('SHOW TABLES') as $row) $tables[array_values($row)[0]] = true;
    // Kalenderdagar i databasens konfigurerade tidszon.
    $today = $db->query('SELECT CURRENT_DATE AS d')->fetch_assoc()['d'];
    $zone = new DateTimeZone($config['db_timezone']);
    $end = (new DateTimeImmutable($today, $zone))->modify('+1 day');
    $start = $days === 'all' ? null : $end->modify('-' . (int)$days . ' days');
    $chartStart = $days === 'all' ? $end->modify('-30 days') : $start;
    $apps = json_decode(file_get_contents(__DIR__ . '/metrics.json'), true, 512, JSON_THROW_ON_ERROR);
    foreach ($apps as &$app) {
        $app['available'] = false;
        $app['series'] = [];
        $series = [];
        foreach ($app['metrics'] as $i => &$metric) {
            $metric['total'] = null; $metric['period'] = null;
            if (!isset($tables[$metric['table']])) continue;
            $app['available'] = true;
            // Identifierare och villkor kommer enbart från den lokala registret.
            $table = '`' . $metric['table'] . '`';
            $aggregate = $metric['sum'] ? 'COALESCE(SUM(`' . $metric['sum'] . '`),0)' : 'COUNT(*)';
            $where = $metric['where'] ? ' WHERE ' . $metric['where'] : ' WHERE 1=1';
            $metric['total'] = (int)$db->query("SELECT $aggregate AS n FROM $table $where")->fetch_assoc()['n'];
            if ($metric['date']) {
                $date = '`' . $metric['date'] . '`';
                if ($start) {
                    $stmt = $db->prepare("SELECT $aggregate AS n FROM $table $where AND $date >= ? AND $date < ?");
                    $a = $start->format('Y-m-d'); $b = $end->format('Y-m-d');
                    $stmt->bind_param('ss', $a, $b); $stmt->execute();
                    $metric['period'] = (int)$stmt->get_result()->fetch_assoc()['n'];
                } else $metric['period'] = $metric['total'];
                // Ett tydligt mått per app, inte summering av olika händelsetyper.
                if ($i === (count($app['metrics']) > 1 ? 1 : 0)) {
                    $app['activity_label'] = $metric['label'];
                    $stmt = $db->prepare("SELECT DATE($date) AS d, $aggregate AS n FROM $table $where AND $date >= ? AND $date < ? GROUP BY DATE($date) ORDER BY d");
                    $a = $chartStart->format('Y-m-d'); $b = $end->format('Y-m-d');
                    $stmt->bind_param('ss', $a, $b); $stmt->execute();
                    foreach ($stmt->get_result() as $row) $series[$row['d']] = (int)$row['n'];
                }
            }
        }
        unset($metric);
        for ($d = $chartStart; $d < $end; $d = $d->modify('+1 day')) {
            $key = $d->format('Y-m-d');
            $app['series'][] = ['date' => $key, 'value' => $series[$key] ?? 0];
        }
    }
    unset($app);
    echo json_encode(['apps'=>$apps, 'days'=>$days, 'generated_at'=>date(DATE_ATOM),
        'timezone'=>$config['db_timezone'], 'chart_days'=>$days === 'all' ? 30 : (int)$days], JSON_UNESCAPED_UNICODE | JSON_THROW_ON_ERROR);
} catch (Throwable $e) {
    error_log('Stats dashboard: ' . $e->getMessage());
    http_response_code(503);
    echo json_encode(['error'=>'Statistiken kunde inte hämtas. Kontrollera anslutning, tabeller och serverns fellogg.']);
}
