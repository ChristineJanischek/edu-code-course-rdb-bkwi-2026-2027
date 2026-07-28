#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(git rev-parse --show-toplevel 2>/dev/null || pwd)"
cd "$ROOT_DIR"

usage() {
  cat <<'EOF'
Nutzung:
  bash scripts/bkwi2-content-beitrag.sh --klasse <klasse> --thema <thema> --titel "<titel>" [--output <datei>]

Erlaubte Themen:
  eerm         ER-Erweitert-Modellierung (Entity-Relationship)
  3nf          Dritte Normalform
  sql-select   SQL SELECT-Abfragen
  sql-join     SQL JOIN-Abfragen
  sql-ddl      SQL DDL (CREATE TABLE, ALTER TABLE)
  sql-dml      SQL DML (INSERT, UPDATE, DELETE)
  allgemein    Sonstiges RDB-Thema

Beispiele:
  bash scripts/bkwi2-content-beitrag.sh --klasse bkwi2 --thema eerm --titel "Bibliothek EERM"
  bash scripts/bkwi2-content-beitrag.sh --klasse bkwi2 --thema 3nf --titel "Schuelerdaten normalisieren"
  bash scripts/bkwi2-content-beitrag.sh --klasse bkwi2 --thema sql-select --titel "Abfrage Kursliste"

Wirkung:
  - Legt eine strukturierte Inhaltsbeitrag-Vorlage an
  - Erzeugt ein Protokoll unter generated/bkwi2-beitraege/
  - Gibt den Pfad der erzeugten Datei aus
EOF
}

KLASSE=""
THEMA=""
TITEL=""
OUTPUT_FILE=""

ERLAUBTE_THEMEN="eerm 3nf sql-select sql-join sql-ddl sql-dml allgemein"

while [[ $# -gt 0 ]]; do
  case "$1" in
    --klasse)
      KLASSE="${2:-}"
      shift 2
      ;;
    --thema)
      THEMA="${2:-}"
      shift 2
      ;;
    --titel)
      TITEL="${2:-}"
      shift 2
      ;;
    --output)
      OUTPUT_FILE="${2:-}"
      shift 2
      ;;
    -h|--help)
      usage
      exit 0
      ;;
    *)
      echo "[bkwi2-beitrag] ERROR: Unbekanntes Argument: $1" >&2
      usage
      exit 1
      ;;
  esac
done

if [[ -z "$KLASSE" ]]; then
  echo "[bkwi2-beitrag] ERROR: --klasse ist erforderlich (z. B. --klasse bkwi2)" >&2
  usage
  exit 1
fi

if [[ -z "$THEMA" ]]; then
  echo "[bkwi2-beitrag] ERROR: --thema ist erforderlich" >&2
  usage
  exit 1
fi

if [[ -z "$TITEL" ]]; then
  echo "[bkwi2-beitrag] ERROR: --titel ist erforderlich" >&2
  usage
  exit 1
fi

thema_valid=0
for t in $ERLAUBTE_THEMEN; do
  if [[ "$THEMA" == "$t" ]]; then
    thema_valid=1
    break
  fi
done

if [[ $thema_valid -eq 0 ]]; then
  echo "[bkwi2-beitrag] ERROR: Unbekanntes Thema: $THEMA" >&2
  echo "[bkwi2-beitrag] Erlaubte Themen: $ERLAUBTE_THEMEN" >&2
  exit 1
fi

timestamp="$(date -u +"%Y-%m-%dT%H:%M:%SZ")"
safe_stamp="$(date -u +"%Y%m%d-%H%M%S")"
safe_titel="$(echo "$TITEL" | tr '[:upper:]' '[:lower:]' | sed 's/[^a-z0-9]/-/g' | sed 's/--*/-/g' | sed 's/^-//; s/-$//')"

UEBUNGEN_DIR="generated/uebungen/bkwi2"
PROTOKOLL_DIR="generated/bkwi2-beitraege"
mkdir -p "$UEBUNGEN_DIR" "$PROTOKOLL_DIR"

if [[ -z "$OUTPUT_FILE" ]]; then
  OUTPUT_FILE="$UEBUNGEN_DIR/${safe_stamp}-${THEMA}-${safe_titel}.md"
fi

protokoll_file="$PROTOKOLL_DIR/beitrag-${safe_stamp}.md"

thema_label=""
thema_hinweis=""
case "$THEMA" in
  eerm)
    thema_label="EERM – Entity-Relationship-Modellierung (Erweitert)"
    thema_hinweis="Beschreibe den Sachverhalt, zeichne das EERM und erklaere Entitaeten, Attribute und Beziehungen."
    ;;
  3nf)
    thema_label="Dritte Normalform (3NF)"
    thema_hinweis="Zeige eine nicht-normalisierte Tabelle, erklaere die Verstossse und fuehre die Normalisierung Schritt fuer Schritt durch."
    ;;
  sql-select)
    thema_label="SQL SELECT-Abfragen"
    thema_hinweis="Beschreibe den Sachverhalt, gib die Tabellenstruktur an und formuliere passende SELECT-Abfragen mit Erlaeuterung."
    ;;
  sql-join)
    thema_label="SQL JOIN-Abfragen"
    thema_hinweis="Erklaere den Sachverhalt, gib die Tabellenstruktur an und zeige JOIN-Abfragen mit Ergebnistabelle."
    ;;
  sql-ddl)
    thema_label="SQL DDL – Datenbankdefinition"
    thema_hinweis="Erklaere den Sachverhalt und erstelle CREATE TABLE- und ALTER TABLE-Anweisungen mit Erlaeuterung."
    ;;
  sql-dml)
    thema_label="SQL DML – Datenmanipulation"
    thema_hinweis="Beschreibe den Anwendungsfall und zeige INSERT, UPDATE und DELETE mit Erlaeuterung."
    ;;
  allgemein)
    thema_label="Relationale Datenbanken – Allgemein"
    thema_hinweis="Beschreibe das Thema, liefere Beispiele und erklaere den Zusammenhang zum Lehrplan."
    ;;
esac

cat > "$OUTPUT_FILE" <<EOF
# Schueler-Inhaltsbeitrag: ${TITEL}

**Klasse:** ${KLASSE}
**Thema:** ${thema_label}
**Erstellt am (UTC):** ${timestamp}
**Status:** Entwurf – noch nicht freigegeben

---

## Sachverhalt

<!-- Beschreibt hier euren Anwendungsfall oder euer Beispielszenario. -->

(Bitte hier den Sachverhalt in 2-5 Saetzen beschreiben.)

---

## Inhalt

<!-- ${thema_hinweis} -->

(Bitte hier den fachlichen Inhalt ausarbeiten.)

---

## Aufgabenstellung

<!-- Formuliert 1-3 konkrete Aufgaben, die Mitschuelerinnen und Mitschueler bearbeiten koennen. -->

1. Aufgabe 1: ...
2. Aufgabe 2: ...
3. Aufgabe 3: ...

---

## Musterloesung

<!-- Gebt hier die erwartete Loesung an. -->

(Musterloesung hier einfuegen.)

---

## Lernziele

<!-- Was sollen Mitschuelerinnen und Mitschueler durch diesen Beitrag lernen? -->

- Lernziel 1: ...
- Lernziel 2: ...

---

## Peer-Review-Protokoll

**Pruefende Gruppe:** ______________________________

**Datum:** ______________________________

- [ ] Sachverhalt ist verstaendlich beschrieben
- [ ] Inhalt ist fachlich korrekt
- [ ] Aufgaben sind klar und loesbar
- [ ] Musterloesung ist vollstaendig und korrekt
- [ ] Lernziele sind angemessen

**Anmerkungen:** ______________________________

---

## Lehrkraft-Freigabe

- [ ] Freigegeben fuer Aufnahme in den Kurs
- [ ] Ueberarbeitung erforderlich (Feedback siehe unten)

**Feedback der Lehrkraft:** ______________________________

---

## Changelog

- v1.0 (${timestamp}): Initiale Erstellung durch ${KLASSE}
EOF

cat > "$protokoll_file" <<EOF
# Beitrags-Protokoll

Zeitpunkt (UTC): ${timestamp}
Klasse: ${KLASSE}
Thema: ${THEMA}
Titel: ${TITEL}
Ausgabedatei: ${OUTPUT_FILE}
EOF

echo "[bkwi2-beitrag] OK: Beitrag erzeugt: $OUTPUT_FILE"
echo "[bkwi2-beitrag] OK: Protokoll: $protokoll_file"
echo "[bkwi2-beitrag] Naechster Schritt: Datei oeffnen, Inhalt ausarbeiten, dann Pflichtchecks ausfuehren."
