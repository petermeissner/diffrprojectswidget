
Visualization for 'diffrprojects'
=================================

**Status**

[![Travis-CI Build Status](https://travis-ci.org/petermeissner/diffrprojectswidget.svg?branch=master)](https://travis-ci.org/petermeissner/diffrprojectswidget) [![codecov](https://codecov.io/gh/petermeissner/diffrprojectswidget/branch/master/graph/badge.svg)](https://codecov.io/gh/petermeissner/diffrprojectswidget/tree/master/R) [![CRAN version](http://www.r-pkg.org/badges/version/diffrprojectswidget)](https://cran.r-project.org/package=diffrprojectswidget)

*R code:* 270<br> *C++ code:* 0<br> *test code:* 0

**Version**

0.1.2.90000

**Description**

'Htmlwidget' / D3.js visualization for 'diffrprojects' projects.

**License**

MIT + file LICENSE <br>Peter Meissner <retep.meissner@gmail.com> \[aut, cre\] Ulrich Sieberer <ulrich.sieberer@uni-bamberg.de> \[cph\] University of Konstanz <willkommen@uni-konstanz.de> \[cph\]

**Citation**

To cite package 'diffrprojectswidget' in publications use:

Peter Meissner (2016). diffrprojectswidget: Visualization for 'diffrprojects'. R package version 0.1.2.90000. <https://github.com/petermeissner/diffrprojects>

A BibTeX entry for LaTeX users is

@Manual{, title = {diffrprojectswidget: Visualization for 'diffrprojects'}, author = {Peter Meissner}, year = {2016}, note = {R package version 0.1.2.90000}, url = {<https://github.com/petermeissner/diffrprojects>}, }

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
# loading packages
library(diffrprojects)
library(diffrprojectswidget)

# setting up a project
dp <- 
  diffrproject$new()$
    text_add(list("aaa\nbb\ncccc\ndd\nee\nff\ny\n", "bb\ncccd\ndd\nddd\nee\nff\n"))$
    text_link()$
    text_align( maxDist = 1 )$
    alignment_code(1,1:24, "wuppah", 1)$
    alignment_code(1,c(3,8,9,11), "womppah", 1)

dp$text_code_regex(text=1, x="a", pattern="a", val=TRUE)
dp$text_code_regex(text=2, x="b", pattern="[^a]", val=TRUE)

# tabulating change
dp_table(dp, link=1)
```

<!--html_preserve-->

<script type="application/json" data-for="htmlwidget-476bb032b9b066cee71e">{"x":{"alignment":{"alignment_i":[1,2,3,4,8,5,6,7],"token_i_1":[1,2,3,4,null,5,6,7],"token_i_2":[null,1,2,3,4,5,6,null],"distance":[3,0,1,0,3,0,0,1],"type":["deletion","no-change","change","no-change","insertion","no-change","no-change","deletion"],"from_1":[1,5,8,13,null,16,19,22],"to_1":[3,6,11,14,null,17,20,22],"from_2":[null,1,4,9,12,16,19,null],"to_2":[null,2,7,10,14,17,20,null]},"alignment_vars":["alignment_i","token_i_1","token_i_2","distance","type","from_1","to_1","from_2","to_2"],"text1":"aaa\nbb\ncccc\ndd\nee\nff\ny\n","text2":"bb\ncccd\ndd\nddd\nee\nff\n","alignment_data":{},"alignment_data_vars":[],"alignment_text1_data":{},"alignment_text2_data":{},"alignment_text_data_vars":[],"options":[]},"evals":[],"jsHooks":[]}</script>
<!--/html_preserve-->
