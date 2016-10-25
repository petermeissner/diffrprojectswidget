if(getRversion() >= "2.15.1"){
  utils::globalVariables(
    c(
      "token_i_1", "token_i_2",
      "from", "to", "from_1", "to_1", "ti", "to_2", "from_2",
      "alignment_i"
    )
  )
}

#' function for visualization
#'
#' @param dp diffrprojects object
#' @param width width of widget
#' @param link wich link / alignment to use; either specify by index or by name
#' @param height heigth of widget
#'
#' @export
#'
dp_vis <- function(dp, link=NULL, width = "100%", height = "400px") {

  # check input
  if( is.null(link) ){
    if( length( dp$link == 1 ) ){
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


  # create a list that contains the settings
  options <- list( )

  # pass the data and settings using 'x'
  a1 <-
    dp$alignment[[link]] %>%
    dplyr::select(token_i_1, from_1, to_1) %>%
    stats::setNames(c("ti", "from", "to")) %>%
    dplyr::filter(!is.na(ti), !is.na(from), !is.na(to))
  a1$textnr <- 1

  a2 <-
    dp$alignment[[link]] %>%
    dplyr::select(token_i_2, from_2, to_2) %>%
    stats::setNames(c("ti", "from", "to")) %>%
    dplyr::filter(!is.na(ti), !is.na(from), !is.na(to))
  a2$textnr <- 2

  x <- list(
    alignment      = dp$alignment[[link]],
    textbits       = rbind(a1, a2),
    text1          = dp$text[[text_name_1]]$text_get(),
    text2          = dp$text[[text_name_2]]$text_get(),
    alignment_data = lapply(dp$alignment_data[[link]], function(x){names(x)[3]<- "value";x}),
    options        = options
  )

  # create the widget
  htmlwidgets::createWidget("dp_vis", x, width = width, height = height, package= "diffrprojectswidget")
}


#' dp_vis shiny output function
#'
#' @param outputId I have no idea
#' @param width width
#' @param height height
#'
#' @export
#'
dp_visOutput <- function(outputId, width = "100%", height = "400px") {
  htmlwidgets::shinyWidgetOutput(outputId, "dp_vis", width, height, package = "diffrprojectswidget")
}


#' dp_vis shiny render function
#'
#' @param expr expr
#' @param env env
#' @param quoted quoted
#'
#'
#' @export
#'
renderDP_vis <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) { expr <- substitute(expr) } # force quoted
  htmlwidgets::shinyRenderWidget(expr, dp_visOutput, env, quoted = TRUE)
}




