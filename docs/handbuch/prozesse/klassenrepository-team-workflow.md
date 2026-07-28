# Klassenrepository-Team-Workflow (8 Teams)

## Ziel

Dieses Dokument legt den verbindlichen Arbeitsablauf fuer den Jahrgang BKWI 2026-2027 fest.
Das Klassenrepository bleibt der zentrale Integrationspunkt. Teams entwickeln isoliert und liefern kontrolliert per Pull Request.

## Geltungsbereich

- Repository: `edu-code-course-rdb-bkwi-2026-2027`
- Teams: `team-01` bis `team-08`
- Zielbild: `main` stabil, nachvollziehbare Aenderungen, reproduzierbare Qualitaetspruefung

## Rollen

- Lehrkraft: Repository-Owner, Freigabeinstanz fuer Merges nach `main`
- Team: entwickelt Features auf Team-Branches
- Reviewer: Team-intern oder Lehrkraft, mindestens eine aktive Review je Pull Request

## Branch-Modell

1. `main` ist der geschuetzte Integrationsbranch.
2. Pro Team existiert ein dauerhafter Basisbranch:
   - `team-01`
   - `team-02`
   - `team-03`
   - `team-04`
   - `team-05`
   - `team-06`
   - `team-07`
   - `team-08`
3. Fuer Aufgaben wird immer ein Team-Feature-Branch genutzt:
   - Schema: `team-XX/<thema-kurzname>`
   - Beispiel: `team-03/sql-join-uebungen`

## Technische Einmal-Einrichtung

### 1) Team-Basisbranches anlegen

Lokales Hilfsskript ausfuehren:

```bash
bash scripts/setup-team-branches.sh --push
```

Optional mit anderem Prefix oder Team-Anzahl:

```bash
bash scripts/setup-team-branches.sh --push --count 8 --prefix team
```

### 2) Branch-Schutz fuer `main` in GitHub setzen

Empfohlene Einstellungen in `Settings -> Branches -> Branch protection rules`:

- Require a pull request before merging
- Require approvals: mindestens 1
- Require status checks to pass before merging:
  - `policy-and-docs`
  - `python-quality`
  - `web-quality`
- Require conversation resolution before merging
- Include administrators aktivieren
- Optional: Restrict who can push to matching branches (nur Lehrkraft/Administratoren)

## Standardablauf fuer Teams

1. Team erstellt Branch aus Team-Basisbranch oder `main`:
   - `git checkout -b team-05/neue-aufgabe team-05`
2. Team arbeitet im Branch und committet in kleinen, klaren Schritten.
3. Team pusht den Branch nach GitHub.
4. Team erstellt Pull Request nach `main`.
5. Pull Request wird mit dem PR-Template vollstaendig ausgefuellt.
6. Pflichtchecks laufen automatisch in GitHub Actions.
7. Review + Lehrerfeedback.
8. Merge nach `main` erst bei gruenen Checks und freigegebener Review.

## Pflichtchecks vor jedem Merge

Lokal (vor dem Push):

```bash
bash scripts/validate-security.sh
bash scripts/validate-architecture.sh
bash scripts/validate-docs.sh
```

CI (automatisch in GitHub Actions):

- Security/Architecture/Docs-Gates
- Python-Lint und Python-Sicherheitspruefung
- JavaScript- und PHP-Syntaxpruefung

## Merge-Regeln

- Kein Direkt-Push auf `main`
- Kein Merge bei roten Pflichtchecks
- Kein Merge ohne Review
- Kein Geheimniswert in Commits oder Pull Requests

## Konfliktbehandlung

1. Team aktualisiert den eigenen Branch mit dem aktuellen Stand aus `main`.
2. Konflikte werden im Team geloest.
3. Erneut lokale Pflichtchecks ausfuehren.
4. Pull Request aktualisieren und erneut reviewen lassen.

## Erfolgskriterien

- `main` bleibt jederzeit lauffaehig und dokumentiert
- Jede Aenderung ist ueber Pull Request rueckverfolgbar
- Alle 8 Teams koennen parallel arbeiten, ohne den Integrationsbranch zu destabilisieren

## Verknuepfungen

- [README.md](../../../README.md)
- [prozesse/review-prozess.md](review-prozess.md)
- [prozesse/qualitaets-gates-automatisierung.md](qualitaets-gates-automatisierung.md)
- [routinen/kurzfristig/KF-ROUTINE-006-qualitaetsgate-pruefung.md](../routinen/kurzfristig/KF-ROUTINE-006-qualitaetsgate-pruefung.md)
