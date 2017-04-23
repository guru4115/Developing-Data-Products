library(shiny)
library(leaflet)

# Define UI for random distribution application 
shinyUI(pageWithSidebar(
        
        # Application title
        headerPanel("Locations of Earthquakes off Fiji"),
        
        # Sidebar with controls to select the random distribution type
        # and number of observations to generate. Note the use of the br()
        # element to introduce extra vertical spacing
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
        # of the generated distribution
        mainPanel(
                tabsetPanel(
                        tabPanel("Map", leafletOutput("map")), 
                        tabPanel("Summary", verbatimTextOutput("summary")), 
                        tabPanel("Table", tableOutput("table"))
                )
        )
))
        
        
