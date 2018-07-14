library("shiny")
library("ggcyto")
library("flowCore")
library("png")

server <- function(input, output, session)
{
     observeEvent(input$param,
     {
         param <<- c(5,15,30)
         iter <<- c(1000,2000,3000)
         theta <<- c(0.2,0.5,0.6,0.8)
         perplex <<- c(50,100,150,200)

         output$timePlot <- renderPlot(
         {
             times <- sapply(param, function(i)
             {
                 tx <- tempfile(fileext = ".dat")
                 download.file(paste("http://simulworld.fr/temp/ev-",input$events,
                                     "__pm-",i,
                                     "__perpl-",perplex[input$perplexity],
                                     "__iter-",iter[input$iterations],
                                     "__theta-",theta[input$theta],
                                     "time.dat"),
                               tx,
                               "auto",quiet = T)
                 load(tx)

                 return(execTime/60)
             })
             plot(param,times, main="Time = f(Parameters) (min)", xlab="parameters", ylab="time(mn)")
             lines(param,times, col="red")
         })
     })

     observeEvent(input$iterations,
     {
         param <<- c(5,15,30)
         iter <<- c(1000,2000,3000)
         theta <<- c(0.2,0.5,0.6,0.8)
         perplex <<- c(50,100,150,200)

         output$timePlot <- renderPlot(
         {
             times <- sapply(iter, function(i)
             {
                 tx <- tempfile(fileext = ".dat")
                 download.file(paste("http://simulworld.fr/temp/ev-",input$events,
                                     "__pm-",param[input$param],
                                     "__perpl-",perplex[input$perplexity],
                                     "__iter-",i,
                                     "__theta-",theta[input$theta],
                                     "time.dat"),
                               tx,
                               "auto",quiet = T)
                 load(tx)
                 
                 return(execTime/60)
             })
             plot(iter,times, main="Time = f(Iterations) (min)", xlab="iterations", ylab="time(mn)")
             lines(iter,times)
         })
     })

     observeEvent(input$theta,
     {
         param <<- c(5,15,30)
         iter <<- c(1000,2000,3000)
         theta <<- c(0.2,0.5,0.6,0.8)
         perplex <<- c(50,100,150,200)

         output$timePlot <- renderPlot(
         {
             times <- sapply(theta, function(i)
             {
                 tx <- tempfile(fileext = ".dat")
                 download.file(paste("http://simulworld.fr/temp/ev-",input$events,
                                     "__pm-",param[input$param],
                                     "__perpl-",perplex[input$perplexity],
                                     "__iter-",iter[input$iterations],
                                     "__theta-",i,
                                     "time.dat"),
                               tx,
                               "auto",quiet = T)
                 load(tx)
                 
                 return(execTime/60)
             })
             plot(theta,times, main="Time = f(theta) (min)", xlab="theta", ylab="time(mn)")
             lines(theta,times)
         })
     })

     observeEvent(input$perplexity,
     {
         param <<- c(5,15,30)
         iter <<- c(1000,2000,3000)
         theta <<- c(0.2,0.5,0.6,0.8)
         perplex <<- c(50,100,150,200)

         output$timePlot <- renderPlot(
         {
             times <- sapply(perplex, function(i)
             {
                 tx <- tempfile(fileext = ".dat")
                 download.file(paste("http://simulworld.fr/temp/ev-",input$events,
                                     "__pm-",param[input$param],
                                     "__perpl-",i,
                                     "__iter-",iter[input$iterations],
                                     "__theta-",theta[input$theta],
                                     "time.dat"),
                               tx,
                               "auto",quiet = T)
                 load(tx)
                 
                 return(execTime/60)
             })
             plot(perplex,times, main="Time = f(perplex) (min)", xlab="theta", ylab="time(mn)")
             lines(perplex,times)
         })
     })

     observeEvent(input$events,
     {
         param <<- c(5,15,30)
         iter <<- c(1000,2000,3000)
         theta <<- c(0.2,0.5,0.6,0.8)
         perplex <<- c(50,100,150,200)
         clust.col <- read.FCS("benchmarkFCS__.fcs")@exprs[,31]
         updateSliderInput(session, "param", "Markers:", min = 1, max = 3, value = 1)
         updateSliderInput(session, "theta", "Theta (0.2,0.5,1)", min = 1, max = 3, value = 1)
         updateSliderInput(session, "iterations", "Iterations:", min = 1, max = 3, value = 1)
         updateSliderInput(session, "perplexity", "Perplexity :", min = 1, max = 4, value = 1)

      	 output$resPlot <- renderUI(
      	 {
      		 fname <- paste("https://simulworld.fr/temp/ev-",input$events,
                                                 "__pm-",param[input$param],
                                                 "__perpl-",perplex[input$perplexity],
                                                 "__iter-",iter[input$iterations],
                                                 "__theta-",theta[input$theta],
                                                 ".png")
      										 
      		 tags$img(src=fname, width="100%")
      	 })
     })
}
