## Ziel

Beschreibe kurz, welches Problem geloest wurde.

## Team-Kontext

- Team: `team-01` / `team-02` / `team-03` / `team-04` / `team-05` / `team-06` / `team-07` / `team-08`
- Arbeitsbranch: `team-XX/<thema-kurzname>`
- Verlinkte Aufgabe/Issue: #

## Architektur-Auswirkung

- [ ] Schichten bleiben getrennt (UI/Controller/Model bzw. API/DB)
- [ ] OOP-Prinzipien eingehalten (Kapselung, klare Verantwortlichkeiten)
- [ ] Keine neue Redundanz eingefuehrt

## Sicherheit

- [ ] Keine Secrets im Repo
- [ ] Keine unsicheren Defaults hinzugefuegt
- [ ] Fehlerantworten leaken keine internen Details

## Dokumentation

- [ ] Handbuch aktualisiert (Architektur/Prozess/Routine)
- [ ] Marschplan bei relevanten Aenderungen aktualisiert
- [ ] Changelog/Version angepasst

## Tests und Checks

- [ ] `bash scripts/validate-security.sh`
- [ ] `bash scripts/validate-architecture.sh`
- [ ] `bash scripts/validate-docs.sh`
- [ ] Relevante Laufzeittests (z. B. `bash scripts/test-services.sh`)

## Team-Workflow

- [ ] Aenderungen kommen aus Team-Branch oder Team-Feature-Branch (kein Direkt-Push auf `main`)
- [ ] Mindestens eine Review erfolgt (Lehrkraft oder benannter Team-Reviewer)
- [ ] CI-Checks in GitHub Actions sind gruen
