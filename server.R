function(input, output) {
  output$plot1 <- renderPlot({
    x <- rnorm(500,0,1)
    bins <- seq(min(x), max(x), length.out = input$bins +1)
    hist(x, breaks = bins, col = "green", border = "blue",freq=TRUE)
    
    
  })}
