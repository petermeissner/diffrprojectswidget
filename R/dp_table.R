#' function for tabulation
#'
#' @param dp an object of type diffrproject
#' @param link which link to produce table for
#' @param width width of widget
#' @param height heigth of widget
#'
#' @export
#'
dp_table <- function(dp, link=NULL, width = "100%", height = "400px") {

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
  x <- list(
    alignment      = dp$alignment[[link]],
    text1          = dp$text[[text_name_1]]$text_get(),
    text2          = dp$text[[text_name_2]]$text_get(),
    alignment_data = lapply(dp$alignment_data[[link]], function(x){names(x)[3]<- "value";x}),
    options        = options
  )

  # create the widget
  htmlwidgets::createWidget("dp_table", x, width = width, height = height, package= "diffrprojectswidget")
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




