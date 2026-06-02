# LiteRealm

**LiteRealm** is an advanced boilerplate (template) designed for fast, robust, and OS-independent creation of academic papers, assignments, and software projects using AI agents (Gemini, Claude, Copilot).

Instead of installing heavy tools like LaTeX locally, LiteRealm offers **Dev Containers** (optional but recommended) to run everything perfectly in an isolated Docker environment. If you prefer not to use Docker, you can work entirely locally (you only need Python and a LaTeX distribution).

All generic scripts, templates (seminars, papers), and agent "skills" are stored in a separate global repository: **`AgentBrain`**. LiteRealm is intentionally lightweight and focused solely on your specific project.

---

## 🚀 Quick Start (Initialization)

### 1. Prerequisites
Depending on how you want to work, ensure you have one of the following setups:
- **Local**: Python 3.10+ and a TeX Live / MiKTeX distribution (for compiling PDFs).
- **Docker (Optional)**: Docker Desktop and the VS Code *Dev Containers* extension.

### 2. Creating a New Project & AgentBrain
This repository is used as a template:
1. On GitHub, click the green **"Use this template"** -> **"Create a new repository"** button.
2. Name the repository after your seminar/paper and clone it to your machine:
   ```bash
   git clone <YOUR_NEW_REPO_URL>
   cd <YOUR_FOLDER_NAME>
   ```
3. **Important:** LiteRealm relies on a global "brain". If you don't already have the `AgentBrain` repository, the bootstrap script will automatically clone it to your home directory (`~/.agentbrain`).

*(Optional: If you are using Docker, open VS Code now and click "Reopen in Container".)*

### 3. Project Initialization
Open the terminal (in VS Code) and run the setup script:

**Windows (PowerShell):**
```powershell
.\.ai\scripts\bootstrap.ps1 -Name "My_Paper_Name" -Rag cloud
```
**Linux / macOS (Bash):**
```bash
./.ai/scripts/bootstrap.sh --name "My_Paper_Name" --rag cloud
```

The script will automatically:
- Create all necessary directories (`data/raw`, `data/processed`, `docs`, `src`).
- Configure the `.env` file.
- Create a virtual environment (`.venv`) and install Python packages.
- Clone the `AgentBrain` repository to `~/.agentbrain` if it doesn't exist.
- Write the project name into `STATE.md` and `project.yaml`.

### 4. Copying the Template
Your LaTeX and Word templates live in the global brain (`AgentBrain`).
Once the project is initialized, simply copy the desired template from `~/.agentbrain/templates/` (e.g., `fsb-seminar` or `fsb-paper`) into the `docs/` folder. Then, invoke your AI agent to start writing!

---

## 📁 Directory Structure

| Directory | Purpose |
|---|---|
| `docs/` | Your written work! `.tex` files, images, and generated PDFs. |
| `src/` | Source code, scripts, and algorithms. |
| `dist/` | Final versions for submission (e.g., zip files, final PDFs). |
| `data/raw/` | Raw data (reports, tables, API dumps). **Read-only.** |
| `data/processed/` | Processed data. (Must be in subfolders like `source_ddmmyyyy_hhmmss`). |
| `data/sources/` | PDF documents and literature for the RAG system to learn from. |
| `.ai/` | Internal rules (`AGENTS.md`) and environment scripts. |
| `~/.agentbrain/` | (Separate repository) Global templates, skills, and RAG scripts. |

---

## 🤖 Working with AI Agents

LiteRealm enforces strict and clean rules for agents to prevent them from destroying the repository:
1. **Source Tracking**: Whenever the AI downloads an image or document from the web, it must log it in `data/SOURCES_LOG.md`.
2. **Visible Git Commits**: AI agents must make **incremental** commits. Every task completed by the AI must contain the `🤖 [AI]` tag in the Git history.
3. **Isolated Work**: For all risky tasks (dependency installations, massive refactoring), the AI must use a `git worktree` to protect the main codebase, and request your review before merging into the `main` branch.

---

## 📚 RAG (Chat with your literature)

Instead of hallucinating sources, agents use a **Retrieval-Augmented Generation (RAG)** database connected to your `data/sources/` folder.
1. Place literature in `data/sources/`.
2. Ingest them (the database is hidden in `.ai/rag/db/`):
   ```bash
   python ~/.agentbrain/scripts/rag/ingest.py
   ```
3. Ask the agent: *"Write a paragraph using the local sources."*

---

## 🔨 Compiling the PDF

For manual compilation, run:
```powershell
.\.ai\scripts\helpers\build-docs.ps1       # PowerShell
./.ai/scripts/helpers/build-docs.sh        # Bash
```
If working within the `.devcontainer` environment, all fonts, language packs, and compilers are automatically ready!
