## ui.R 

library(shiny)
library(rCharts)

shinyUI(
        navbarPage("Hospital Ranking visualization", 
                   # multi-page user-interface 
                   tabPanel("Data Exploration",
                            sidebarPanel(
                                    selectInput("condi", "Select a medical condition:", 
                                                choices = c("Heart Attack", "Heart Failure", "Pneumonia")),
                                    
                                    uiOutput("themesControl"), # the id
                                    
                                    actionButton(inputId = "clearAll", 
                                                 label = "Clear selection", 
                                                 icon = icon("square-o")),
                                    actionButton(inputId = "selectAll", 
                                                 label = "Select all", 
                                                 icon = icon("check-square-o"))
                                    
                            ),
                            mainPanel(
                                    tabsetPanel(
                                            # Dataset 
                                            tabPanel(p(icon("table"), "Dataset"),
                                                     dataTableOutput(outputId="dTable")
                                            ), # end of "Dataset" tab panel
                                            tabPanel(p(icon("line-chart"), "Visualize the Data"), 
                                                     h4('Top 10 Hospitals- Lower mortality avg in Condition & State(s) selected', 
                                                        align = "center"),
                                                     showOutput("best10", "nvd3"),
                                                     h5('Please hover over each bar to see hosp. name & monthly avg Mortality.', 
                                                        align ="center"),
                                                     h4('Bottom 10 Hospitals- Higher mortality avg in Condiction & State(s) selected',
                                                        align = "center"),
                                                     showOutput("worst10", "nvd3"),
                                                     h4('Statistical Summary', align = "center"),
                                                     verbatimTextOutput("sd")
                                                     
                                            ) # end of "Visualize the Data" tab panel
                                            
                                    )
                                    
                            )     
                   ), # end of "Explore Dataset" tab panel
                   
               
                   
                   tabPanel("About / How to",
                            mainPanel(
                                    h3('About'), 
                                    h4('This application allows to visualize data and plots about Hospital Ranking information. Data set was taken'), 
                                    h4('from http://hospitalcompare.hhs.gov. This application subsets the data to have information about Heat Attack'),
                                    h4('Heart Failure and Pneumonia monthly deaths in each hospital in the US.'), 
                                    h3('How to use the app'),
                                    h4('You can start using the app by cliking on the "Data Exploration" tab in the main page.'),
                                    h4('From the left panel you can select the medical condition and one or multiple USA States.'),
                                    h4('Also, you have two buttoms to "Select all" or "Clear all" the States with one click.'),
                                    h4('     '),
                                    h4('In the right panel, you have 2 tabs. The first one "dataset" allows to see the selected data in table format.'),
                                    h4('The second one, "Visualize the data" will show you bar charts with the Top 10 and Bottom 10 hospitals'),
                                    h4('based on your selection.')
                                    #includeMarkdown("about.md")
                            )
                   ) # end of "About" tab panel
                   )
)

        