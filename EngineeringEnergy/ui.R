library(shiny)
library(plotly)
library(ggplot2)
library("devtools")
library("ggvis")
library(googleVis)
library("plotly")
library("dplyr")
library("tidyr")
library("knitr")




shinyUI(fluidPage(
  
    # Application title.
    #The app will plot a coloured map to illustrate the quantity of renewable electricity generation worldwide.
  titlePanel("Reusable Energy Generation Worldwide from 2008 to 2012 (Billion Kilowatthours)"),
  

  sidebarLayout(
    sidebarPanel(
      
      #user input the year of renewable energy data. The slider input also has an animate button.
      sliderInput("Year", "Energy of the year to be displayed:", 
                  min=2008, max=2012, value=2008, step=1,
                  format="####",animate=TRUE),

    #helps navigate the user
      helpText("Choose a year to plot a world map of all the countries' renewable energy generation in that year, or go animate!"),
    #update the map according to the user input
      submitButton("Update Map")
    
    ),
    

    mainPanel(
    #display the user's input
      h5("You wish to see the summary of all countries in this year"),
      verbatimTextOutput("choiceYear"),
      tabsetPanel(
        #a tab to show a description of the author
        tabPanel("Description", p("You can view the renewable electricity generation of individual countries by hovering yout cursor on the map."),
                 p("Thanks for stopping by.")),
        
        #a tab to show the geo chart
        tabPanel("Map", htmlOutput("Geo"))
        
        
      )
   
    )
  )
))