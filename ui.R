#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(plotly)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Shiny App with Plotly"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
      h4("Select the type of data you want to plot. Petal or Sepal"),
      radioButtons("dataset", "Select Plot Data:",
                   list("Petal" = "petal",
                        "Sepal" = "sepal")),
      h4("Select the plot type"),
      selectInput("plotType", "Choose a Plot Type:", 
                  choices = c("scatter", "box", "histogram"))
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      title="IRIS data using Plotly",
      plotlyOutput("distPlot"),
      h5("In this application, IRIS data is plotted based on the user selection in a reactive fashion."),
      h6("You can select the type of data you want to plot for each species. i.e. based on Petal or Sepal information."),
      h6("Additionally the user can select the type of Plot they would like to see.")
    )
  )
))
