# STATE

## Projekt

- **Naziv**: autonomna_vozila
- **Tip**: Seminar
- **Kolegij**: Autonomna vozila
- **LaTeX format**: FSB Seminar

## Trenutni fokus

- ✅ Seminar prošireni i produbljeni (22 stranice PDF; ne postoji maksimalan broj stranica).
- ✅ Poglavlja: Uvod, **Sustavi automatizirane vožnje i percepcija (novo)**, ISO 26262, ISO 21448 (SOTIF), Usporedba i integracija, Zaključak.
- ✅ Dodani izvori materijala kolegija (uvodno predavanje, percepcija I i II) i citirani u novom poglavlju.
- ⚠️ Uklonjeni citati `yang2022integration` i `abbaspour2024safety` — njihovi PDF-ovi u data/sources/ sadrže pogrešan rad (duhan / egzoplaneti). Vidi memoriju [[source-pdf-mismatch]]. Tvrdnje preusmjerene na patel2025, shinde2026, bagschik2018.
- ✅ Provjereno ispravni izvori: shinde2026, patel2025, bagschik2018 + materijali kolegija.
- ✅ RAG/PDF alati instalirani u .venv (lancedb, sentence-transformers, pypdf); query.py traži PYTHONUTF8=1 i venv Python.
- Čeka se: QA review ili korisnički feedback. Ako trebaju yang/abbaspour radovi → data_fetcher ponovno preuzima i provjerava.

## Bilješke

- Autor: Ivan Noršić
- Profesori: Mario Hrgetić, Branimir Škugor, Marko Švaco, Joško Deur
- Tema: Uloga normi ISO 26262 i ISO 21448 (SOTIF) u osiguravanju sigurnosti sustava automatizirane vožnje
- Jezik rada: Hrvatski (kolegij na FSB-u)
- Tectonic instaliran u: %LOCALAPPDATA%\tectonic\tectonic.exe
- Pravilo 1 (PROAKTIVNI GIT): Nakon svake cjeline commitati s "🤖 [AI]" prefiksom.

## Upute za pisanje rada
- **Struktura**: jasno strukturirani dijelovi: uvod, razrada (teorijski pregled, analiza i opis metode/teme) te zaključak (sažetak glavnih rezultata i eventualne smjernice za daljnji rad).
- **Literatura**: Rad mora biti temeljen na relevantnoj literaturi, citiranoj u tekstu i navedenoj na kraju prema standardnom formatu citiranja (IEEE).
- **Nejasnoće**: U slučaju eventualnih nejasnoća, konzultirati prof. Hrgetića.
