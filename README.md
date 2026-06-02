# LiteRealm

Minimalan template za brzu izradu seminara, zadaća i akademskih radova uz pomoć AI agenata (Gemini, Claude, Copilot…).

## Pokretanje novog projekta

```powershell
# Windows — osnovni setup:
.\.ai\scripts\bootstrap.ps1 -Name "Moj_Seminar"

# S RAG podrškom (citiranje iz PDF izvora):
.\.ai\scripts\bootstrap.ps1 -Name "Moj_Seminar" -Rag cloud
```

```bash
# Linux / macOS:
./.ai/scripts/bootstrap.sh --name "Moj_Seminar"
./.ai/scripts/bootstrap.sh --name "Moj_Seminar" --rag cloud
```

Bootstrap radi 5 stvari: postavlja naziv, kreira direktorije, konfigurira `.env`, instalira Python pakete, i provjerava LaTeX.

## Struktura

| Direktorij | Svrha |
|---|---|
| `docs/` | Seminari, `.tex` fajlovi, generirani PDF-ovi. **Tvoj rad.** |
| `src/` | Programski kod, ako je potreban. |
| `dist/` | Finalne verzije za predaju. |
| `data/raw/` | Izvorni podaci (izvješća, datasetovi). |
| `data/processed/` | Obrađeni podaci (obavezno u podfoldere `odkuddolazepodaci_ddmmyyyy_hhmmss`). |
| `data/sources/` | PDF izvori za RAG pretragu (stavljati direktno, ne u podfoldere). |
| `~/.agentbrain/` | Globalni repozitorij predložaka i RAG skripti. |

## LaTeX predlošci

Dostupni u `.ai/templates/`:

| Predložak | Format | Namjena |
|---|---|---|
| `fsb-seminar/` | 12pt, A4 | Seminar za FSB |
| `fsb-thesis/` | 12pt, A4 | Diplomski rad |
| `fsb-paper/` | 10pt, dva stupca | Znanstveni rad |

## RAG — Citiranje iz izvora

1. Stavi PDF-ove (knjige, skripte, članke) direktno u `data/sources/`.
2. Pokreni ingestion: `python ~/.agentbrain/scripts/rag/ingest.py`
3. Pretraži: `python ~/.agentbrain/scripts/rag/query.py "Tvoje pitanje"`

Agent može koristiti RAG za pronalaženje i citiranje relevantnih izvora u seminaru.

## Kompilacija

```powershell
.\.ai\scripts\helpers\build-docs.ps1       # Windows
./.ai/scripts/helpers/build-docs.sh        # Linux
```
