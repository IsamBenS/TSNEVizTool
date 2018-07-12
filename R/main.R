# You can learn more about package authoring with RStudio at:
#
#   http://r-pkgs.had.co.nz/
#
# Some useful keyboard shortcuts for package authoring:
#
#   Build and Reload Package:  'Ctrl + Shift + B'
#   Check Package:             'Ctrl + Shift + E'
#   Test Package:              'Ctrl + Shift + T'


#' @export
TSNE.Viz.run <- function()
{
    library("shiny")
    library("shinydashboard")
    library("ggcyto")
    library("flowCore")
    library("png")

    appDir <- system.file("shinyApp", "app", package = "TSNEVizTool")
    if (appDir == "")
    {
        stop("Could not find app directory. Try re-installing `TSNEVizTool`.", call. = FALSE)
    }

    shiny::runApp(appDir, display.mode = "normal", launch.browser = T)
}
