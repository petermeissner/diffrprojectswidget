#' function for visualization
#'
#' @param links some data tha currently is not passed on
#' @param width width of widget
#' @param height heigth of widget
#'
#' @export
dp_vis <- function(links=list(source= 1:10, target=sin(1:10)), width = "100%", height = "400px") {



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
    data = links,
    options = options
  )

  # create the widget
  htmlwidgets::createWidget("dp_vis", x, width = width, height = height, package= "diffrprojectswidget")
}


#' dp_vis shiny output function
#' @export
dp_visOutput <- function(outputId, width = "100%", height = "400px") {
  htmlwidgets::shinyWidgetOutput(outputId, "dp_vis", width, height, package = "diffrprojectswidget")
}


#' dp_vis shiny render function
#' @export
renderDP_vis <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) { expr <- substitute(expr) } # force quoted
  htmlwidgets::shinyRenderWidget(expr, diffrvisOutput, env, quoted = TRUE)
}
