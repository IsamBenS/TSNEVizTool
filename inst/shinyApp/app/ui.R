library(shiny)
library(shinydashboard)

ui <- dashboardPage(

    dashboardHeader
    (
        title="t-SNE Plots"
    ),

    dashboardSidebar
    (
        sidebarMenu
        (
            id="buttons",
            selectInput("events", "Events:", choices = c(10000,50000,100000,200000)),
            sliderInput("param", "Markers:", min = 1, max = 3, value = 1),
            sliderInput("theta", "Theta (0.2,0.5,0.6,0.8)", min = 1, max = 4, value = 1),
            sliderInput("iterations", "Iterations:", min = 1, max = 3, value = 1),
            sliderInput("perplexity", "Perplexity :", min = 1, max = 4, value = 1)
        )
    ),

    dashboardBody
    (
        #tags$head(tags$link(rel = "stylesheet", type = "text/css", href = "custom.css")),
        tags$head(includeScript(paste0(system.file("shinyApp", "app", package = "TSNEVizTool"),'/slider.js'))),
        fluidRow
        (
            id="main_content",
            box
            (
                uiOutput(outputId="resPlot")
            ),
            box
            (
                imageOutput("timePlot")
            )
        )

    )

)
