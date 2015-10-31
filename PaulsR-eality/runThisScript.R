# Global Data Competition submission, this script and Shiny app Copyright 2015 by Jim Lohse
# The core statistical analysis is Copyright 2015 the Data God aka Paul Ricci, Master Statistician

# you need the following files to make this Shiny app work:
# ---------------------------------------------------------
# ui.R -- the (you guessed it) user interface part of a Shiny app
# server.R -- the server part
# runThisScript.R -- this script, start this and it will do the work
# 
# DATA SETS
# We are not dynamically linking to an URL for the data because some of the data comes from NOAA
# who (without investigating too deeply) seems to give URLs that expire
#
# RStudio Version
# Shiny and these scripts are written for RStudio 0.99.747
#
# according to shiny.rstudio.com/tutorial/lesson1, this version of RStudio contains
# optimizations for Shiny. If you are running an older version of RStudio (or R) and
# it doesn't work, please check your versions, for any assistance contact jim@supportml.com

# Let's get started!

# be sure to set working directory! ... it already should be set to here, but be sure the working directory 
# is set where this script lives, so when it calls runapp it finds the server.R and ui.R files

# check to see if shiny is installed, if not get permission and install it
# using require instead of library because it more reliably returns a boolean
if (require("shiny", quietly = FALSE)){
  
  print("Shiny is installed correctly")
  
} else {
  
  print("Trying to install shiny, it appears to be missing...")
  theAnswer <- readline("Install Shiny? (Y/y or N/n)")
  
  if (tolower(substr(theAnswer,0,1)) == 'y'){
    
    print("Please wait while Shiny is installed, if it fails install manually with:", quote = FALSE)
    print('install.packages("shiny") at the command line in RStudio', quote = FALSE)
    
    # install shiny
    install.packages("shiny")
  
    if(require(shiny)){
      print("Now Shiny is installed correctly")
    } else {
      stop("Sorry, could not install Shiny, exiting...")
    }
  } else {
    stop("Sorry you can't run this app without Shiny! Exiting...")
  }
}

# now do the same for ShinyJS for color pickers...
if (require("shinyjs", quietly = FALSE)){
  
  print("ShinyJS is installed correctly")
  
} else {
  
  print("Trying to install shinyjs, it appears to be missing...")
  theAnswer <- readline("Install ShinyJS? (Y/y or N/n)")
  
  if (tolower(substr(theAnswer,0,1)) == 'y'){
    
    print("Please wait while ShinyJS is installed, if it fails install manually with:", quote = FALSE)
    print('install.packages("shinyjs") at the command line in RStudio', quote = FALSE)
    
    # install shiny
    install.packages("shinyjs")
    
    if(require(shiny)){
      print("Now ShinyJS is installed correctly")
    } else {
      stop("Sorry, could not install ShinyJS, exiting...")
    }
  } else {
    stop("Sorry you can't run this app without ShinyJS! Exiting...")
  }
}

# never executes, just lets the environment know V8 is a dependency
if (FALSE) require("V8")

# now that Shiny and ShinyJS are both confirmed / installed... maybe do some checking on getwd (later)
# see if the Shiny app files are here:
if (!( file.exists("ui.R") && file.exists("server.R"))) {
  stop(paste("There is not a shiny app installed in", getwd()))
} 

# see if the two data set files are here:
if ( file.exists("airQualityDataUtah2013.csv") && file.exists("climateDataUtah2013.csv")) {
  
  # this is the money line that runs the Shiny app
  runApp("./", display.mode = "showcase")
  
}else{
  stop(paste("Data sets are missing! Exiting...", getwd()))
} 

print()







