# server.R for Global Data Competition

# Global Data Competition submission, this script and Shiny app Copyright 2015 by Jim Lohse
# The core statistical analysis is Copyright 2015 the Data God aka Paul Ricci, Master Statistician

# please see notes / project requirements in runThisScript.R

# adapted from http://shiny.rstudio.com/gallery/kmeans-example.html

palette(c("#E41A1C", "#377EB8", "#4DAF4A", "#984EA3",
          "#FF7F00", "#FFFF33", "#A65628", "#F781BF", "#999999"))

climateUtah <- read.csv('climateDataUtah2013.csv')


shinyServer(function(input, output, session) {
  
  # Combine the selected variables into a new data frame
  selectedData <- reactive({
  # get data 
  
  par(mfrow=c(1, 1))
  
  cor.test(as.numeric(climateUtah$ELEVATION), climateUtah$DPNT)
  by(climateUtah, climateUtah$DATE, function(climateUtah) 
    cor.test(as.numeric(climateUtah$ELEVATION),climateUtah$DPNT))
  })
  
  
  
  output$plot1 <- renderPlot({
    
    #by(climateUtah, climateUtah$DATE, function(climateUtah) plot.default(as.numeric(climateUtah$ELEVATION),climateUtah$DPNT, xlab = "Elevation", ylab = "Departure from Normal Temp (.1*F)", main = "Temperature Changes vs. Elevation by Month"))
    
    #modify the line above to grab the date from the dropdown in the UI
   
    by(climateUtah, climateUtah$DATE == input$monthOfYear, function(climateUtah) plot.default(as.numeric(climateUtah$ELEVATION),climateUtah$DPNT, xlab = "Elevation", ylab = "Departure from Normal Temp (.1*F)", main = "Temperature Changes vs. Elevation by Month"))

  })
  
})

