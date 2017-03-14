#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(navbarPage("Central Limit Theorem",tabPanel("Histogram" ,
  titlePanel("Central Limit Theorem Proof in Histogram"),
  inputPanel(
    selectInput("dis", label = "Distribution",
                choices = c("normal", "exponential"), selected = "exponential"),
    
    selectInput("n", label = "Number of observations:",
                choices = c(5, 10, 20, 50, 75, 100, 500, 1000), selected = 5),
    
    sliderInput("nsamp", label = "Number of samples",
                min = 0, max = 1000, value = 500, step = 100)
  ),
  mainPanel(
   h3("Graph of Distribution"),
   plotOutput("plot")
  )
),
tabPanel("About",
mainPanel(
  h3("A simple application for Knowing CLT"),
  h5("This application is to give a simple example of the central limit theorem. Displaying how random variables from exponential random distribution approximate to the normal distribution. Here we use the exponential distribution with rate 1.  We provide different settings of samples and observations. You can choose any combination between number of samples and observations. The code are in", a("github.", 
          href = "https://github.com/sangaj/Simple-shiny-project/"))
))
))
