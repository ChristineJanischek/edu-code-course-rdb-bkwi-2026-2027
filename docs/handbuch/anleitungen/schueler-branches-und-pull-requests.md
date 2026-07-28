# Anleitung: Schueler-Workflow mit Team-Branches und Pull Requests

Version: 1.0
Status: Aktiv
Gueltig ab: 28.07.2026

---

## Ziel

Diese Anleitung zeigt Schritt fuer Schritt, wie du im Klassenrepository auf deinem Team-Branch arbeitest und Aenderungen als Pull Request vorschlaegst.

---

## Voraussetzungen

- Du hast Zugriff auf das Klassenrepository.
- Du arbeitest in deinem Codespace.
- Dein Team kennt seinen Team-Branch (`team-01` bis `team-08`).

---

## Grundregel

- Niemals direkt auf `main` arbeiten.
- Immer ueber Team-Branch + Pull Request.

---

## Schritt 1: Aktuellen Stand holen

```bash
git checkout main
git pull origin main
git fetch --all --prune
```

Warum? Du startest mit dem aktuellen, stabilen Stand.

---

## Schritt 2: Team-Branch wechseln

Beispiel fuer Team 3:

```bash
git checkout team-03
git pull origin team-03
```

Warum? Dein Team-Branch ist die gemeinsame Basis eurer Gruppe.

---

## Schritt 3: Eigenen Arbeitsbranch erstellen

Namensschema:

- `team-XX/<thema-kurzname>`

Beispiel:

```bash
git checkout -b team-03/sql-joins-uebung
```

Warum? So arbeitet jede Person isoliert, ohne andere Teammitglieder zu blockieren.

---

## Schritt 4: Aenderungen machen

- Dateien bearbeiten
- kurz lokal pruefen

Nutzliche Uebersicht:

```bash
git status
git diff
```

---

## Schritt 5: Pflichtchecks lokal ausfuehren

```bash
bash scripts/validate-security.sh
bash scripts/validate-architecture.sh
bash scripts/validate-docs.sh
```

Warum? Nur gruene Checks sollen in einen Pull Request gehen.

---

## Schritt 6: Commit erstellen

```bash
git add -A
git commit -m "feat(team-03): sql-joins aufgabe erweitert"
```

Commit-Regeln:

- kurz und praezise
- beschreibt, was wirklich geaendert wurde

---

## Schritt 7: Branch hochladen

```bash
git push -u origin team-03/sql-joins-uebung
```

Warum? Erst danach kann ein Pull Request erstellt werden.

---

## Schritt 8: Pull Request erstellen

In GitHub:

1. Repository oeffnen
2. Tab Pull Requests
3. New Pull Request
4. Base: `main`
5. Compare: dein Branch (`team-03/sql-joins-uebung`)
6. PR-Titel und Beschreibung ausfuellen
7. PR-Vorlage vollstaendig abhaken

Wichtig:

- Team angeben (`team-03`)
- Aufgabe/Issue verlinken, falls vorhanden

---

## Schritt 9: Feedback bearbeiten

Wenn im Review Aenderungen angefragt werden:

1. Lokal auf demselben Branch weiterarbeiten
2. Datei anpassen
3. Checks erneut starten
4. Neuer Commit
5. `git push`

Der Pull Request aktualisiert sich automatisch.

---

## Schritt 10: Nach Merge aufraeumen

Wenn dein PR gemerged wurde:

```bash
git checkout main
git pull origin main
git branch -d team-03/sql-joins-uebung
git push origin --delete team-03/sql-joins-uebung
```

Warum? Saubere Branch-Historie im Team.

---

## Typische Fehler und schnelle Loesung

1. Fehler: "Ich habe direkt auf main gearbeitet."
   Loesung: Sofort stoppen, neuen Branch erstellen, Aenderungen dorthin committen und als PR einreichen.

2. Fehler: "Mein Branch ist veraltet."
   Loesung:

```bash
git checkout main
git pull origin main
git checkout team-03/sql-joins-uebung
git merge main
```

3. Fehler: "Docs-Check ist rot."
   Loesung: Hinweis im Terminal lesen und die betroffenen Doku-Skripte ausfuehren.

---

## Mini-Checkliste vor dem Pull Request

- [ ] Ich arbeite nicht auf `main`.
- [ ] Mein Branchname folgt `team-XX/<thema-kurzname>`.
- [ ] Alle drei Pflichtchecks sind gruen.
- [ ] Commit-Nachricht ist klar.
- [ ] PR-Vorlage ist vollstaendig ausgefuellt.

---

## Verknuepfungen

- [README.md](../../README.md)
- [classroom-weiter-ablauf-fuer-schueler.md](classroom-weiter-ablauf-fuer-schueler.md)
- [classroom-weiter-arbeitsblatt.md](classroom-weiter-arbeitsblatt.md)
- [../prozesse/klassenrepository-team-workflow.md](../prozesse/klassenrepository-team-workflow.md)

---

## Changelog

- v1.0 (28.07.2026): Erstanlage der Schritt-fuer-Schritt-Anleitung fuer Team-Branch- und Pull-Request-Workflow.
