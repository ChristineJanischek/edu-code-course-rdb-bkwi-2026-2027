# KF-ROUTINE-014: Kursinhalt gemeinsam mit Schuelerinnen und Schuelern (bkwi2) aufbauen

## Metadata
- **ID:** KF-ROUTINE-014
- **Kategorie:** kurzfristig
- **Haeufigkeit:** bei jeder kollaborativen Inhaltserstellungs-Session mit bkwi2
- **Zeitaufwand:** 30-60 Minuten
- **Verantwortlicher:** Lehrkraft + Schuelerinnen und Schueler bkwi2
- **Abhaengigkeiten:** KF-ROUTINE-006, KF-ROUTINE-013, classroom-weiter-ablauf-fuer-schueler.md
- **Version:** 1.0
- **Letzte Aktualisierung:** 28.07.2026

## Ziel
Schuelerinnen und Schueler der Klasse bkwi2 bringen sich aktiv in die Erstellung und Erweiterung des Kursinhalts ein. Sie erarbeiten eigene Aufgaben, Beispiele und Erklaerungen zu relationalen Datenbanken, die nach Pruefung durch die Lehrkraft in den Kurs aufgenommen werden.

## Vorbedingungen
- Klassenarbeits-Kontext: Repo ist geoeffnet, Branch ist aktuell.
- Schuelerinnen und Schueler kennen die weiter-Routine (classroom-weiter-ablauf-fuer-schueler.md).
- Lehrkraft hat die aktuelle Inhaltslage geprueft (teacher-ui.php oder weiter.sh).
- Zielthema fuer die Session ist klar benannt (z. B. EERM, 3NF, SQL-SELECT).

## Schritte

1. **Standortbestimmung:** Lehrkraft bespricht den aktuellen Lernstand mit bkwi2 und zeigt, welche Inhaltsbereiche noch fehlen oder vertieft werden sollen.
2. **Thema zuweisen:** Jede Schuelergruppe (2-3 Personen) erhaelt ein klar abgegrenztes Teilthema (z. B. eine SQL-Abfrage-Aufgabe, ein EERM-Modellierungsbeispiel oder eine 3NF-Erlaeuterung).
3. **Beitrag erstellen:** Schuelerinnen und Schueler erstellen ihren Inhaltsbeitrag mit dem Skript: `bash scripts/bkwi2-content-beitrag.sh --klasse bkwi2 --thema <thema> --titel "<titel>"`
4. **Selbstkontrolle:** Gruppe prueft den erzeugten Beitrag auf fachliche Korrektheit und Vollstaendigkeit.
5. **Qualitaetschecks ausfuehren:**
   - `bash scripts/validate-security.sh`
   - `bash scripts/validate-architecture.sh`
   - `bash scripts/validate-docs.sh`
6. **Peer-Review:** Eine andere Schuelergruppe prueft den Beitrag (Verstaendlichkeit, Fachkorrektheit).
7. **Lehrkraft-Freigabe:** Lehrkraft prueft und gibt den Beitrag fuer die Aufnahme frei oder gibt Rueckmeldung.
8. **Commit und Dokumentation:** Freigegebene Beitraege werden committet und im Inhaltsverzeichnis referenziert.

## Erfolgskriterien
- Jede Schuelergruppe hat mindestens einen fachlich korrekten Inhaltsbeitrag erstellt.
- Alle Pflichtchecks (Security, Architektur, Doku) sind erfolgreich.
- Der Beitrag ist unter `generated/uebungen/bkwi2/` abgelegt und im Inhaltskatalog referenziert.
- Peer-Review wurde durchgefuehrt und dokumentiert.
- Lehrkraft-Freigabe ist erteilt.

## Fehlerbehandlung
- Fachlicher Fehler im Beitrag: Gruppe korrigiert, Peer-Review wiederholen.
- Technischer Fehler beim Skript: Fehlermeldung lesen, Eingaben pruefen.
- Gate fehlgeschlagen: Ursache beheben, dann erneut ausfuehren.
- Beitrag wird nicht freigegeben: Lehrkraft gibt konkretes Feedback, Gruppe ueberarbeitet.

## Ausgaben/Ergebnisse
- Schueler-Inhaltsbeitrag als Markdown-Datei unter `generated/uebungen/bkwi2/`.
- Ausfuehrungs-Protokoll mit Zeitstempel unter `generated/bkwi2-beitraege/`.
- Referenz im Inhaltskatalog (`generated/content-catalog.json`) nach Freigabe.

## Verknuepfungen
- [KF-ROUTINE-006-qualitaetsgate-pruefung.md](./KF-ROUTINE-006-qualitaetsgate-pruefung.md)
- [KF-ROUTINE-013-repo-oop-mvc-guardrails.md](./KF-ROUTINE-013-repo-oop-mvc-guardrails.md)
- [classroom-weiter-ablauf-fuer-schueler.md](../../anleitungen/classroom-weiter-ablauf-fuer-schueler.md)
- [classroom-kursinhalt-bkwi2.md](../../anleitungen/classroom-kursinhalt-bkwi2.md)

## Changelog
- v1.0 (28.07.2026): Initiale Routine erstellt fuer kollaborativen Kursinhaltaufbau mit bkwi2
