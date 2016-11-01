
Visualization for 'diffrprojects'
=================================

**Status**

[![Travis-CI Build Status](https://travis-ci.org/petermeissner/diffrprojectswidget.svg?branch=master)](https://travis-ci.org/petermeissner/diffrprojectswidget) [![codecov](https://codecov.io/gh/petermeissner/diffrprojectswidget/branch/master/graph/badge.svg)](https://codecov.io/gh/petermeissner/diffrprojectswidget/tree/master/R) [![CRAN version](http://www.r-pkg.org/badges/version/diffrprojectswidget)](https://cran.r-project.org/package=diffrprojectswidget)

*R code:* 277<br> *C++ code:* 0<br> *test code:* 0

**Version**

0.1.4.90000

**Description**

'Htmlwidget' / D3.js visualization for 'diffrprojects' projects.

**License**

MIT + file LICENSE <br>Peter Meissner <retep.meissner@gmail.com> \[aut, cre\] Ulrich Sieberer <ulrich.sieberer@uni-bamberg.de> \[cph\] University of Konstanz <willkommen@uni-konstanz.de> \[cph\]

**Citation**

To cite package 'diffrprojectswidget' in publications use:

Peter Meissner (2016). diffrprojectswidget: Visualization for 'diffrprojects'. R package version 0.1.4.90000. <https://github.com/petermeissner/diffrprojects>

A BibTeX entry for LaTeX users is

@Manual{, title = {diffrprojectswidget: Visualization for 'diffrprojects'}, author = {Peter Meissner}, year = {2016}, note = {R package version 0.1.4.90000}, url = {<https://github.com/petermeissner/diffrprojects>}, }

**BibTex for citing**

``` r
toBibtex(citation("diffrprojectswidget"))
```

**Installation**

``` r
devtools::install_github("petermeissner/stringb")
devtools::install_github("petermeissner/rtext")
devtools::install_github("petermeissner/diffrprojects")
devtools::install_github("petermeissner/diffrprojects")
```

... or, alternatively from my private R package repository ...

``` r
options( "repos" = 
  c(
    options("repos")$repos, 
    petermeissner="https://petermeissner.github.io/drat"
  ) 
)
install.packages("diffrprojectswidget")
```

**Example usage**

``` r
library(diffrprojects)
library(diffrprojectswidget)

dp <-
  diffrproject$new()$
  text_add(list(prometheus_late, prometheus_early))$
  text_link()$
  text_align( maxDist = 1 )

dp$text_code_regex(text=1, x="you", pattern="du|Du", val=TRUE)
dp$text_code_regex(text=1, x="me", pattern="ich|Ich", val=TRUE)

dp$text_code_regex(text=2, x="you", pattern="du|Du", val=TRUE)
dp$text_code_regex(text=2, x="me", pattern="ich|Ich", val=TRUE)

dp$alignment_code(1,1,"dongs", "muhaha")
dp$alignment_code(1,1,"dings", "check this out")

dp$debug()

dp_vis(dp, link=1)
```

<!--html_preserve-->

<script type="application/json" data-for="htmlwidget-9dd811a1b0e2206024fd">{"x":{"alignment":"[\n  [1, 1, 0, \"no-change\"],\n  [2, 2, 0, \"no-change\"],\n  [3, 3, 1, \"change\"],\n  [4, 4, 0, \"no-change\"],\n  [5, 5, 0, \"no-change\"],\n  [6, 6, 0, \"no-change\"],\n  [7, 7, 0, \"no-change\"],\n  [8, 8, 0, \"no-change\"],\n  [9, 9, 0, \"no-change\"],\n  [10, 10, 0, \"no-change\"],\n  [11, 11, 1, \"change\"],\n  [12, 12, 0, \"no-change\"],\n  [13, 13, 0, \"no-change\"],\n  [14, null, 25, \"deletion\"],\n  [null, 14, 23, \"insertion\"],\n  [15, 15, 1, \"change\"],\n  [16, null, 21, \"deletion\"],\n  [null, 16, 23, \"insertion\"],\n  [17, 17, 0, \"no-change\"],\n  [18, 18, 0, \"no-change\"],\n  [19, 19, 0, \"no-change\"],\n  [20, 20, 0, \"no-change\"],\n  [21, 21, 0, \"no-change\"],\n  [22, 22, 0, \"no-change\"],\n  [23, 23, 0, \"no-change\"],\n  [24, 24, 0, \"no-change\"],\n  [25, 25, 0, \"no-change\"],\n  [26, 26, 0, \"no-change\"],\n  [27, 27, 1, \"change\"],\n  [28, 28, 1, \"change\"],\n  [29, 29, 0, \"no-change\"],\n  [30, 30, 0, \"no-change\"],\n  [31, null, 28, \"deletion\"],\n  [null, 31, 27, \"insertion\"],\n  [32, 32, 1, \"change\"],\n  [33, 33, 0, \"no-change\"],\n  [34, 34, 0, \"no-change\"],\n  [35, 35, 0, \"no-change\"],\n  [36, 36, 0, \"no-change\"],\n  [37, 37, 0, \"no-change\"],\n  [38, 38, 0, \"no-change\"],\n  [39, 39, 0, \"no-change\"],\n  [40, 40, 0, \"no-change\"],\n  [41, 41, 0, \"no-change\"],\n  [42, 42, 0, \"no-change\"],\n  [43, 43, 0, \"no-change\"],\n  [44, 44, 0, \"no-change\"],\n  [45, 45, 0, \"no-change\"],\n  [46, 46, 0, \"no-change\"],\n  [47, 47, 0, \"no-change\"],\n  [48, 48, 0, \"no-change\"],\n  [49, 49, 0, \"no-change\"],\n  [50, 50, 0, \"no-change\"],\n  [51, 51, 0, \"no-change\"],\n  [52, 52, 0, \"no-change\"],\n  [53, 53, 0, \"no-change\"],\n  [54, 54, 0, \"no-change\"],\n  [55, 55, 0, \"no-change\"],\n  [56, 56, 0, \"no-change\"],\n  [57, 57, 0, \"no-change\"],\n  [58, 58, 0, \"no-change\"],\n  [59, 59, 0, \"no-change\"],\n  [60, 60, 0, \"no-change\"]\n]","alignment_vars":"[\"token_i_1\", \"token_i_2\", \"distance\", \"type\"]","text":"[\n  [1, 2, 27, \"Johann Wolfgang von Goethe\", 1],\n  [2, 30, 41, \"\\\"Prometheus\\\"\", 1],\n  [3, 44, 71, \"Bedecke deinen Himmel, Zeus,\", 1],\n  [4, 73, 88, \"Mit Wolkendunst,\", 1],\n  [5, 90, 116, \"Und übe, dem Knaben gleich,\", 1],\n  [6, 118, 135, \"Der Disteln köpft,\", 1],\n  [7, 137, 166, \"An Eichen dich und Bergeshöhn;\", 1],\n  [8, 168, 186, \"Müßt mir meine Erde\", 1],\n  [9, 188, 205, \"Doch lassen stehn,\", 1],\n  [10, 207, 243, \"Und meine Hütte, die du nicht gebaut,\", 1],\n  [11, 245, 260, \"Und meinen Herd,\", 1],\n  [12, 262, 276, \"Um dessen Gluth\", 1],\n  [13, 278, 295, \"Du mich beneidest.\", 1],\n  [14, 298, 322, \"Ich kenne nichts Aermeres\", 1],\n  [15, 324, 357, \"Unter der Sonn', als euch, Götter!\", 1],\n  [16, 359, 379, \"Ihr nähret kümmerlich\", 1],\n  [17, 381, 396, \"Von Opfersteuern\", 1],\n  [18, 398, 412, \"Und Gebetshauch\", 1],\n  [19, 414, 427, \"Eure Majestät,\", 1],\n  [20, 429, 446, \"Und darbtet, wären\", 1],\n  [21, 448, 471, \"Nicht Kinder und Bettler\", 1],\n  [22, 473, 494, \"Hoffnungsvolle Thoren.\", 1],\n  [23, 497, 516, \"Da ich ein Kind war,\", 1],\n  [24, 518, 545, \"Nicht wußte wo aus noch ein,\", 1],\n  [25, 547, 576, \"Kehrt' ich mein verirrtes Auge\", 1],\n  [26, 578, 608, \"Zur Sonne, als wenn drüber wär'\", 1],\n  [27, 610, 639, \"Ein Ohr, zu hören meine Klage,\", 1],\n  [28, 641, 661, \"Ein Herz, wie mein's,\", 1],\n  [29, 663, 694, \"Sich des Bedrängten zu erbarmen.\", 1],\n  [30, 697, 708, \"Wer half mir\", 1],\n  [31, 710, 737, \"Wider der Titanen Uebermuth?\", 1],\n  [32, 739, 764, \"Wer rettete vom Tode mich,\", 1],\n  [33, 766, 779, \"Von Sklaverey?\", 1],\n  [34, 781, 817, \"Hast du nicht alles selbst vollendet,\", 1],\n  [35, 819, 838, \"Heilig glühend Herz?\", 1],\n  [36, 840, 865, \"Und glühtest jung und gut,\", 1],\n  [37, 867, 888, \"Betrogen, Rettungsdank\", 1],\n  [38, 890, 915, \"Dem Schlafenden da droben?\", 1],\n  [39, 918, 939, \"Ich dich ehren? Wofür?\", 1],\n  [40, 941, 971, \"Hast du die Schmerzen gelindert\", 1],\n  [41, 973, 989, \"Je des Beladenen?\", 1],\n  [42, 991, 1019, \"Hast du die Thränen gestillet\", 1],\n  [43, 1021, 1039, \"Je des Geängsteten?\", 1],\n  [44, 1041, 1076, \"Hat nicht mich zum Manne geschmiedet\", 1],\n  [45, 1078, 1097, \"Die allmächtige Zeit\", 1],\n  [46, 1099, 1122, \"Und das ewige Schicksal,\", 1],\n  [47, 1124, 1145, \"Meine Herrn und deine?\", 1],\n  [48, 1148, 1164, \"Wähntest du etwa,\", 1],\n  [49, 1166, 1193, \"Ich sollte das Leben hassen,\", 1],\n  [50, 1195, 1212, \"In Wüsten fliehen,\", 1],\n  [51, 1214, 1228, \"Weil nicht alle\", 1],\n  [52, 1230, 1251, \"Blüthenträume reiften?\", 1],\n  [53, 1254, 1283, \"Hier sitz' ich, forme Menschen\", 1],\n  [54, 1285, 1302, \"Nach meinem Bilde,\", 1],\n  [55, 1304, 1338, \"Ein Geschlecht, das mir gleich sey,\", 1],\n  [56, 1340, 1360, \"Zu leiden, zu weinen,\", 1],\n  [57, 1362, 1392, \"Zu genießen und zu freuen sich,\", 1],\n  [58, 1394, 1418, \"Und dein nicht zu achten,\", 1],\n  [59, 1420, 1427, \"Wie ich!\", 1],\n  [60, 1430, 1462, \"source: https://de.wikisource.org\", 1],\n  [1, 2, 27, \"Johann Wolfgang von Goethe\", 2],\n  [2, 30, 41, \"\\\"Prometheus\\\"\", 2],\n  [3, 44, 71, \"Bedecke deinen Himmel, Zevs,\", 2],\n  [4, 73, 88, \"Mit Wolkendunst,\", 2],\n  [5, 90, 116, \"Und übe, dem Knaben gleich,\", 2],\n  [6, 118, 135, \"Der Disteln köpft,\", 2],\n  [7, 138, 167, \"An Eichen dich und Bergeshöhn;\", 2],\n  [8, 169, 187, \"Müßt mir meine Erde\", 2],\n  [9, 189, 206, \"Doch lassen stehn,\", 2],\n  [10, 208, 244, \"Und meine Hütte, die du nicht gebaut,\", 2],\n  [11, 246, 260, \"Und meinen Herd\", 2],\n  [12, 262, 276, \"Um dessen Gluth\", 2],\n  [13, 278, 295, \"Du mich beneidest.\", 2],\n  [14, 298, 320, \"Ich kenne nichts ärmers\", 2],\n  [15, 322, 354, \"Unter der Sonn' als euch, Götter!\", 2],\n  [16, 356, 378, \"  Ihr nähret kümmerlich\", 2],\n  [17, 380, 395, \"Von Opfersteuern\", 2],\n  [18, 397, 411, \"Und Gebetshauch\", 2],\n  [19, 413, 426, \"Eure Majestät,\", 2],\n  [20, 428, 445, \"Und darbtet, wären\", 2],\n  [21, 447, 470, \"Nicht Kinder und Bettler\", 2],\n  [22, 472, 493, \"Hoffnungsvolle Thoren.\", 2],\n  [23, 496, 515, \"Da ich ein Kind war,\", 2],\n  [24, 517, 544, \"Nicht wußte wo aus noch ein,\", 2],\n  [25, 546, 575, \"Kehrt' ich mein verirrtes Auge\", 2],\n  [26, 577, 607, \"Zur Sonne, als wenn drüber wär'\", 2],\n  [27, 609, 637, \"Ein Ohr zu hören meine Klage,\", 2],\n  [28, 639, 658, \"Ein Herz wie mein's,\", 2],\n  [29, 660, 691, \"Sich des Bedrängten zu erbarmen.\", 2],\n  [30, 694, 705, \"Wer half mir\", 2],\n  [31, 707, 733, \"Wider der Titanen übermuth?\", 2],\n  [32, 735, 759, \"Wer rettete vom Tode mich\", 2],\n  [33, 761, 774, \"Von Sklaverey?\", 2],\n  [34, 776, 812, \"Hast du nicht alles selbst vollendet,\", 2],\n  [35, 814, 833, \"Heilig glühend Herz?\", 2],\n  [36, 835, 860, \"Und glühtest jung und gut,\", 2],\n  [37, 862, 883, \"Betrogen, Rettungsdank\", 2],\n  [38, 885, 910, \"Dem Schlafenden da droben?\", 2],\n  [39, 913, 934, \"Ich dich ehren? Wofür?\", 2],\n  [40, 936, 966, \"Hast du die Schmerzen gelindert\", 2],\n  [41, 968, 984, \"Je des Beladenen?\", 2],\n  [42, 986, 1014, \"Hast du die Thränen gestillet\", 2],\n  [43, 1016, 1034, \"Je des Geängsteten?\", 2],\n  [44, 1036, 1071, \"Hat nicht mich zum Manne geschmiedet\", 2],\n  [45, 1073, 1092, \"Die allmächtige Zeit\", 2],\n  [46, 1094, 1117, \"Und das ewige Schicksal,\", 2],\n  [47, 1119, 1140, \"Meine Herrn und deine?\", 2],\n  [48, 1143, 1159, \"Wähntest du etwa,\", 2],\n  [49, 1161, 1188, \"Ich sollte das Leben hassen,\", 2],\n  [50, 1190, 1207, \"In Wüsten fliehen,\", 2],\n  [51, 1209, 1223, \"Weil nicht alle\", 2],\n  [52, 1225, 1246, \"Blüthenträume reiften?\", 2],\n  [53, 1249, 1278, \"Hier sitz' ich, forme Menschen\", 2],\n  [54, 1280, 1297, \"Nach meinem Bilde,\", 2],\n  [55, 1299, 1333, \"Ein Geschlecht, das mir gleich sey,\", 2],\n  [56, 1335, 1355, \"Zu leiden, zu weinen,\", 2],\n  [57, 1357, 1387, \"Zu genießen und zu freuen sich,\", 2],\n  [58, 1389, 1413, \"Und dein nicht zu achten,\", 2],\n  [59, 1415, 1422, \"Wie ich!\", 2],\n  [60, 1426, 1458, \"source: https://de.wikisource.org\", 2]\n]","text_vars":"[\"token_i\", \"from\", \"to\", \"text\", \"tnr\"]","alignment_data":"[\n  [\"check this out\", \"muhaha\"],\n  [null, null],\n  [null, null],\n  [null, null],\n  [null, null],\n  [null, null],\n  [null, null],\n  [null, null],\n  [null, null],\n  [null, null],\n  [null, null],\n  [null, null],\n  [null, null],\n  [null, null],\n  [null, null],\n  [null, null],\n  [null, null],\n  [null, null],\n  [null, null],\n  [null, null],\n  [null, null],\n  [null, null],\n  [null, null],\n  [null, null],\n  [null, null],\n  [null, null],\n  [null, null],\n  [null, null],\n  [null, null],\n  [null, null],\n  [null, null],\n  [null, null],\n  [null, null],\n  [null, null],\n  [null, null],\n  [null, null],\n  [null, null],\n  [null, null],\n  [null, null],\n  [null, null],\n  [null, null],\n  [null, null],\n  [null, null],\n  [null, null],\n  [null, null],\n  [null, null],\n  [null, null],\n  [null, null],\n  [null, null],\n  [null, null],\n  [null, null],\n  [null, null],\n  [null, null],\n  [null, null],\n  [null, null],\n  [null, null],\n  [null, null],\n  [null, null],\n  [null, null],\n  [null, null],\n  [null, null],\n  [null, null],\n  [null, null]\n]","alignment_data_vars":"[\"dings\", \"dongs\"]","text1_data":"[\n  [null, null],\n  [null, null],\n  [null, null],\n  [true, null],\n  [null, true],\n  [null, null],\n  [null, true],\n  [null, null],\n  [null, null],\n  [null, true],\n  [null, null],\n  [null, null],\n  [null, true],\n  [null, true],\n  [null, null],\n  [null, true],\n  [null, null],\n  [null, null],\n  [null, null],\n  [null, null],\n  [null, true],\n  [null, null],\n  [null, true],\n  [null, true],\n  [null, true],\n  [null, null],\n  [null, null],\n  [null, null],\n  [null, true],\n  [null, null],\n  [null, null],\n  [null, true],\n  [null, null],\n  [null, true],\n  [null, null],\n  [null, null],\n  [null, null],\n  [null, null],\n  [null, true],\n  [true, null],\n  [null, null],\n  [true, null],\n  [null, null],\n  [null, true],\n  [null, null],\n  [null, null],\n  [null, null],\n  [true, null],\n  [null, true],\n  [null, null],\n  [null, true],\n  [null, null],\n  [null, true],\n  [null, null],\n  [null, true],\n  [null, null],\n  [null, true],\n  [null, true],\n  [null, true],\n  [null, null]\n]","text2_data":"[\n  [null, null],\n  [null, null],\n  [null, null],\n  [true, null],\n  [null, true],\n  [null, null],\n  [null, true],\n  [null, null],\n  [null, null],\n  [null, true],\n  [null, null],\n  [null, null],\n  [null, true],\n  [null, true],\n  [null, null],\n  [null, true],\n  [null, null],\n  [null, null],\n  [null, null],\n  [null, null],\n  [null, true],\n  [null, null],\n  [null, true],\n  [null, true],\n  [null, true],\n  [null, null],\n  [null, null],\n  [null, null],\n  [null, true],\n  [null, null],\n  [null, null],\n  [null, true],\n  [null, null],\n  [null, true],\n  [null, null],\n  [null, null],\n  [null, null],\n  [null, null],\n  [null, true],\n  [true, null],\n  [null, null],\n  [true, null],\n  [null, null],\n  [null, true],\n  [null, null],\n  [null, null],\n  [null, null],\n  [true, null],\n  [null, true],\n  [null, null],\n  [null, true],\n  [null, null],\n  [null, true],\n  [null, null],\n  [null, true],\n  [null, null],\n  [null, true],\n  [null, true],\n  [null, true],\n  [null, null]\n]","text_data_vars":"[\"you\", \"me\"]","options":[]},"evals":["alignment","alignment_vars","text","text_vars","alignment_data","alignment_data_vars","text1_data","text2_data","text_data_vars"],"jsHooks":[]}</script>
<!--/html_preserve-->
``` r
dp_table(dp, 1)
```

<!--html_preserve-->

<script type="application/json" data-for="htmlwidget-a6323094de59e3ebed30">{"x":{"alignment":{"alignment_i":[1,2,3,4,5,6,7,8,9,10,11,12,13,14,61,15,16,62,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,63,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60],"token_i_1":[1,2,3,4,5,6,7,8,9,10,11,12,13,14,null,15,16,null,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,null,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60],"token_i_2":[1,2,3,4,5,6,7,8,9,10,11,12,13,null,14,15,null,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,null,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60],"distance":[0,0,1,0,0,0,0,0,0,0,1,0,0,25,23,1,21,23,0,0,0,0,0,0,0,0,0,0,1,1,0,0,28,27,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],"type":["no-change","no-change","change","no-change","no-change","no-change","no-change","no-change","no-change","no-change","change","no-change","no-change","deletion","insertion","change","deletion","insertion","no-change","no-change","no-change","no-change","no-change","no-change","no-change","no-change","no-change","no-change","change","change","no-change","no-change","deletion","insertion","change","no-change","no-change","no-change","no-change","no-change","no-change","no-change","no-change","no-change","no-change","no-change","no-change","no-change","no-change","no-change","no-change","no-change","no-change","no-change","no-change","no-change","no-change","no-change","no-change","no-change","no-change","no-change","no-change"],"from_1":[2,30,44,73,90,118,137,168,188,207,245,262,278,298,null,324,359,null,381,398,414,429,448,473,497,518,547,578,610,641,663,697,710,null,739,766,781,819,840,867,890,918,941,973,991,1021,1041,1078,1099,1124,1148,1166,1195,1214,1230,1254,1285,1304,1340,1362,1394,1420,1430],"to_1":[27,41,71,88,116,135,166,186,205,243,260,276,295,322,null,357,379,null,396,412,427,446,471,494,516,545,576,608,639,661,694,708,737,null,764,779,817,838,865,888,915,939,971,989,1019,1039,1076,1097,1122,1145,1164,1193,1212,1228,1251,1283,1302,1338,1360,1392,1418,1427,1462],"from_2":[2,30,44,73,90,118,138,169,189,208,246,262,278,null,298,322,null,356,380,397,413,428,447,472,496,517,546,577,609,639,660,694,null,707,735,761,776,814,835,862,885,913,936,968,986,1016,1036,1073,1094,1119,1143,1161,1190,1209,1225,1249,1280,1299,1335,1357,1389,1415,1426],"to_2":[27,41,71,88,116,135,167,187,206,244,260,276,295,null,320,354,null,378,395,411,426,445,470,493,515,544,575,607,637,658,691,705,null,733,759,774,812,833,860,883,910,934,966,984,1014,1034,1071,1092,1117,1140,1159,1188,1207,1223,1246,1278,1297,1333,1355,1387,1413,1422,1458]},"alignment_vars":["alignment_i","token_i_1","token_i_2","distance","type","from_1","to_1","from_2","to_2"],"text1":"\nJohann Wolfgang von Goethe\n\n\"Prometheus\"\n\nBedecke deinen Himmel, Zeus,\nMit Wolkendunst,\nUnd übe, dem Knaben gleich,\nDer Disteln köpft,\nAn Eichen dich und Bergeshöhn;\nMüßt mir meine Erde\nDoch lassen stehn,\nUnd meine Hütte, die du nicht gebaut,\nUnd meinen Herd,\nUm dessen Gluth\nDu mich beneidest.\n\nIch kenne nichts Aermeres\nUnter der Sonn', als euch, Götter!\nIhr nähret kümmerlich\nVon Opfersteuern\nUnd Gebetshauch\nEure Majestät,\nUnd darbtet, wären\nNicht Kinder und Bettler\nHoffnungsvolle Thoren.\n\nDa ich ein Kind war,\nNicht wußte wo aus noch ein,\nKehrt' ich mein verirrtes Auge\nZur Sonne, als wenn drüber wär'\nEin Ohr, zu hören meine Klage,\nEin Herz, wie mein's,\nSich des Bedrängten zu erbarmen.\n\nWer half mir\nWider der Titanen Uebermuth?\nWer rettete vom Tode mich,\nVon Sklaverey?\nHast du nicht alles selbst vollendet,\nHeilig glühend Herz?\nUnd glühtest jung und gut,\nBetrogen, Rettungsdank\nDem Schlafenden da droben?\n\nIch dich ehren? Wofür?\nHast du die Schmerzen gelindert\nJe des Beladenen?\nHast du die Thränen gestillet\nJe des Geängsteten?\nHat nicht mich zum Manne geschmiedet\nDie allmächtige Zeit\nUnd das ewige Schicksal,\nMeine Herrn und deine?\n\nWähntest du etwa,\nIch sollte das Leben hassen,\nIn Wüsten fliehen,\nWeil nicht alle\nBlüthenträume reiften?\n\nHier sitz' ich, forme Menschen\nNach meinem Bilde,\nEin Geschlecht, das mir gleich sey,\nZu leiden, zu weinen,\nZu genießen und zu freuen sich,\nUnd dein nicht zu achten,\nWie ich!\n\nsource: https://de.wikisource.org\n","text2":"\nJohann Wolfgang von Goethe\n\n\"Prometheus\"\n\nBedecke deinen Himmel, Zevs,\nMit Wolkendunst,\nUnd übe, dem Knaben gleich,\nDer Disteln köpft,\n\nAn Eichen dich und Bergeshöhn;\nMüßt mir meine Erde\nDoch lassen stehn,\nUnd meine Hütte, die du nicht gebaut,\nUnd meinen Herd\nUm dessen Gluth\nDu mich beneidest.\n\nIch kenne nichts ärmers\nUnter der Sonn' als euch, Götter!\n  Ihr nähret kümmerlich\nVon Opfersteuern\nUnd Gebetshauch\nEure Majestät,\nUnd darbtet, wären\nNicht Kinder und Bettler\nHoffnungsvolle Thoren.\n\nDa ich ein Kind war,\nNicht wußte wo aus noch ein,\nKehrt' ich mein verirrtes Auge\nZur Sonne, als wenn drüber wär'\nEin Ohr zu hören meine Klage,\nEin Herz wie mein's,\nSich des Bedrängten zu erbarmen.\n\nWer half mir\nWider der Titanen übermuth?\nWer rettete vom Tode mich\nVon Sklaverey?\nHast du nicht alles selbst vollendet,\nHeilig glühend Herz?\nUnd glühtest jung und gut,\nBetrogen, Rettungsdank\nDem Schlafenden da droben?\n\nIch dich ehren? Wofür?\nHast du die Schmerzen gelindert\nJe des Beladenen?\nHast du die Thränen gestillet\nJe des Geängsteten?\nHat nicht mich zum Manne geschmiedet\nDie allmächtige Zeit\nUnd das ewige Schicksal,\nMeine Herrn und deine?\n\nWähntest du etwa,\nIch sollte das Leben hassen,\nIn Wüsten fliehen,\nWeil nicht alle\nBlüthenträume reiften?\n\nHier sitz' ich, forme Menschen\nNach meinem Bilde,\nEin Geschlecht, das mir gleich sey,\nZu leiden, zu weinen,\nZu genießen und zu freuen sich,\nUnd dein nicht zu achten,\nWie ich!\n\n\nsource: https://de.wikisource.org\n","alignment_data":{},"alignment_data_vars":[],"alignment_text1_data":{},"alignment_text2_data":{},"alignment_text_data_vars":[],"options":[]},"evals":[],"jsHooks":[]}</script>
<!--/html_preserve-->
