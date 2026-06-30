# Review — Uloga normi ISO 26262 i ISO 21448 (SOTIF) u osiguravanju sigurnosti sustava automatizirane vožnje
Date: 2026-06-25

## Critical (must fix before submission)
- **Nedefinirana slika V-modela (`fig:vmodel`)**: U poglavlju 2 (*Funkcijska sigurnost*, datoteka `docs/chapters/01-iso26262.tex`, linija 12) nalazi se tekst: `temelji se na V-modelu (Slika~\ref{fig:vmodel})`. Međutim, u cijelom projektu ne postoji definiran `\begin{figure}` okoliš s labelom `fig:vmodel`, što dovodi do pogreške nepostojanja reference (prikazuje se kao **??** u PDF-u).
  * *Rješenje*: Potrebno je dodati odgovarajući `\begin{figure}` blok sa slikovnim prikazom V-modela u mapu `docs/figures/` i definirati ga u kodu, ili preformulirati rečenicu tako da se slika ne referencira izravno.

## Major (should fix)
- **BibTeX upozorenje za referencu `bagschik2018hara`**: Kompilacijom bibliografije javlja se upozorenje: `Warning--empty booktitle in bagschik2018hara`. Unos u `references.bib` je definiran kao `@inproceedings`, ali mu nedostaje polje `booktitle`.
  * *Rješenje*: Budući da se radi o arXiv preprintu, preporučuje se promijeniti tip unosa iz `@inproceedings` u `@misc` (analogno unojima `shinde2026reimagining` i `abbaspour2024safety`) i time ukloniti upozorenje.

## Minor (nice to fix)
- **Citiranje normi bez PDF-a u izvorima**: Norme `iso26262`, `iso21448` i standard `saej3016` se citiraju u tekstu, ali njihovi PDF dokumenti ne postoje u mapi `data/sources/` (niti su navedeni u `data/SOURCES_LOG.md`). Za same industrijske norme to je posve prihvatljivo jer su komercijalne i iznimno opsežne, no radi dosljednosti RAG sustava, bilo bi dobro u `data/SOURCES_LOG.md` dodati bilješku da su te norme referencirane izravno kao općepoznati standardi.

## Positive notes
- **Izvrsna jezična i stilska kvaliteta**: Rad je napisan izrazito formalnim hrvatskim akademskim stilom. Nema pisanja u prvom licu jednine/množine niti kolokvijalnih izraza.
- **Tehnička točnost**: Koncepti funkcionalne sigurnosti (FuSa) i sigurnosti namijenjene funkcionalnosti (SOTIF) su točno i precizno razgraničeni. Tablica s ASIL razinama i usporedna tablica normi su vrlo informativne i točne.
- **Kvaliteta LaTeX koda**: Tablice su oblikovane profesionalno pomoću paketa `booktabs` (bez vertikalnih linija) i imaju opise smještene iznad tablica, što je standard za akademske radove na FSB-u.
- **Duljina rada**: Rad ima 12 stranica. Ne postoji maksimalan broj stranica (`max_pages: 0`), pa duljina nije ograničenje.
