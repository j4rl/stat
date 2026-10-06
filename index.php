<?php require __DIR__ . '/bootstrap.php'; ?>
<!doctype html>
<html lang="sv">
<head><meta charset="utf-8"><meta name="viewport" content="width=device-width,initial-scale=1"><title>j4rl / Appstatistik</title><link rel="stylesheet" href="style.css"><script src="app.js" defer></script></head>
<body>
<aside><a class="brand" href="index.php">j4rl<span> / stats</span></a><div class="nav-label">ÖVERSIKT</div><a class="nav active" href="#overview">◫ &nbsp; Appstatistik</a><div class="aside-note">Alla appar.<br>Ett ställe.<p>Statistik direkt från din databas.</p></div></aside>
<main id="overview">
<header><div><div class="eyebrow">J4RL.SE / ANALYS & RAPPORTER</div><h1>Appstatistik<span> / </span>j4rl.se</h1><p class="muted">Samlad rapport över konton, spel, quiz och svar.</p></div><div class="controls"><label for="period">Period</label><select id="period"><option value="7">Senaste 7 dagarna</option><option value="30" selected>Senaste 30 dagarna</option><option value="90">Senaste 90 dagarna</option><option value="365">Senaste året</option><option value="all">Alla tider</option></select><button id="refresh">↻ Uppdatera</button></div></header>
<div id="message" role="status" aria-live="polite">Hämtar statistik…</div>
<section id="summary" class="summary" aria-label="Sammanfattning"></section>
<section class="panel"><div class="panel-head"><div><h2>Aktivitet över tid</h2><p class="muted" id="chart-note">Ett mått per app • dag för dag</p></div><label>App <select id="chart-app"></select></label></div><div id="chart" class="chart" role="img"></div><div class="chart-footer" id="chart-footer"></div></section>
<div class="section-heading"><h2>Appöversikt</h2><input id="search" type="search" placeholder="Sök app…" aria-label="Sök app"></div>
<section id="apps" class="app-grid"></section>
<footer><span id="updated"></span><p>Konton summeras per app och är inte unika personer. Deltagartillfällen kan avse samma person flera gånger. Saknad statistik visas som —. Perioden räknas i databasens tidszon.</p></footer>
</main></body></html>
