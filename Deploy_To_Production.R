#*********************************************************
#File Name:   Deploy_To_Production.R  
#
#Author:      David Noke
#
#Description: Example of how to deploy project using Shiny.
#
#Key Words: 
#
#*********************************************************
#Questions:
#   1-What is the species of the iris flower?
#   2-How was this prediction made?
#*********************************************************

#*********************************************************
#Hello Word! Example:
library(shiny)

#Create a UI
ui <- fluidPage("Hello World!")

#Create a server
server <- function(input, output){}

#Create Shiny app
shinyApp(
      ui = ui,
      server = server)

#*********************************************************
#Simple input/output example:
ui = fluidPage(
        titlePanel("Input and Output"),
        sidebarLayout(
            sidebarPanel(
              sliderInput(
                  inputId = "num",
                  label = "Choose a number",
                  min = 0,
                  max = 100,
                  value = 25)),
        mainPanel(
            textOutput(
                outputId = "text"))))

server <- function(input, output){
              output$text <- renderText({
                  paste("You selected ", input$num)})
          }

#Create Shiny app
shinyApp(
  ui = ui,
  server = server)


#*********************************************************
#Example using decision tree from iris data:

#Set working directory
setwd("C:/Kaggle/R Data")

#Load tree model
# Tree.RData was created in Machine_Learning.R file
load("Tree.RData")

#Load color brewer library
library(RColorBrewer)

#Create a color palette
palette <- brewer.pal(3, "Set2")

#Create UI
ui = fluidPage(
        titlePanel("Iris Species Predictor"),
        sidebarLayout(
            sidebarPanel(
              sliderInput(
                inputId = "petal.length",
                label = "Petal Length (cm)",
                min = 1,
                max = 7,
                value = 4),
              sliderInput(
                inputId = "petal.width",
                label = "Petal Width (cm)",
                min = 0.0,
                max = 2.5,
                step = 0.5,
                value = 1.5)),
        mainPanel(
            textOutput(
                outputId = "text"),
            plotOutput(
                outputId = "plot"))))

#Create server
server <- function(input, output){
  output$text <- renderText({
    
    #Create predictors based on user 
    #  supplied values
    predictors <- data.frame(
      Petal.Length = input$petal.length,
      Petal.Width = input$petal.width,
      Sepal.Length = 0,
      Sepal.Width = 0)
    
    #make prediction
    prediction = predict(
      object = model,
      newdata = predictors,
      type = "class")
      
    #Create prediction text
    paste("The predicted species is ", as.character(prediction))
    })
    
  output$plot = renderPlot({
      #Create a scatterplot colored by species
      plot(
        x = iris$Petal.Length,
        y = iris$Petal.Width,
        pch = 19,
        col = palette[as.numeric(iris$Species)],
        main = "Iris Petal Length vs. Width",
        xlab = "Petal Length (cm)",
        ylab = "Petal Width (cm)")

      #plot the decision boundaries
      partition.tree(
        model,
        label = "Species",
        add = TRUE)
      
      #Draw prediction on plot
      points(
        x = input$petal.length,
        y = input$petal.width,
        col = "red",
        pch = 4,
        cex = 2,
        lwd = 3)
    })
  }
  
#Create Shiny app
shinyApp(
  ui = ui,
  server = server)

