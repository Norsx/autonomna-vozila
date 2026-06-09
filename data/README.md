# data/

## `data/raw/`
Original, untouched input data — reports, camera captures, downloaded tables, raw datasets.
🔒 **Read-only: never modified by code.** A pre-commit hook blocks any commit that changes it.

## `data/processed/`
Processed data, charts and models.
**Rule:** every processed output goes in a subfolder named `source_ddmmyyyy_hhmmss`.

## `data/sources/`
PDF literature for RAG — books, lecture notes, papers. Drop files here, then index them:

```bash
python ~/.agentbrain/scripts/rag/ingest.py
```

Files in this folder are tracked via **Git LFS**.
