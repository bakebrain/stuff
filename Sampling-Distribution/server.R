library(shiny)

shinyServer(function(input, output) {
  
  data <- reactive({
    dist <- switch(input$dist, norm = rnorm, unif = runif, lnorm = rlnorm,
                   exp = rexp, rnorm)
    
    dist(input$n)
  })
  
  output$plot <- renderPlot({
    dist <- input$dist
    n <- input$n
    hist(data(),  main=paste('r', dist, '(', n, ')', sep=''))
  })
  
  output$sdist <- renderPlot({
    sample_size <- input$sample_size
    sample_amount <- input$sample_amount
    out <- replicate(sample_amount, 
                     mean(sample(data(), 
                                 sample_size)))
    
    h <- hist(out, 
         main=paste('Distribution of means (Sample size: ', sample_size, ')', 
                    sep=''), col = "grey")
    
  })
  
  
  # Generate an HTML table view of the data
  output$table <- renderTable({
    data.frame(x=data())
  })
  
})