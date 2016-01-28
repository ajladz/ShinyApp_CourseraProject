library(shiny)
data(airquality)

shinyServer(
        function(input, output) {
                data <- reactive({
                        switch(input$var,
                               "Ozone" = airquality$Ozone,
                               "Solar radiation" = airquality$Solar.R,
                               "Wind" = airquality$Wind,
                               "Temperature" = airquality$Temp,
                               airquality$Ozone)
                })
                
                
                output$plot <- renderPlot({
                        var <- input$var
                        bins <- seq(min(data(),na.rm = TRUE), max(data(), na.rm = TRUE), length.out = input$bins + 1)
                        hist(data(),na.rm = TRUE,breaks = bins, xlab = var, col='lightblue',main='Histogram')
                })
                
                output$summary <- renderPrint({
                        summary(data())
                })
                
                output$table <- renderTable({
                        data.frame(data())
                })
                
                output$documentation <- renderText({  
                        readLines("Documentation/Documentation.html")  
                })
           
        }
)