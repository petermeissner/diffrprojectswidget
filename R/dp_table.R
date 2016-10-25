if(getRversion() >= "2.15.1"){
  utils::globalVariables(
    c(
      "token_i_1", "token_i_2",
      "from", "to", "from_1", "to_1", "ti", "to_2", "from_2",
      "alignment_i",
      "var_name", "var_value", "token_i"
    )
  )
}


#' function for tabulation
#'
#' @param dp an object of type diffrproject
#' @param link which link to produce table for
#' @param width width of widget
#' @param height heigth of widget
#' @param align_var either a character vector of variable names or TRUE for all
#' @param text_var either a character vector of variable names or TRUE for all
#' @param aggregate_function a function able to resolve conflicts if for a
#'    specific variable for a token of text severla values exist, if NULL it
#'    defaults to modus() but could also be e.g. paste or something alike
#' @param ... further arguments passed through to aggregate_function
#'
#' @export
#'
dp_table <- function(
  dp,
  link=NULL,
  align_var="",
  text_var="",
  aggregate_function=NULL,
  ...,
  width = "100%",
  height = "400px"
) {

  # pass the data and settings using 'x'
  x <-
    dp_table_prepare_data(
      dp,
      link=NULL,
      align_var="",
      text_var="",
      aggregate_function=NULL,
      ...
    )

  # create a list that contains the settings
  x$options <- list( )

  # create the widget
  htmlwidgets::createWidget(
    "dp_table",
    x,
    width = width,
    height = height,
    package= "diffrprojectswidget"
  )
}



#' function for preparing data for tabulation
#'
#' @param dp an object of type diffrproject
#' @param link which link to produce table for
#' @param align_var either a character vector of variable names or TRUE for all
#' @param text_var either a character vector of variable names or TRUE for all
#' @param aggregate_function a function able to resolve conflicts if for a
#'    specific variable for a token of text severla values exist, if NULL it
#'    defaults to modus() but could also be e.g. paste or something alike
#' @param ... further arguments passed through to aggregate_function
#'
#' @export
#'
dp_table_prepare_data <-
  function(
    dp,
    link=NULL,
    align_var="",
    text_var="",
    aggregate_function=NULL,
    ...
  ){
  # check input
  if( is.null(link) ){
    if( length(dp$link) == 1  ){
      link <- 1
    }else{
      stop("No link/alignment choosen, please specify link/alignment to render.")
    }
  }

  # get link name and text names
  if( is.numeric(link) ){
    link  <- names(dp$link)[link]
  }

  text_name_1 <- dp$link[[link]]$from
  text_name_2 <- dp$link[[link]]$to

  # prepare alignment
  alignment <-
    dp$alignment[[link]] %>%
    diffrprojects::sort_alignment(ti1 = "token_i_1", ti2 = "token_i_2")

  # prepare alignment_data
  alignment_data <-
    dp$alignment_data_full(1, TRUE) %>%
    dplyr::select(alignment_i, var_name, var_value)

  if( align_var != TRUE ){
    alignment_data <-
      alignment_data %>%
      dplyr::filter(var_name %in% align_var)
  }

  # preapare text_data
  tokens <-
    alignment %>%
    dplyr::select(from_1, to_1) %>%
    stats::setNames(c("from","to"))
  text1_data <-
    dp$text[[text_name_1]]$
    tokenize_data_sequences(
      token = tokens,
      aggregate_function = aggregate_function,
      ...
    ) %>%
    dplyr::select(-from, -to, -token_i)

  tokens <-
    alignment %>%
    dplyr::select(from_2, to_2) %>%
    stats::setNames(c("from","to"))
  text2_data <-
    dp$text[[text_name_2]]$
    tokenize_data_sequences(
      token = tokens,
      aggregate_function = aggregate_function,
      ...
    ) %>%
    dplyr::select(-from, -to, -token_i)

  if( text_var!="" ){
    text1_data <- text1_data[, text_var]
    text2_data <- text2_data[, text_var]
  }

  # return
  return(
    list(
      alignment                 = alignment,
      text1                     = dp$text[[text_name_1]]$text_get(),
      text2                     = dp$text[[text_name_2]]$text_get(),
      alignment_data            = alignment_data,
      alignment_data_vars       = unique(alignment_data$var_name),
      alignment_text1_data      = text1_data,
      alignment_text2_data      = text2_data,
      alignment_text1_data_vars = names(text1_data),
      alignment_text2_data_vars = names(text2_data)
    )
  )
}



#' dp_table shiny output function
#'
#' @param outputId I have no idea
#' @param width width
#' @param height height
#'
#' @export
#'
dp_tableOutput <- function(outputId, width = "100%", height = "400px") {
  htmlwidgets::shinyWidgetOutput(outputId, "dp_table", width, height, package = "diffrprojectswidget")
}


#' dp_table shiny render function
#'
#' @param expr expr
#' @param env env
#' @param quoted quoted
#'
#'
#' @export
#'
renderDp_table <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) { expr <- substitute(expr) } # force quoted
  htmlwidgets::shinyRenderWidget(expr, dp_tableOutput, env, quoted = TRUE)
}




