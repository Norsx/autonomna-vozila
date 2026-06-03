# LiteRealm — Pravila za AI Agente

Ovo je workspace za pisanje seminara, zadaća i akademskih radova uz pomoć AI agenata.

## Direktoriji (strogo poštivati)

| Direktorij | Što ide ovdje | Napomena |
|---|---|---|
| `docs/` | LaTeX projekt: `main.tex`, `chapters/`, `figures/`, `references.bib`, generirani PDF-ovi | Prazno dok `latex_architect` ne postavi strukturu |
| `docs/chapters/` | Pojedina poglavlja kao zasebni `.tex` fajlovi | `\input{}` ih iz `main.tex` |
| `docs/figures/` | Slike, dijagrami, tablice kao slike | Samo rasterski/vektorski format |
| `src/` | Programski kod (`.py`, `.cpp`, `.js`…) ako zadatak to zahtijeva | |
| `dist/` | Konačne verzije za predaju. **Obavezno u podfoldere po verziji**: `dist/v1.0/`, `dist/v1.1/` itd. | PDF-ovi su gitignorirani |
| `data/raw/` | Sirovi ulazni podaci. **READ-ONLY** — nikad se ne mjenjaju | Git hook blokira promjene |
| `data/processed/` | Obrađeni podaci. Sve u subfolderima oblika `izvor_ddmmyyyy_hhmmss` | |
| `data/sources/` | PDF literatura, članci, prezentacije za RAG bazu | Praćeni putem Git LFS |
| `.ai/` | Interne konfiguracije, skripte, RAG baza projekta | Ne mijenjati bez razloga |

## Agent Routing

Specijalizirani agenti su definirani u `~/.agentbrain/agents/`. Svaki agent ima jasno definirano područje odgovornosti:

| Agent | Zadatak | Kada koristiti |
|---|---|---|
| `latex_architect` | Postavljanje LaTeX strukture u `docs/` | **Jednom**, kad korisnik kaže "počni pisati", "pripremi LaTeX", "setup docs" |
| `data_fetcher` | Pronalaženje i preuzimanje literature | Korisnik traži "pronađi izvore", "preuzmi PDF", "search for papers" |
| `writer` | Pisanje akademskog teksta u LaTeX | Korisnik traži "napiši poglavlje", "proširi tekst", "draft section" |
| `latex_surgeon` | Popravak LaTeX grešaka | Kompilacija pada, `.log` sadrži greške |
| `qa_reviewer` | Pregled i kritika napisanog | Sekcija/poglavlje gotovo, prije predaje |
| `rag_indexer` | Ažuriranje RAG baze | Novi PDF-ovi dodani u `data/sources/` |

**Pipeline redoslijed**: `latex_architect` → fetch → write → review → fix → index

## LaTeX

1. Provjeri `project.yaml` za odabrani LaTeX format (`latex_format` polje).
2. **`latex_architect` automatski kopira predložak** iz `~/.agentbrain/templates/` u `docs/` i kompilira.
3. Nakon postavljanja: piši u `docs/chapters/`, unosi u `docs/main.tex` via `\input{}`.
4. Za kompilaciju koristi: `.ai/scripts/helpers/build-docs.ps1` (ili `.sh`).
5. Podržani compileri: **Tectonic** (preporuka) ili `latexmk` (legacy).
6. Tectonic izlazni PDF je pored `.tex` fajla — skripta ga kopira u `dist/<verzija>/`.

## dist/ — Versioning

- Konačne verzije uvijek idu u podfoldere: `dist/v1.0/`, `dist/v1.1/`, `dist/final/`.
- Nikad ne stavljaj direktno u `dist/` root.
- PDF-ovi su gitignorirani — commiti samo `.gitkeep` kad kreiraš novu verziju.
- Primjer toka: `build-docs.ps1` generira PDF → ručno (ili agent) kopira u `dist/v1.0/naziv.pdf`.

## data/raw/ — Read-Only Pravilo

`data/raw/` sadržava izvorne, nepromijenjene podatke. **Nikad se ne mjenjaju.**

- Git pre-commit hook (instaliran via bootstrap) blokira commitanje promjena u `data/raw/`.
- Agenti smiju **čitati** iz `data/raw/` ali ne i pisati.
- Obrađene verzije idu u `data/processed/izvor_ddmmyyyy_hhmmss/`.

## data/sources/ — Git LFS

- Svi PDF-ovi i dokumenti u `data/sources/` praćeni su putem **Git LFS**.
- Potrebno: `git lfs install` jednom na računalu.
- Dodavanje izvora: `git add data/sources/clanak.pdf && git commit -m "feat: add source ..."`.
- **Zabranjeno**: dodavati izvore direktno bez LFS-a (check `.gitattributes`).

## RAG — Citiranje iz izvora

Ako je RAG uključen (`rag_mode` u `project.yaml`), agent može pretraživati korisnikove PDF izvore:

1. **Ingestija**: `python ~/.agentbrain/scripts/rag/ingest.py` — parsira PDF-ove iz `data/sources/` koristeći Docling i sprema u LanceDB bazu u `.ai/rag/db/`.
2. **Pretraga**: `python ~/.agentbrain/scripts/rag/query.py "pitanje" --scope both` — vraća relevantne odlomke s izvorom i stranicom.
3. **Citiranje**: Koristi dobivene reference za precizno citiranje u seminaru (`\cite{key}`).
4. **BibTeX**: `python ~/.agentbrain/scripts/add_citation.py --doi "10.xxxx/yyyy"`

## Global Brain

Ovaj projekt koristi `AgentBrain` (`~/.agentbrain`) kao "mozak":
- Čitaj naučene lekcije iz `~/.agentbrain/gotchas/`.
- Čitaj skill definicije iz `~/.agentbrain/skills/`.
- Čitaj definicije agenata iz `~/.agentbrain/agents/`.
- **KONTINUIRANA OPTIMIZACIJA**: Ako otkriješ novi *gotcha*, koristan prompt ili novu vještinu, **samostalno ažuriraj `~/.agentbrain/`**.

## Git & Kontrola Verzija

1. **AI Oznake**: Prefiks `🤖 [AI]` u naslovu commita.
2. **Inkrementalni Commits**: Commitaj svaku logičku cjelinu odmah.
3. **Strategija Grananja**:
   - Manje prepravke i pisanje teksta: radi izravno na `main`.
   - Veće strukturne promjene: kreiraj granu `ai/ime-featurea`.
4. **Git Worktrees**: Za rizične eksperimentalne zadatke koristi `git worktree add ../<ime> <branch>`.

## Citiranje i Praćenje Izvora

1. **Lokalni Izvori**: Citiraj isključivo radove iz `data/sources/`. Zabranjeno izmišljanje izvora.
2. **Praćenje**: Svako preuzimanje logirati u `data/SOURCES_LOG.md`:
   - `[Datum Vrijeme] - [URL] - [Lokalna putanja] - [Kratki opis]`

## Komunikacija

- **Chat**: Hrvatski jezik.
- **Kod, komentari, README i commit poruke**: Engleski jezik.
- **Commit format**: Conventional Commits uz `🤖 [AI]`.
