#' function for visualization
#'
#' @param dp diffrprojects object
#' @param width width of widget
#' @param height heigth of widget
#'
#' @export
#'
dp_vis <- function(
  dp,
  link      = NULL,
  align_var = TRUE,
  text_var  = TRUE,
  aggregate_function = NULL,
  ...,
  width     = "100%",
  height    = "400px"
) {

  # pass the data and settings using 'x'
  x <-
    dp_prepare_data_vis(
      dp,
      link               = NULL,
      align_var          = align_var,
      text_var           = text_var,
      aggregate_function = aggregate_function,
      minimize = TRUE,
      ...
    )

  # create a list that contains the settings
  x$options <- list( )

  # create the widget
  htmlwidgets::createWidget(
    "dp_vis",
    x,
    width = width,
    height = height,
    package= "diffrprojectswidget"
  )
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




