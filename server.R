#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(plotly)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {

  xData <- reactive({
    if (input$dataset == "petal") {
      iris$Petal.Length
    }
    else {
      iris$Sepal.Length
    }
  })
  
  yData <- reactive({
    if (input$dataset == "petal") {
      iris$Petal.Width
    }
    else {
      iris$Sepal.Width
    }
  })    
  
  plotType <- reactive({input$plotType})
  
  output$distPlot <- renderPlotly({
    
    # draw the histogram with the specified number of bins
    p <- plot_ly(iris,x=yData(),y=xData(),color=iris$Species,type=plotType(), mode="markers") %>%
      layout(
        scene = list(
          xaxis = list(title = "Length"),
          yaxis = list(title = "Width")
        ))
  })
  
})
