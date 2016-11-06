
library(diffrprojects)
library(diffrprojectswidget)


dp <-
  diffrproject$new()$
  text_add(text_version_1)$
  text_add(text_version_2)$
  text_code_regex(
    text    = 1,
    x       = "test1",
    pattern = "This part.*?change",
    val = "inherited"
  )$
  text_code_regex(
    text    = 1,
    x       = "test2",
    pattern = "This part.*?change",
    val = "inherited"
  )

dp$tokenize_text_data_lines(1)


dp$
  text_link()$
  text_align()$
  text_data_inherit(
    link      = 1,
    direction = "forward"
  )

dp$tokenize_text_data_lines(2)

dp_vis(dp, link=1, text_var = FALSE)
dp_table(dp, 1, TRUE)

