#' function for visualization
#'
#' @param dp diffrprojects object
#' @param width width of widget
#' @param height heigth of widget
#'
#' @export
#'
dp_vis <- function(dp, width = "100%", height = "400px") {



  # create a list that contains the settings
  options <- list(
    linkDistance = 50,
    charge = -200,
    fontSize = 7,
    fontFamily = "serif",
    linkColour = "#666",
    nodeColour = "#3182bd",
    nodeClickColour = "#E34A33",
    textColour = "#3182bd",
    opacity = 0.6,
    zoom = TRUE
  )

  # pass the data and settings using 'x'
  x <- list(
    alignment      = dp$alignment[[1]],
    alignment_data = dp$alignment_data[[1]],
    text1          = dp$text[[1]]$text_get(split = "\n"),
    text2          = dp$text[[2]]$text_get(split = "\n"),
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




