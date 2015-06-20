# ui.R
library(markdown)

shinyUI(navbarPage(title="US Immigrant Visa Heatmap",
                   
                   tabPanel('Heatmap',
      hr(),
      
      
            fluidRow(
            column(4,
                  helpText("Create a map showing H1B visa related information across different states in US. 
                           The data is available for the period between October 1, 2014 through March 30, 2015
                           and has been downloaded from OFLC"),
                  hr(),
                  
                  selectInput("choose", 
                              label = "Choose a variable to display",
                              choices = c("No. of cases registered", "No. of full time positions applications",
                                          "No. of workers needed"),
                              selected = "No. of cases registered")
                  
            ),
                   
            column(8,plotOutput("map"))
            ),
            
            fluidRow(
                  DT::dataTableOutput("optable")
            )
                   ),
      tabPanel('Documentation', includeMarkdown("documentation.Rmd")
            
            )
      
))