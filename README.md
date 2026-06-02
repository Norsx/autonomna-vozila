# LiteRealm

**LiteRealm** je napredni *boilerplate* (predložak) dizajniran za brzu, robusnu i OS-neovisnu izradu akademskih radova, zadaća i softverskih projekata uz pomoć AI agenata (Gemini, Claude, Copilot). 

Umjesto instaliranja teških alata poput LaTeX-a na tvoje računalo, LiteRealm koristi tehnologiju **Dev Containers** kako bi sve radilo savršeno u izoliranom Docker okruženju, neovisno jesi li na Windowsima, macOS-u ili Linuxu.

Sve opće skripte, predlošci (seminari, radovi) i "vještine" agenata pohranjene su u odvojenom globalnom repozitoriju: **`~/.agentbrain`**. LiteRealm je namjerno "lagan" i usredotočen isključivo na tvoj specifični rad.

---

## 🚀 Brzi Start (Inicijalizacija)

### 1. Preduvjeti
Za potpuno neometan rad i kompilaciju PDF-ova bez uništavanja tvog računala, trebaš imati instalirano:
- [Docker Desktop](https://www.docker.com/products/docker-desktop/) (upaljen u pozadini)
- [Visual Studio Code](https://code.visualstudio.com/)
- Ekstenziju za VS Code: **Dev Containers** (`ms-vscode-remote.remote-containers`)

### 2. Kloniranje i Pokretanje
1. Kloniraj ovaj repozitorij pod novim imenom tvog projekta:
   ```bash
   git clone <url_ovog_repoa> Moj_Novi_Seminar
   cd Moj_Novi_Seminar
   ```
2. Otvori mapu u VS Code-u:
   ```bash
   code .
   ```
3. U donjem desnom kutu VS Code-a iskočit će ti prozor: **"Reopen in Container"**. Klikni to! (Ili stisni `F1` i upiši `Dev Containers: Reopen in Container`).
4. *Pričekaj par minuta* dok Docker instalira LaTeX, Python i sve potrebne ekstenzije (samo prvi put).

### 3. Inicijalizacija Projekta
Sada kada si unutar kontejnera, otvori terminal (u VS Code-u) i pokreni instalacijsku skriptu:

**Windows (PowerShell unutar kontejnera/hosta):**
```powershell
.\.ai\scripts\bootstrap.ps1 -Name "Naziv_Mog_Rada" -Rag cloud
```
**Linux / macOS (Bash unutar kontejnera):**
```bash
./.ai/scripts/bootstrap.sh --name "Naziv_Mog_Rada" --rag cloud
```

Skripta će automatski:
- Kreirati sve potrebne direktorije (`data/raw`, `data/processed`, `docs`, `src`).
- Podesiti `.env` datoteku.
- Kreirati virtualno okruženje (`.venv`) i instalirati Python pakete.
- Napisati naziv projekta u `STATE.md` i `project.yaml`.

### 4. Kopiranje Predloška
Tvoji LaTeX i Word predlošci žive u globalnom mozgu (`AgentBrain`).
Nakon što se projekt inicijalizira, jednostavno prekopiraj željeni predložak iz `~/.agentbrain/templates/` (npr. `fsb-seminar` ili `fsb-paper`) u mapu `docs/`. Zatim pozovi svog AI agenta da počne pisati!

---

## 📁 Struktura Direktorija

| Direktorij | Svrha |
|---|---|
| `docs/` | Tvoj pisani rad! `.tex` fajlovi, slike i generirani PDF-ovi. |
| `src/` | Programski kod, skripte i algoritmi. |
| `dist/` | Konačne verzije za predaju (npr. zip, finalni PDF). |
| `data/raw/` | Izvorni podaci (izvješća, tablice, dumpovi s API-ja). **Samo za čitanje.** |
| `data/processed/` | Tvoje obrade. (Obavezno u podmape oblika `izvor_ddmmyyyy_hhmmss`). |
| `data/sources/` | PDF dokumenti i literatura iz koje RAG uči (stavljati direktno ovdje). |
| `.ai/` | Interna pravila (`AGENTS.md`) i skripte okruženja. |
| `~/.agentbrain/` | (Zasebni repozitorij) Globalni predlošci, vještine i RAG skripte. |

---

## 🤖 Rad s AI Agentima

LiteRealm nameće vrlo stroga i čista pravila za rad agenata kako ne bi uništili repozitorij:
1. **Zapisivanje izvora**: Kad god AI skine sliku ili dokument s interneta, mora to upisati u `data/SOURCES_LOG.md`.
2. **Vidljivi Git Commits**: AI agenti dužni su raditi **inkrementalne** commitove. Svaki zadatak koji AI završi mora sadržavati oznaku `🤖 [AI]` u Git povijesti.
3. **Izolirani rad**: Za sve riskantne zadatke (instalacije ovisnosti, masovno preuređivanje), AI je dužan koristiti `git worktree` kako bi zaštitio glavni kod, te zatražiti tvoj *review* (pregled) prije spajanja na `main` granu.

---

## 📚 RAG (Razgovor s tvojom literaturom)

Umjesto haluciniranja izvora, agenti koriste **Retrieval-Augmented Generation (RAG)** bazu spojenu na tvoj `data/sources/` folder.
1. Stavi literature u `data/sources/`.
2. Ingestiraj ih (baza ide skriveno u `.ai/rag/db/`):
   ```bash
   python ~/.agentbrain/scripts/rag/ingest.py
   ```
3. Zatraži od agenta: *"Napiši mi odlomak koristeći lokalne izvore."*

---

## 🔨 Kompilacija PDF-a

Za ručnu kompilaciju, pokreni:
```powershell
.\.ai\scripts\helpers\build-docs.ps1       # PowerShell
./.ai/scripts/helpers/build-docs.sh        # Bash
```
S obzirom na to da se radi u `.devcontainer` okruženju, svi fontovi, jezični paketi i prevoditelji već su automatski spremni!
