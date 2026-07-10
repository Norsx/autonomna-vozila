# Vodič kroz prezentaciju

Pratitelj uz `presentation.pdf`. Za svaki slajd: **što je na njemu**, **zašto je tu**,
**pojmovi koje moraš znati objasniti** i **pitanja koja se mogu postaviti**.

Opseg je namjerno sužen na naslov seminara: samo ISO 26262 i ISO 21448. Sve što ovdje
piše potkrijepljeno je tekstom seminara (`docs/chapters/`).

---

## Slajd 1 — Naslovnica

**Što je na njemu:** naslov, ime, fakultet, godina.

**Zašto je tu:** daje ti 15 sekundi da se smiriš i postaviš okvir.

**Što reći:** predstavi se, izgovori naslov, pa u jednoj rečenici najavi tezu —
*dvije norme, dvije različite vrste rizika, tek zajedno potpune*. Zatim najavi
strukturu (zašto dvije → svaka posebno → usporedba → izazovi → zaključak) i trajanje.

Nemoj čitati naslov riječ po riječ; publika ga vidi.

---

## Slajd 2 — Zašto dvije norme?

**Što je na njemu:** stablo. Korijen je *Sigurnosni rizik*. Iz njega dvije grane:
lijevo **Sustav OTKAŽE** (kvar hardvera, kvar softvera), desno **Sustav RADI ispravno,
ali nije dovoljan** (okolišni uvjeti, ograničenja senzora). Ispod grana stoje imena
normi koje ih pokrivaju.

**Zašto je tu:** ovo je nosivi slajd cijelog izlaganja. Sve ostalo je razrada ove
jedne slike. Ako publika zapamti samo njega, izlaganje je uspjelo.

**Kontekst — zašto je podjela uopće nastala:** ISO 26262 je stariji, izveden iz opće
norme za funkcijsku sigurnost, i cijeli je izgrađen na pretpostavci da je sustav
*ispravno projektiran*, ali se može *pokvariti*. Ta pretpostavka drži dok je funkcija
jednostavna i deterministička — recimo ABS. Kad se pojave sustavi koji percipiraju
okolinu i donose odluke, pretpostavka puca: ništa nije pokvareno, svaka komponenta
radi točno po specifikaciji, a ishod je svejedno opasan, jer *sama specifikacija nije
bila dovoljna za sve uvjete*. Ta praznina je razlog postojanja ISO 21448.

**Ključna rečenica koju vrijedi izgovoriti doslovno:**
> ISO 26262 pretpostavlja da je sustav dobro dizajniran, ali može otkazati.
> SOTIF pretpostavlja da sustav radi ispravno, ali mu dizajn može biti nedovoljan.

**Pojmovi:**
- **E/E sustav** — električni i elektronički sustav u vozilu. To je predmet ISO 26262.
- **Funkcionalna insuficijencija** — nedostatnost same funkcije, ne kvar. Predmet SOTIF-a.

**Moguća pitanja:**
- *„Zar se kvar senzora ne rješava redundancijom?"* — Da, i to je mjera funkcijske
  sigurnosti. Ali redundancija dvaju identičnih senzora ne pomaže ako oba podjednako
  slabo vide kroz maglu. Tu smo u SOTIF-u, ne u ISO 26262.

---

## Slajd 3 — ISO 26262, funkcijska sigurnost

**Što je na njemu:** korijen *ISO 26262* i četiri grane: V-model razvoja, HARA analiza,
ASIL A–D, hardverske metrike. Ispod: cilj norme.

**Zašto je tu:** daje kostur norme u jednom pogledu, prije nego se u sljedeći slajd
zaroni u jedan njezin dio.

**Kontekst:** ISO 26262 je zrela i dobro uspostavljena norma. Ne bavi se cijelim
vozilom, nego njegovim električnim i elektroničkim sustavima. Njezin cilj je
**odsutnost neprihvatljivog rizika koji proizlazi iz kvara** takvog sustava.

**Četiri grane, jednom rečenicom svaka:**

| Grana | Što je |
|---|---|
| **V-model** | Razvojni proces. Lijeva grana silazi od zahtjeva prema implementaciji, desna se penje kroz verifikaciju i validaciju. **Linearan.** |
| **HARA** | Analiza opasnosti i procjena rizika. Provodi se u fazi koncepta; iz nje izlaze sigurnosni ciljevi. |
| **ASIL** | Klasifikacija strogosti sigurnosnih zahtjeva, od A do D. |
| **Hardverske metrike** | Kvantitativni ciljevi za slučajne kvarove hardvera. |

**Zapamti riječ „linearan".** Vraćaš joj se na slajdu 8, gdje je linearnost V-modela
u sukobu s iterativnošću SOTIF-a.

**Ako te pitaju za hardverske metrike** (nisu na slajdu, namjerno): SPFM — udio
jednostrukih kvarova; LFM — udio latentnih kvarova; PMHF — vjerojatnost slučajnog
hardverskog kvara po satu rada. Sve tri postaju strože kako raste ASIL razina.

---

## Slajd 4 — Od rizika do ASIL razine

**Što je na njemu:** tri ulazna parametra (S, E, C) koji strelicama vode u jedan izlaz —
ASIL razinu, prikazanu kao ljestvicu QM < A < B < C < D.

**Zašto je tu:** ASIL je najprepoznatljiviji pojam iz ISO 26262 i publika ga očekuje.
Ovo je jedini slajd na kojem se ulazi u mehaniku norme.

**Kontekst:** HARA ne procjenjuje opasnost izolirano. Procjenjuje **opasni događaj** —
kombinaciju opasnosti i operativne situacije u kojoj se vozilo nalazi. Ista opasnost
u drugoj situaciji nosi drugi rizik.

**Tri parametra:**

| Oznaka | Pojam | Raspon | Pitanje na koje odgovara |
|---|---|---|---|
| **S** | Ozbiljnost (*Severity*) | S0–S3 | Kolika šteta može nastati? |
| **E** | Izloženost (*Exposure*) | E0–E4 | Koliko se često vozilo nađe u toj situaciji? |
| **C** | Upravljivost (*Controllability*) | C0–C3 | Može li vozač ili drugi sudionik izbjeći štetu? |

Njihova kombinacija daje ASIL razinu. **QM** znači „samo upravljanje kvalitetom" —
nisu potrebne posebne sigurnosne mjere.

**Primjeri za intuiciju** (iz seminara): električni podizači prozora → QM/ASIL A.
Prednja svjetla → ASIL A/B. Zračni jastuci → ASIL B/C. Električno upravljanje (EPS)
→ ASIL C/D. Autonomno kočenje (AEB) → **ASIL D**.

**Što viša razina znači u praksi:** za ASIL D traži se formalna verifikacija softvera,
redundancija hardverskih komponenata i neovisna procjena sigurnosti.

**Moguća pitanja:**
- *„Može li se ASIL D izbjeći?"* — Da, **dekompozicijom ASIL-a**: zahtjev visoke razine
  raspodijeli se na više neovisnih elemenata niže razine, ali samo ako se dokaže njihova
  međusobna neovisnost, odnosno odsutnost zajedničkih uzroka kvara.
- *„Zašto upravljivost, ako vozača nema?"* — Odlično pitanje i otvoreno je. Za razine
  bez vozača pojam upravljivosti gubi izvorno značenje; literatura predlaže da se
  redefinira mjerljivim dimenzijama. Ako ne želiš u to ulaziti, reci da je to predmet
  aktualnih istraživanja.

---

## Slajd 5 — ISO 21448, SOTIF

**Što je na njemu:** korijen *ISO 21448* i četiri grane: ODD, okidajući uvjeti,
klasifikacija scenarija, iterativna V&V. Ispod: cilj norme.

**Zašto je tu:** zrcalna slika slajda 3. Ista struktura, druga norma — publika odmah
vidi paralelu.

**Kontekst:** SOTIF je kratica od *Safety Of The Intended Functionality*, sigurnost
namijenjene funkcionalnosti. Naglasak je na riječi **namijenjene**: sustav radi točno
ono što je namijenjeno, nema kvara, a ishod može biti opasan. Cilj norme je
**odsutnost rizika koji proizlazi iz ograničenja performansi**.

**Četiri grane:**

- **ODD (*Operational Design Domain*, operativna domena)** — skup uvjeta pod kojima je
  sustav projektiran raditi sigurno: tipovi cesta, geografsko područje, raspon brzina,
  vremenski i svjetlosni uvjeti. Izlazak iz ODD-a, ili rad na njegovom rubu, tipičan je
  izvor SOTIF rizika. Definiranje i nadzor ODD-a preduvjet su za smislenu procjenu
  sigurnosti.
- **Okidajući uvjeti (*triggering conditions*)** — okolnosti koje navedu ispravan sustav
  da proizvede opasan ishod. Tri vrste:
  - *okolišni* — kiša, magla, snijeg, nedostatno ili prekomjerno osvjetljenje, refleksije;
  - *scenarijski* — neočekivano ponašanje drugih sudionika, netipične konfiguracije cesta;
  - *tehnološki* — ograničenja rezolucije senzora, degradacija zbog zaprljanja (blato na kameri).
- **Klasifikacija scenarija** — slajd 6.
- **Iterativna V&V** — ovdje **nema** V-modela. Proces je ciklički: analiziraj funkciju,
  identificiraj insuficijencije, modificiraj sustav, testiraj, pa ispočetka.

**Zapamti riječ „iterativan".** Zajedno s „linearan" sa slajda 3 čini srž slajda 8.

---

## Slajd 6 — Četiri područja scenarija

**Što je na njemu:** matrica 2×2. Osi su *poznat / nepoznat* i *opasan / neopasan*.
Dvije strelice vode iz Područja 3 u 2, pa iz 2 u 1.

**Zašto je tu:** ovo je operativna srž SOTIF-a — konkretno *što se radi* kad se
primjenjuje norma.

**Četiri područja:**

| | Neopasni | Opasni |
|---|---|---|
| **Poznati** | Područje 1 | Područje 2 |
| **Nepoznati** | Područje 4 | Područje 3 |

- **Područje 1** — poznati, neopasni. Tu želimo biti.
- **Područje 4** — nepoznati, ali neopasni. Ne smetaju nam.
- **Područje 2** — poznati **opasni**. Znamo za njih. Rješavaju se mjerama: poboljšanjem
  performansi ili točnosti senzora, redundancijom, fail-safe mehanizmima (npr. sustav za
  nužno kočenje).
- **Područje 3** — nepoznati **opasni**. Najizazovnija kategorija: ne znamo ni da postoje.
  Jedini put je sustavno testiranje i analiza, kojima ih prevodimo u poznate — dakle u
  Područje 2 — a onda ih rješavamo mjerama.

**Cilj SOTIF procesa:** analizom namijenjene funkcionalnosti, modifikacijom sustava te
verifikacijom i validacijom **procijeniti i smanjiti rizik u Području 2 i Području 3**.
To je smisao strelica na slajdu: guraš scenarije iz 3 u 2, pa iz 2 u 1.

**Važna kvalifikacija:** rizik nikad ne pada na nulu. Ostaje **rezidualni rizik** —
pojam kojem se vraćaš na slajdovima 7 i 8.

**Moguća pitanja:**
- *„Kako uopće testirati nešto za što ne znaš da postoji?"* — Ne testiraš ciljano; širiš
  prostor pretraživanja. Sustavnim testiranjem, analizom i prikupljanjem podataka iz
  vožnje nepoznati scenariji postaju poznati. To je iterativna priroda SOTIF-a.

---

## Slajd 7 — Usporedba: dvije strane iste medalje

**Što je na njemu:** korijen *Cjelovita sigurnost*, iz njega dvije grane. Lijevo
ISO 26262 → izvor: KVAR, V-model (linearan), ASIL A–D. Desno ISO 21448 → izvor:
INSUFICIJENCIJA, iterativni ciklus, rezidualni rizik.

**Zašto je tu:** spaja sve prethodno u jednu sliku i eksplicitno izgovara glavnu tezu.

**Puna usporedba** (iz seminara; na slajdu su samo tri retka, ostatak drži u glavi):

| Obilježje | ISO 26262 (FuSa) | ISO 21448 (SOTIF) |
|---|---|---|
| Izvor opasnosti | Kvarovi E/E sustava | Funkcionalne insuficijencije i predvidiva zlouporaba |
| Cilj | Odsutnost rizika od neispravnog ponašanja | Odsutnost rizika od ograničenja performansi |
| Razvojni model | V-model (linearni) | Iterativni ciklus |
| Klasifikacija rizika | ASIL (A–D) | Procjena rezidualnog rizika |
| Ključna aktivnost | HARA | Identifikacija okidajućih uvjeta i nepoznatih opasnih scenarija |
| Primjenjivost | Svi E/E sustavi u vozilima | Sustavi s percepcijom i donošenjem odluka |

**Teza koju treba izgovoriti jasno:** ovo **nisu suparničke norme** i ne biraš jednu.
SOTIF sam po sebi nije potpun pristup — mora se koristiti *zajedno* s funkcijskom
sigurnošću. Vrijedi i obrnuto: ISO 26262 ne adresira rizike nedeterminističkih
algoritama, uključujući one temeljene na strojnom učenju. **Za potpuno sigurnosno
osiguranje automatiziranog vozila obje se norme moraju primjenjivati istodobno.**

Otud naslov slajda.

---

## Slajd 8 — Izazovi integracije

**Što je na njemu:** korijen *Izazovi u praksi* i četiri neutralno obojene grane.
Boja je namjerno siva: nijedan izazov ne pripada jednoj normi, svi nastaju **na
njihovom spoju**.

**Zašto je tu:** komplementarnost je uredna u teoriji. Ovaj slajd sprječava da
izlaganje zvuči naivno.

**Četiri izazova:**

1. **Nepodudarnost razvojnih modela.** V-model ISO 26262 je linearan i strukturiran,
   SOTIF je iterativan. Ne postoji jednostavno preslikavanje aktivnosti jedne norme
   na drugu. *(Ovdje se isplati ta linearnost i iterativnost sa slajdova 3 i 5.)*
2. **Upravljanje dvostrukim metodologijama.** Vođenje dvaju paralelnih sigurnosnih
   procesa povećava složenost, zahtijeva opsežnu dokumentaciju i rigorozno upravljanje
   životnim ciklusom.
3. **Sigurnost AI komponenata.** Sustavi temeljeni na strojnom učenju teško se uklapaju
   u tradicionalni, deterministički okvir ISO 26262. To je motiviralo prilagodbu
   procesnih zahtjeva norme za takve komponente.
4. **Kvantifikacija rezidualnog rizika.** ISO 26262 ima jasno definirane ASIL razine.
   SOTIF nema konsenzus oko toga koji je prag rezidualnog rizika prihvatljiv, niti
   jedinstvene kriterije evaluacije. **Najozbiljniji od četiri** — i pošteno je to reći.

**Protuteža, da ne završiš pesimistično:** literatura pokazuje da je **holistički
pristup** ostvariv. Ključni elementi: zajednička definicija stavke i sustava (obje
norme je traže, pa je to prirodna točka integracije), integrirano upravljanje
testiranjem, višeaspektno sigurnosno inženjerstvo i kontinuirana validacija kroz
cijeli životni ciklus.

---

## Slajd 9 — Zaključak

**Što je na njemu:** četiri natuknice, kurzivna napomena o drugim normama, zahvala.

**Struktura zaključka:**

1. ISO 26262 pokriva rizik od **kvara** E/E sustava.
2. ISO 21448 pokriva rizik od **nedostatnosti** ispravnog sustava.
3. Norme su **komplementarne** — nijedna sama nije dovoljna.
4. Integracija je ostvariva, ali otvoreni izazovi ostaju (prije svega prag
   prihvatljivog rezidualnog rizika).

**O kurzivnoj napomeni:** na slajdu piše da postoje i druge norme relevantne za
sigurnost automatizirane vožnje i da se ovaj rad na njih ne fokusira. To je namjerno
i dovoljno. **Ne imenuj ih i ne objašnjavaj čemu služe** — opseg seminara su ove dvije.

Ako te netko izravno pita: reci da šire područje pokriva scenarijsku evaluaciju,
verifikaciju i validaciju specifičnu za automatizirane sustave, pretpostavke o
ponašanju sudionika u prometu i sveobuhvatni sigurnosni slučaj — te ponudi razgovor
izvan izlaganja. Nemoj improvizirati detalje.

---

## Šalabahter — ako zaboraviš sve ostalo

| Pojam | Jedna rečenica |
|---|---|
| **ISO 26262** | Sustav je dobro dizajniran, ali može otkazati. |
| **ISO 21448 (SOTIF)** | Sustav radi ispravno, ali mu dizajn nije dovoljan. |
| **HARA** | Analiza opasnosti; ulaz u ASIL. |
| **ASIL** | S × E × C → QM, A, B, C, D. |
| **ODD** | Uvjeti pod kojima sustav smije raditi. |
| **Okidajući uvjet** | Okolnost koja ispravan sustav navede na opasan ishod. |
| **Područje 3** | Nepoznati opasni scenariji — najteži problem SOTIF-a. |
| **Rezidualni rizik** | Ono što ostane; nema konsenzusa o prihvatljivom pragu. |
