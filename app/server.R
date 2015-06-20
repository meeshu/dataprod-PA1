# server.R

#load needed libraries
library(shiny)
library(data.table)
library(RColorBrewer)
library(devtools)
library(maps)
library(mapproj)
library(dplyr)
library(DT)
source('helpers.R')


#read data file
visabystate<-data.frame(fread('data/visabystate.csv',stringsAsFactors=TRUE))

shinyServer(
      function(input, output) {
            
            output$map <- renderPlot({
                  data <- switch(input$choose, 
                                 "No. of cases registered" = 'casesbystate',
                                 "No. of full time positions applications" = 'fulltimebystate',
                                 "No. of workers needed" = 'workersbystate')
                  palname <- switch(input$choose, 
                                 "No. of cases registered" = "Greens",
                                 "No. of full time positions applications" = "Blues",
                                 "No. of workers needed" = "Purples")
                  legtitle <- switch(input$choose, 
                                    "No. of cases registered" = "No. of cases",
                                    "No. of full time positions applications" = "No. of full time positions",
                                    "No. of workers needed" = "No. of workers")
                 
                  
                  percent_map(DT=visabystate,var = data,statelist='employer_state', pal = palname,legend.title=legtitle)
                  
                  
            })
            output$optable <- DT::renderDataTable(visabystate,options=list(lengthChange=FALSE))
      }
)