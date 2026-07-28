# Classroom-Anleitung: Kursinhalt gemeinsam aufbauen (bkwi2)

Version: 1.0
Status: Aktiv
Gueltig ab: 28.07.2026

---

## Zielgruppe

Schuelerinnen und Schueler der Klasse bkwi2, die gemeinsam mit der Lehrkraft Kursinhalte zu relationalen Datenbanken erstellen, erweitern und verbessern.

---

## Ziel der Routine

Schuelerinnen und Schueler erarbeiten eigenstaendig fachlich korrekte Inhaltsbeitraege (Aufgaben, Beispiele, Erklaerungen) zu einem vorgegebenen RDB-Thema. Diese Beitraege werden nach Peer-Review und Lehrkraft-Freigabe in den Kurs aufgenommen.

---

## Didaktischer Ablauf in Schritten

| Schritt | Ausgangspunkt | Ziel | Zweck |
|---|---|---|---|
| 1. Themenwahl | Die Lehrkraft nennt offene Inhaltsbereiche. | Thema fuer die eigene Gruppe auswaehlen. | Eigenverantwortung und Interessenorientierung foerdern. |
| 2. Gruppenarbeit | Thema ist zugeteilt. | Inhaltsbeitrag gemeinsam erarbeiten. | Kooperatives Lernen und fachlichen Austausch foerdern. |
| 3. Beitrag erstellen | Entwurf liegt vor. | Skript ausfuehren und Beitrag anlegen. | Handlungsorientiertes Arbeiten mit echtem Ergebnis. |
| 4. Selbstkontrolle | Beitrag wurde erzeugt. | Fachliche und formale Korrektheit pruefen. | Qualitaetsbewusstsein staerken. |
| 5. Qualitaetschecks | Beitrag ist lokal vorhanden. | Pflichtchecks erfolgreich ausfuehren. | Projektstandards einhalten. |
| 6. Peer-Review | Beitrag ist geprueft. | Eine andere Gruppe gibt Rueckmeldung. | Argumentative und fachliche Kompetenz trainieren. |
| 7. Lehrkraft-Freigabe | Peer-Review ist abgeschlossen. | Lehrkraft nimmt Beitrag an oder gibt Feedback. | Verbindliche Qualitaetssicherung sicherstellen. |
| 8. Abschluss | Freigabe ist erteilt. | Commit und Dokumentation. | Berufsschulnahe Arbeitsweise mit Versionierung ueben. |

---

## Konkrete Befehlsfolge fuer Schuelerinnen und Schueler

1. Thema mit der Lehrkraft absprechen
2. Beitrag erstellen:
   ```
   bash scripts/bkwi2-content-beitrag.sh --klasse bkwi2 --thema <thema> --titel "<titel>"
   ```
   Beispiele:
   ```
   bash scripts/bkwi2-content-beitrag.sh --klasse bkwi2 --thema eerm --titel "Bibliothek EERM"
   bash scripts/bkwi2-content-beitrag.sh --klasse bkwi2 --thema 3nf --titel "Schuelerdaten normalisieren"
   bash scripts/bkwi2-content-beitrag.sh --klasse bkwi2 --thema sql-select --titel "Abfrage Kursliste"
   ```
3. Erzeugten Beitrag oeffnen und inhaltlich ausarbeiten
4. Pflichtchecks ausfuehren:
   ```
   bash scripts/validate-security.sh
   bash scripts/validate-architecture.sh
   bash scripts/validate-docs.sh
   ```
5. Peer-Review durch andere Gruppe
6. Lehrkraft informieren und Freigabe einholen

---

## Lehrplanrelevante Kompetenzen

- Fachkompetenz: Fachgerechte Darstellung von RDB-Inhalten (EERM, 3NF, SQL)
- Methodenkompetenz: Strukturiertes Erstellen und Dokumentieren von Lerninhalten
- Sozialkompetenz: Kooperatives Arbeiten in Gruppen und konstruktives Peer-Feedback
- Selbstkompetenz: Eigenverantwortliche Qualitaetssicherung und Reflexion

---

## Erfolgskriterien fuer Schuelerinnen und Schueler

1. Ein fachlich korrekter Inhaltsbeitrag liegt als Markdown-Datei vor.
2. Die drei Pflichtchecks laufen erfolgreich.
3. Das Peer-Review ist dokumentiert.
4. Die Lehrkraft-Freigabe wurde erteilt.
5. Der Beitrag ist korrekt abgelegt und referenziert.

---

## Reflexionsfragen fuer den Unterricht

1. Was hat euch bei der Erstellung des Beitrags besonders herausgefordert?
2. Welche fachlichen Erkenntnisse habt ihr beim Ausarbeiten des Inhalts gewonnen?
3. Was habt ihr durch das Peer-Review einer anderen Gruppe gelernt?
4. Wie koennte euer Beitrag beim naechsten Mal noch besser werden?

---

## Tipps fuer Schuelerinnen und Schueler

- Fangt mit einem klar abgegrenzten Teilthema an, nicht mit einem zu breiten Bereich.
- Nutzt Beispiele aus dem echten Schulalltag (z. B. Stundenplan, Buecherverwaltung).
- Beim Peer-Review: konkrete, konstruktive Rueckmeldungen geben, nicht nur "gut" oder "schlecht".
- Wenn ein Pflichtcheck fehlschlaegt: Fehlermeldung genau lesen und verstehen, bevor ihr etwas aendert.

---

## Changelog

- v1.0 (28.07.2026): Erstanlage der Classroom-Anleitung fuer kollaborativen Kursinhaltaufbau mit bkwi2.
