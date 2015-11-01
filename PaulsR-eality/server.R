# server.R for Global Data Competition

# Global Data Competition submission, this script and Shiny app Copyright 2015 by Jim Lohse
# The core statistical analysis is Copyright 2015 the Data God aka Paul Ricci, Master Statistician

# please see notes / project requirements in runThisScript.R

# adapted from http://shiny.rstudio.com/gallery/kmeans-example.html

# require("V8")
#test this out, get a little fancier if this works with some error handling
library(shinyjs)

palette(c("#E41A1C", "#377EB8", "#4DAF4A", "#984EA3",
          "#FF7F00", "#FFFF33", "#A65628", "#F781BF", "#999999"))

shinyServer(function(input, output, session) {
  
  # Combine the selected variables into a new data frame
  selectedData <- reactive({
    iris[, c(input$xcol, input$ycol)]
  })
  
  clusters <- reactive({
    kmeans(selectedData(), input$clusters)
  })
  
  output$plot1 <- renderPlot({
    par(mar = c(5.1, 4.1, 0, 1))
    
    plot(selectedData(),
         col = clusters()$cluster,
         pch = 20, cex = 3)
    
    points(clusters()$centers, pch = 4, cex = 4, lwd = 4)
  })
  
})

