library(shiny)
library(leaflet)
library(dplyr)
library(datasets)
data("quakes")
df<- quakes

# Define server logic for the application

shinyServer(function(input, output) {
        # Render map output
        output$map <- renderLeaflet({
                # Get input magnitude value
                magnitude<-input$mag
                # Filter by selected magnitude
                df<-filter(df, mag == magnitude)
                        
        map<- df %>%
        leaflet() %>%
        addTiles() %>%## Add map layer
        addCircles(weight = 1, radius = df$depth*100)## Add markers
                     

                     
        })
                # Render summary output
                output$summary <- renderPrint({
                # Get input magnitude value
                magnitude<-input$mag
                # Filter by selected magnitude
                table<-filter(df, mag == magnitude)
                summary(table[,3])
        })
        
        
        # Render table output
        output$table <- renderTable({
                # Get input magnitude value
                magnitude<-input$mag 
                # Filter by selected magnitude
                table<-filter(df[,5:3], mag == magnitude) # Filter by selected magnitude
        })
       
        
})