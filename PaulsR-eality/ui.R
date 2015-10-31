# ui.R for Global Data Competition

# Global Data Competition submission, this script and Shiny app Copyright 2015 by Jim Lohse
# The core statistical analysis is Copyright 2015 the Data God aka Paul Ricci, Master Statistician

# please see notes / project requirements in runThisScript.R

# adapted from http://shiny.rstudio.com/gallery/kmeans-example.html

#monthsOfYear = c('January','February','March','April','May',
#                'June','July','August','September','October',
#                'November','December')

monthOfYearList = c('January'='1','February'='2','March'='3','April'='4','May'='5',
                'June'='6','July'='7','August'='8','September'='9','October'='10',
                  'November'='11','December'='12')

regressionLineChoiceList = c('None selected' = 'none', 'Linear Regression' = 'linearRegression', 
                             'Quadratic Regression' = 'quadraticRegression', 'Cubic Regression' = 'cubicRegression')

# regressionLineColorList = c(colors())

# removed from link to pauls summary: target="_blank",

paulsHTMLSummaryLoc = paste('file:/',getwd(),"/paulsSummary.html", sep = '')
paulsDOCXSummaryLoc = paste('file:/',getwd(),"/paulsSummary.docx", sep = '')

shinyUI(pageWithSidebar(
  headerPanel('Analysis of Utah Weather Data by Month'),
  
  sidebarPanel(
    selectInput('monthOfYear', 'Choose a Month:', monthOfYearList),
    
    div(
      class = "section",
      div(class = "title", "Graph Data Color"),
      colourInput("xCol", NULL, "yellow", palette = "limited", showColour = 'background')),
    
    # some original code kept for examples
    selectInput('ycol', 'Y Variable', names(iris),
                selected=names(iris)[[2]]),

    numericInput('clusters', 'Cluster count', 3,
                 min = 1, max = 9),
    
    radioButtons('regressionLineChoice', 'Choose:', regressionLineChoiceList),
    
    div(
      class = "section",
            div(class = "title", "Choose regression line color"),
            colourInput("regLineColor", NULL, "yellow", palette = "limited", showColour = 'background')),
    
    # put a link to the docx file for those who want to download it
    wellPanel(
      helpText(a("Paul's Original Summary/HTML", href=paulsHTMLSummaryLoc))
    ) #,
    # wellPanel(
    #   helpText(a("Paul's Original Summary/.docx", href=paulsDOCXSummaryLoc))
    #   )
    
    ),
  mainPanel(
    plotOutput('plot1')
  )
))


