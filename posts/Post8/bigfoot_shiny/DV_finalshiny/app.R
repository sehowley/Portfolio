#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(shinyWidgets)
bigfoot <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2022/2022-09-13/bigfoot.csv')

#shiny app that has all of the histograms

ui <- fluidPage(
  
  setBackgroundColor(color = "forestgreen"),
  
  titlePanel("Common Conditions for a Bigfoot Sighting"),
  
  selectInput("Ind","Weather Condition",choices = c("pressure", 
                                                    "dew_point", 
                                                    "visibility",
                                                    "wind_speed",
                                                    "temperature_mid",
                                                    "humidity",
                                                    "moon_phase",
                                                    "cloud_cover",
                                                    "uv_index")),
  plotOutput('Hist')
)
server <- function(input, output, session) {
  
  data <- reactive({
    input$Ind
  })
  
  output$Hist <- renderPlot({
    
    req(data())
    hist(bigfoot[[data()]], col="chocolate4", 
         xlab=data(),
         main="")
    
    rect(par("usr")[1], par("usr")[1],
         par("usr")[3], par("usr")[2],
         col = "red") # Color
    
  }) 
  
}

shinyApp(ui, server)