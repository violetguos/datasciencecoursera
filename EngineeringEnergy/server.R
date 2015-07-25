library(shiny)
library("ggplot2")
library(datasets)
library(googleVis)

countriesData<-read.csv("TotalRenewableElectricity copy.csv")

shinyServer(function(input, output) {
  
#prints the year selected  
  output$choiceYear <- renderPrint({input$Year})
  drawYear<- reactive({
    input$Year
  })
 
 ####COMPUTATION###
 #select the energy data of all countries in a given year
 #creates a data subset of the .csv file.
  datasub <- reactive({
    # update dataset each time year is selected
    subset(countriesData, Time == input$Year)
  })
  
#make the geo chart, listing all the countries and its renewable energy  
 output$Geo <-renderGvis({ 
  Geo<-gvisGeoChart(datasub(), locationvar="Country.Name", 
                    colorvar="Energy.Value",
                    options = list(width=600, height=400,
                                   projection="kavrayskiy-vii",
                                   colorAxis="{colors:['#91BFDB', '#FC8D59']}"))

 })
 
#print the geo chart on screen
outputOptions(output,"Geo")
  
})
