#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

ui <- fluidPage(
  
  titlePanel("Common conditions for a Bigfoot sighting"),
  
  selectInput("Ind","Weather Condition",choices = c("pressure", 
                                                    "dew_point", 
                                                    "visibility",
                                                    "wind_speed",
                                                    "temperature_mid",
                                                    "humidity")),
  plotOutput('Hist')
)
server <- function(input, output, session) {
  
  data1 <- reactive({
    input$Ind
  })
  
  output$Hist <- renderPlot({
    req(data1())
    hist(bigfoot[[data1()]])
  }) 
  
}

shinyApp(ui, server)