# edu-code-course-rdb
<!-- CENTRAL_ENTRYPOINT -->

Dieses Repository hat ab sofort einen klaren Portal-Einstieg mit zwei Zielgruppen.

## Zentraler Einstieg

1. Für Unterricht und Lernende: [generated/README.md](generated/README.md)
2. Für Pflege, Architektur und Prozesse: [docs/handbuch/README.md](docs/handbuch/README.md)

## Warum diese Struktur?

- Keine Suche über viele README-Dateien als Startpunkt
- Klare Trennung zwischen Lerninhalten und Repository-Governance
- Skalierbar, weil Unterseiten nur noch Bereichsdokumente sind

## Schnellzugriff Unterricht

- Stoffverlaufsplan (HTML): [generated/anleitungen/stoffverlaufsplan_rdb_3wochen.html](generated/anleitungen/stoffverlaufsplan_rdb_3wochen.html)
- Aufgaben VERSION1 (HTML): [generated/klassenarbeiten/KA02_2025_2026_VERSION1_aufg.html](generated/klassenarbeiten/KA02_2025_2026_VERSION1_aufg.html)
- Lösung VERSION1 (HTML): [generated/klassenarbeiten/KA02_2025_2026_VERSION1_lsg.html](generated/klassenarbeiten/KA02_2025_2026_VERSION1_lsg.html)

## Klassenbetrieb 2026-2027 (8 Teams)

Dieses Repository ist der konkrete Arbeitsraum fuer den Jahrgang BKWI 2026-2027.
Die dauerhaft gepflegte Kursvorlage bleibt im separaten Master-Repository `edu-code-course-rdb`.

Verbindlicher Arbeitsfluss im Klassenrepository:

1. `main` bleibt stabil und geschuetzt.
2. Team-Basisbranches `team-01` bis `team-08` werden einmalig angelegt.
3. Umsetzungen passieren auf `team-XX/<thema-kurzname>`.
4. Ueber Pull Requests wird nach `main` integriert.
5. Pflichtchecks und Lehrerfeedback erfolgen vor dem Merge.

Die konkrete Einrichtungs- und Betriebsroutine steht im Handbuch unter:
[docs/handbuch/prozesse/klassenrepository-team-workflow.md](docs/handbuch/prozesse/klassenrepository-team-workflow.md)

## Hinweis für Maintainer

Die fachliche SSOT für Inhalte liegt in der normalisierten Content-DB unter `data/content-db/`.
Abgeleitete Artefakte werden über die Skripte in `scripts/` generiert und validiert.

Template-Repositories und abgeleitete Schul-Repositories sollen Änderungen grundsätzlich als Voll-Repo-Merge von `upstream/main` übernehmen, nicht selektiv dateiweise. Die dazugehörige Routine ist in [generated/informationen/begrifflichkeiten/template-sync-routine.md](generated/informationen/begrifflichkeiten/template-sync-routine.md) beschrieben.

<!-- CUSTOM_LICENSE_NOTICE_START -->
## License

This repository is licensed under a custom license.

- Attribution required: Christine Janischek - https://emotionalspirit.de
- Non-commercial use only
- Use only within state school systems
- Any other use requires explicit prior written permission
<!-- CUSTOM_LICENSE_NOTICE_END -->
