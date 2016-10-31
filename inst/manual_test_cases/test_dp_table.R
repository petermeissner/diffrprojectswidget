
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

dp$tokenize_text_data_words()

# testing:

dp_table(dp, link=1)
dp_table(dp, link=1, FALSE, FALSE)
dp_table(dp, link=1, TRUE, FALSE)
dp_table(dp, link=1, FALSE, TRUE)
dp_table(dp, link=1, FALSE)

dp_table(dp, link=1, "dings", FALSE)
dp_table(dp, link=1, "dongs", FALSE)
dp_table(dp, link=1, c("dongs","dings"), FALSE)
dp_table(dp, link=1, c(""), FALSE)

dp_table(dp, link=1, FALSE, "you")
dp_table(dp, link=1, FALSE, "me")
dp_table(dp, link=1, FALSE, c("you", "me"))

