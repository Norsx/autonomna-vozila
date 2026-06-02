# LiteRealm — Pravila za AI Agente

Ovo je jednostavan workspace za pisanje seminara, zadaća i akademskih radova uz pomoć AI agenata.

## Direktoriji (strogo poštivati)

| Direktorij | Što ide ovdje |
|---|---|
| `docs/` | `.tex` fajlovi, generirani `.pdf`-ovi, slike i LaTeX resursi. |
| `src/` | Programski kod (`.py`, `.cpp`, `.js`…) ako zadatak to zahtijeva. |
| `dist/` | Konačne verzije za predaju (finalni PDF, zip). |
| `data/raw/` | Izvorni podaci (izvješća, tablice, preuzeti datasetovi, kamere). Ne mijenjati. |
| `data/processed/` | Obrađeni podaci. Sve obavezno mora ići u subfoldere nazvane u obliku `odkuddolazepodaci_ddmmyyyy_hhmmss`. |
| `data/sources/` | PDF izvori za RAG bazu. Sve treba biti izvana, ne zakopavati stvari u podfoldere. |

## LaTeX

1. Provjeri `project.yaml` za odabrani LaTeX format (`latex_format` polje).
2. Predlošci se nalaze u `~/.agentbrain/templates/` — kopiraj odgovarajući u `docs/` i prilagodi.
3. **Uvijek** generiraj `.pdf` nakon pisanja.
4. Za kompilaciju koristi: `.ai/scripts/helpers/build-docs.ps1` (ili `.sh`).

## RAG — Citiranje iz izvora

Ako je RAG uključen (`rag_mode` u `project.yaml`), agent može pretraživati korisnikove PDF izvore:

1. **Ingestija**: `python ~/.agentbrain/scripts/rag/ingest.py` — parsira PDF-ove iz `data/sources/` i sprema generiranu bazu u `.ai/rag/db/`.
2. **Pretraga**: `python ~/.agentbrain/scripts/rag/query.py "pitanje"` — vraća relevantne odlomke s izvorom i stranicom.
3. **Citiranje**: Koristi dobivene reference za precizno citiranje u seminaru (npr. `[Izvor, str. X]`).

## Global Brain

Ovaj projekt koristi `AgentBrain` (`~/.agentbrain`) kao "mozak" i središte znanja.
- Čitaj naučene lekcije i obrasce iz `~/.agentbrain/gotchas` i `~/.agentbrain/skills`.
- **KONTINUIRANA OPTIMIZACIJA**: Ako tijekom rada na projektu otkriješ novi *gotcha*, koristan prompt, novu vještinu ili uočiš da neki predložak treba popraviti, **obavezno samostalno ažuriraj i zapiši to u `~/.agentbrain/`**. Agenti su dužni nadograđivati AgentBrain!

## Komunikacija

- **Chat**: Hrvatski jezik.
- **Kod i commit poruke**: Engleski jezik.
- **Commit format**: Conventional Commits (`feat:`, `fix:`, `docs:`).

## Workflow

1. Pročitaj `STATE.md` za kontekst trenutnog zadatka.
2. Pročitaj `project.yaml` za LaTeX format i RAG/Brain konfiguraciju.
3. Radi u `docs/` (tekst) ili `src/` (kod).
4. Ako je RAG uključen, koristi `query.py` za pronalaženje relevantnih izvora.
5. Generiraj PDF. Commitaj na `main`.
