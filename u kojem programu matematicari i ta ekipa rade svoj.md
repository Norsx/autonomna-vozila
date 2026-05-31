<img src="https://r2cdn.perplexity.ai/pplx-full-logo-primary-dark%402x.png" style="height:64px;margin-right:32px"/>

# u kojem programu matematicari i ta ekipa rade svoje one iste prezentacije i vide mislim na ovaj tip prezentacije

i ovaj tip videa: [https://www.youtube.com/watch?v=WUvTyaaNkzM](https://www.youtube.com/watch?v=WUvTyaaNkzM)

Video koji si linkao (od **3Blue1Brown**) koristi alat koji se zove **Manim** — i to je direktan odgovor na tvoje pitanje.

## Što je Manim?

**Manim** (Mathematical Animation Engine) je Python biblioteka koju je originalno napisao **Grant Sanderson**, poznatiji kao 3Blue1Brown, za produkciju svojih matematičkih video objašnjenja na YouTubeu. Za razliku od klasičnih animacijskih alata s drag-and-drop sučeljem i vremenskim trakama, Manim tretira animacije kao **kod** — pišeš Python, a biblioteka ti renderira matematičke objekte, transformacije i prijelaze u poliran video.[^1_1]

Dakle, ono što vidiš u tim videjima — glatke transformacije vektora, jednadžbe koje se pišu same od sebe, grafikoni koji rastu u realnom vremenu — sve je to programirano liniju po liniju u Pythonu.

## Dvije verzije Manima

| Verzija | Repozitorij | Napomene |
| :-- | :-- | :-- |
| **Manim (originalni)** | `3b1b/manim` na GitHubu | Grantova osobna verzija, koristi je on sam |
| **ManimCE (Community Edition)** | `ManimCommunity/manim` | Aktivno održavana, MIT licenca, preporučena za početnike [^1_2] |

Za učenje se preporuča **ManimCE** jer ima bolju dokumentaciju, aktivnu zajednicu i redovite updateove.[^1_2]

## Što ti treba za početak

Manim zahtijeva malo poznavanja Python OOP-a — nije drag-and-drop alat. Pokreće se iz terminala, a `.py` skripte se renderiraju u `.mp4` video datoteke naredbom `manim -pql your_script.py`. Budući da već radiš s VS Codeom i Pythonom u svom AI workflow-u, to ti je savršen setup za ovo.[^1_3]

Postoji i eksperimentalni **manim-js** port koji radi u browseru bez instalacije, ako želiš brzo isprobati concept. Za ozbiljan rad, standardni ManimCE s Pythonom je pravi put.[^1_4]
<span style="display:none">[^1_10][^1_11][^1_12][^1_13][^1_14][^1_15][^1_5][^1_6][^1_7][^1_8][^1_9]</span>

<div align="center">⁂</div>

[^1_1]: https://solafide.ca/blog/inside-3blue1brown-manim-animation-engine-part-1

[^1_2]: https://www.manim.community

[^1_3]: https://assets.w3.tue.nl/w/fileadmin/user_upload/Creating%20high-quality%20mathematical%20animations%20using%20MANIM.pdf

[^1_4]: https://www.reddit.com/r/math/comments/1r4faij/i_ported_manim_3blue1browns_math_animation_engine/

[^1_5]: 01_Uvod.pdf

[^1_6]: https://www.youtube.com/watch?v=i4mMqa4ZhSs

[^1_7]: https://github.com/3b1b/manim

[^1_8]: https://www.3blue1brown.com/lessons/manim-demo

[^1_9]: https://news.ycombinator.com/item?id=19716019

[^1_10]: https://mcpmarket.com/tools/skills/manim-animation-engine

[^1_11]: https://www.reddit.com/r/manim/comments/1iois3s/is_manim_worth_learning_for_math_visualization_or/

[^1_12]: https://www.sitepoint.com/manim-web-3blue1brown-mathematical-animations-react/

[^1_13]: https://www.smashingmagazine.com/2025/04/using-manim-making-ui-animations/

[^1_14]: https://converter.brightcoding.dev/blog/manim-skill-the-revolutionary-toolkit-for-3blue1brown-animations

[^1_15]: https://www.youtube.com/watch?v=rUsUrbWb2D4


---

# dobro to je za vide. a kako su pravaljene ove prezentacije, tu je u pdf obliku

Da — ove prezentacije su **gotovo sigurno rađene u LaTeX Beameru**, a ne u PowerPointu ili Canvi. To se vidi po više vrlo tipičnih elemenata u PDF-u: struktura slajdova s naslovima tipa “Outline”, footer s autorom, institucijom, datumom i brojem slajda u formatu “1 / 71”, kao i po načinu na koji su matematičke formule složene i tipografski poravnate.[^2_1]

Vizualni stil također jako odgovara standardnim ili blago prilagođenim **Beamer temama**: crveni naslovi, sivi header bar, automatski numerirani sadržaj i “akademski” raspored elemenata po slajdu. Uz to, matematički izrazi poput $h(x)=0$, $g(x)\le 0$, skupova i preslikavanja $\mathbb{R}^n \to \mathbb{R}^m$ izgledaju kao klasični LaTeX math mode, što je jedan od glavnih razloga zašto matematičari, inženjeri i profesori često rade prezentacije baš u Beameru.[^2_1]

## Kako se to obično radi

Tipičan workflow je: napiše se `.tex` datoteka u **LaTeX-u**, koristi se klasa `beamer`, po potrebi paketi poput `amsmath`, `amssymb`, `mathtools`, `tikz` ili `pgfplots`, pa se sve kompilira u PDF. Drugim riječima, prezentacija je zapravo “programirana” kao dokument, slično kao znanstveni rad, samo sa slajdovima umjesto stranica.[^2_2][^2_1]

Primjer kostura izgleda otprilike ovako:

```latex
\documentclass{beamer}
\usetheme{Madrid} % ili neka druga tema
\usepackage{amsmath, amssymb}

\title{Optimizacijske metode}
\author{Andrej Jokić}
\date{21. listopada 2024.}

\begin{document}

\begin{frame}
  \titlepage
\end{frame}

\begin{frame}{Optimizacijski problem}
  \[
    \min f(x)
  \]
  uz ograničenja
  \[
    h(x)=0,\quad g(x)\le 0
  \]
\end{frame}

\end{document}
```


## Zašto koriste baš to

Glavni razlog je što je **Beamer** odličan za matematiku: formule, teoremi, dokazi, matrice, simboli i konzistentan akademski layout rade puno bolje nego u PowerPointu. Također je praktičan kad već pišeš radove u LaTeX-u, jer isti stil pisanja i isti matematički zapis možeš prenijeti direktno u prezentaciju.[^2_1]

Ako želiš napraviti prezentacije baš ovakvog tipa, najvjerojatnije ti trebaju **LaTeX + Beamer**, a za još jače matematičke crteže i dijagrame često se dodaje **TikZ/PGFPlots**. Ako želiš, mogu ti odmah složiti **minimalni Beamer template** koji izgleda vrlo slično ovom PDF-u.[^2_2]

<div align="center">⁂</div>

[^2_1]: 02_Definicije_klasifikacija_konveksnost.pdf

[^2_2]: https://www.manim.community

