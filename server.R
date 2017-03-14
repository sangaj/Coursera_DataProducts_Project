#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
   
  output$plot <- renderPlot({
    set.seed(2017)
    n <- as.numeric(input$n)
    nsamp <- ifelse(as.numeric(input$nsamp) != 0, as.numeric(input$nsamp), 1)
    if (input$dis == "normal"){
      mat <- matrix(rnorm(n * nsamp, 0, 1), nrow = n)
      xhist <- c(-3, 3) #set plausible limits for the x-as of the histogram
    }
    if (input$dis == "exponential"){
      mat <- matrix(rexp(n * nsamp, rate = 1), nrow = n)
      xhist <- c(0, 3)
    }
    hist(apply(mat,2,mean), probability = TRUE, breaks = 20, xlim = xhist, xlab = "Sample mean", main = paste("Histogram of ", nsamp, "samples"))
  })
  
})
