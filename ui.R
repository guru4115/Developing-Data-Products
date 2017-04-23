library(shiny)
library(leaflet)

# Define UI for application 
shinyUI(pageWithSidebar(
        
        # Application title
        headerPanel("Locations of Earthquakes off Fiji"),
        
        # Sidebar with slider controls to select the magnitude of the quake

        sidebarPanel(
                h4("Select magnitude "),
                  sliderInput("mag", 
                            "Magnitude:", 
                            value = 4,
                            min = 4, 
                            max = 6.5, 
                            step = 0.1)
                
                
        ),
        
        # Show a tabset that includes a plot, summary, and table view
        # of the generated map, summary and table
        mainPanel(
                tabsetPanel(
                        tabPanel("Map", leafletOutput("map")), 
                        tabPanel("Summary", verbatimTextOutput("summary")), 
                        tabPanel("Table", tableOutput("table"))
                )
        )
))
        
        
