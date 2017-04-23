library(shiny)
library(leaflet)
library(dplyr)
library(datasets)
data("quakes")
df<- quakes

# Define server logic for random distribution application
shinyServer(function(input, output) {

        output$map <- renderLeaflet({
                        magnitude<-input$mag
                        df<-filter(df, mag == magnitude)
                        
                     map<- df %>%
                        leaflet() %>%
                        addTiles() %>%
                        addCircles(weight = 1, radius = df$depth*100)
                     

                     
        })
        
        output$summary <- renderPrint({
                magnitude<-input$mag
                table<-filter(df, mag == magnitude)
                summary(table[,3])
        })
        
        
        
        output$table <- renderTable({
                magnitude<-input$mag
                table<-filter(df[,5:3], mag == magnitude)
        })
       
        
})