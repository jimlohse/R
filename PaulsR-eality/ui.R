# ui.R for Global Data Competition

# Global Data Competition submission, this script and Shiny app Copyright 2015 by Jim Lohse
# The core statistical analysis is Copyright 2015 the Data God aka Paul Ricci, Master Statistician

# please see notes / project requirements in runThisScript.R

# adapted from http://shiny.rstudio.com/gallery/kmeans-example.html

monthOfYearList = c('January'='201301','February'='201302','March'='201303','April'='201304','May'='201305',
                    'June'='201306','July'='201307','August'='201308','September'='201309','October'='201310',
                    'November'='201311','December'='201312')

regressionLineChoiceList = c('None selected' = 'none', 'Linear Regression' = 'linearRegression',
                             'Quadratic Regression' = 'quadraticRegression', 'Cubic Regression' = 'cubicRegression')

paulsHTMLSummaryLoc = 'https://jimlohse.shinyapps.io/PaulsR-eality/paulsSummary.html'

paulsDOCXSummaryLoc = 'https://drive.google.com/file/d/0B9gPBHNny48iblZFRk9aZ2plbzQ/view?usp=sharing'


shinyUI(pageWithSidebar(
  headerPanel('Analysis of Utah Weather Data by Month'),
  
  sidebarPanel(
    selectInput('monthOfYear', 'Choose a Month:', monthOfYearList),
    
    # div(
    #   class = "section",
    #   div(class = "title", "Graph Data Color"),
    #   colourInput("xCol", NULL, "yellow", palette = "limited", showColour = 'background')),
    
    
    radioButtons('regressionLineChoice', 'Choose:', regressionLineChoiceList),
    
    # div(
    #   class = "section",
    #         div(class = "title", "Choose regression line color"),
    #         colourInput("regLineColor", NULL, "yellow", palette = "limited", showColour = 'background')),
    
    wellPanel(
      #helpText(a("See full analysis (HTML)", target="_blank", href=paulsHTMLSummaryLoc)),
      helpText(a("See full analysis Google Doc", target="_blank", href=paulsDOCXSummaryLoc)),
      helpText(a("See/download project on Github", target="_blank", href='https://github.com/jimlohse/R/tree/master/PaulsR-eality'))
       )
    
    ),
  mainPanel(
    plotOutput('plot1')
  )
))
