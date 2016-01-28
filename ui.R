
library(shiny)

shinyUI(navbarPage("AirqualityApp",
                   tabPanel("Documentation", fluidPage(
                           htmlOutput('documentation')
                   )),
                   
                   tabPanel("App", fluidPage(
                           # Application title
                           titlePanel("Airquality data"),
                           
                           # Sidebar with controls to select the variable from airquality data set.
                           sidebarLayout(
                                   sidebarPanel(
                                           selectInput("var", "Choose a variable:", 
                                                       choices = c("Ozone", "Solar radiation", "Wind", "Temperature")),
                                           
                                           br(),
                                           
                                           sliderInput("bins", "Number of bins:",
                                                       min = 1,
                                                       max = 50,
                                                       value = 30),
                                           br(),
                                           helpText("Note: Data set airquality contains daily measurements of air quality in",
                                                    "New York, May to September 1973.")
                                           
                                   ),
                                   
                                   # Show a tabset that includes a plot, summary, and table view
                                   # of the chosen variable.
                                   mainPanel(
                                           tabsetPanel(type = "tabs", 
                                                       tabPanel("Plot", plotOutput("plot")), 
                                                       tabPanel("Summary", verbatimTextOutput("summary")), 
                                                       tabPanel("Table", tableOutput("table"))
                                           )
                                   )
                           )
                   ))
))

