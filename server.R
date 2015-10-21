## server.r

library(shiny)
library(UsingR)

# Load data processing file
source("09 final project.R")

# Shiny server
shinyServer(
        function(input, output) {
                output$setid <- renderText({input$setid})
                
                openPage <- function(url) {
                        return(tags$a(href=url, "Click here!", target="_blank"))
                }
                
                
                
                # Initialize reactive values
                values <- reactiveValues()
                values$states <- dataS
                #values$condition <- c("Heart Attack", "Heart Failure", "Pneumonia")
                
                # Create event type checkbox for states
                output$themesControl <- renderUI({
                        checkboxGroupInput('States_sel', 'USA States:', 
                                           dataS, selected = values$states)
                })
                
                # Add observer on select-all button
                observe({
                        if(input$selectAll == 0) return()
                        values$states <- dataS
                })
                
                # Add observer on clear-all button
                observe({
                        if(input$clearAll == 0) return()
                        values$states <- c() # empty list
                })
                
                dataTable <- reactive({
                        seltop10(data, input$condi, 
                                       input$States_sel)
                })
                
                
                # Render data table
                output$dTable <- renderDataTable({
                        dataTable()
                } #, 
                )
                
                # Render best 10 hospitals
                output$best10 <- renderChart({
                        plottop10(dataTable())
                })
                
                # render bottom 10 hospitals
                output$worst10 <- renderChart({
                        plotbottom10(dataTable())
                })
                
                
                # Render summary satistical facts
                output$sd <- renderPrint({
                        dataset <- dataTable()
                        summary(dataset$Selection)
                })
                
                
        } # end of function(input, output)
)




