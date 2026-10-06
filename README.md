# j4rl / stats
Fristående responsiv dashboard i PHP, MySQLi, HTML, CSS och vanilla JavaScript. Inga externa paket eller CDN krävs. Databasen ändras inte.

## Installation
1. Kräver PHP 8.1+ med mysqli och mysqlnd, samt MySQL/MariaDB.
2. Ladda upp mappen till exempelvis https://j4rl.se/stats/.
3. Kopiera config.example.php till config.php. Fyll i databasuppgifterna och admin_user.
4. Generera lösenordshash på en dator med PHP:
   php -r "echo password_hash('DITT-LÖSENORD', PASSWORD_DEFAULT), PHP_EOL;"
   Klistra in hashen i admin_password_hash.
5. Ange db_timezone efter hur apparnas datum lagras. Standard +00:00. Fasta UTC-offsets tar inte automatiskt hänsyn till sommartid; namnet Europe/Stockholm kräver installerade MySQL-tidszontabeller.
6. Öppna index.php över HTTPS och logga in via webbläsarens inloggningsruta.

Använd en separat databasuser med endast SELECT-rättighet på relevanta tabeller. Ingen import av SQL-filen behövs när tabellerna redan finns. SQL-dumpen och dess personuppgifter ingår inte i paketet.
HTTP Basic-auth måste skickas vidare av webbhotellets PHP-konfiguration. Om inloggningsrutan återkommer trots rätt lösenord, kontrollera detta hos webbhotellet.
config.php innehåller hemligheter och ska inte läggas i publikt Git. Stäng av display_errors i produktion.

## Vad mäts?
Alla kort visar totalt antal samt antal i perioden. 7/30/90/365 dagar omfattar dagens kalenderdag och föregående dagar i databasens tidszon. Alla tider visar totaler och ett aktivitetsdiagram för de senaste 30 dagarna.
- Cornhole: konton, sparade matcher, fristående spelarprofiler och kastomgångar. ch_player_stats summeras inte eftersom samma match kan räknas för flera spelare.
- Skjutdagbok: konton, skjutpass (session_date), serier, vapen och SUM(shot_count).
- Jolt: konton, startade spel (status != lobby), avslutade spel (finished), quiz, deltagartillfällen, svar och tipspromenader.
- Meme: bara konton. Skapade memes går inte att räkna från denna dump.
- Mölkky: konton och sparade spel. Spelarnas JSON läses inte.
- Yatzy: konton och sparade avslutade spel, räknade efter finished_at. Diagrammet visar avslutade spel per dag. Spelarnas JSON används inte för att räkna unika personer.
- Puls: konton, publicerade frågor, svar, sparade mallar och frågeserier. Frågeserier har inget datumfält och kan därför endast visas totalt.

Konton är inte unika personer mellan appar. Deltagarrader i Jolt är deltagartillfällen. Ingen gemensam totalsiffra för "spel" blandar quiz, skjutpass och omröstningar.
Jolts promenadsvar räknas efter updated_at. Det visar nuvarande svarsrader som senast ändrats i perioden. Ingen historik över tidigare ändringar finns.
Aktivitetsdiagrammet visar ett valt mått per app: matcher, skjutpass, startade Jolt-spel, Meme-konton, Mölkky-spel publicerade Puls-frågor eller avslutade Yatzy-spel. Datumfält som saknar värden kan inte placeras i diagrammet.
Om lagrade poster har raderats är siffrorna statistik över kvarvarande data, inte kompletta historiska livstidstal.

## Anpassa och drift
metrics.json definierar mått, tabeller, datum och eventuella SUM-fält. where är betrodd lokal SQL, aldrig användarinput. Saknade tabeller visas som — och bidrar inte till totalerna. En befintlig tom tabell visas som 0. Ändrade kolumnnamn kräver ändring i registret.
Ingen automatisk polling; Uppdatera hämtar aktuella data. Vanliga COUNT/SUM och datumgrupperingar körs vid varje hämtning. Vid stora datamängder bör datumfälten indexeras och ett servercachelager övervägas.
Endast aggregerad statistik lämnar API:t. Namn, mejl, lösenordshashar, svarstext och vapenuppgifter hämtas inte.

## Verifiering
JavaScriptets syntax och måttens tabell-/kolumnreferenser är kontrollerade mot de bifogade SQL-filernas scheman. PHP- och databasprov behöver köras på ditt webbhotell: denna leveransmiljö har ingen PHP/MySQL-server.
Kontrollera vid installation att rätt period ger förväntade värden, att felaktig inloggning nekas och att en saknad tabell visas som —.
