#### ---------------------------------------------------------------------------

library(diffrprojects)
library(diffrprojectswidget)

dp <- diffrproject$new()
dp$options$verbose <- FALSE

dp$
  text_add(list("aaa\nbb\ncccc\ndd\nee\nff\ny\n", "bb\ncccd\ndd\nddd\nee\nff\n"))$
  text_link()$
  text_align( maxDist = 1 )$
  alignment_code(1,1:24, "wuppah", 1)$
  alignment_code(1,c(3,8,9,11), "womppah", 1)


dp$text_code_regex(text=1, x="a", pattern="a", val=TRUE)
dp$text_code_regex(text=2, x="b", pattern="[^a]", val=TRUE)


dp_table(dp, link=1)
