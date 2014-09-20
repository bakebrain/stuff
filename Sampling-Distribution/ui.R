library(shiny)

# Define UI for random distribution application 
shinyUI(fluidPage(
  
  # Application title
    titlePanel("Sampling distribution of the Sample Mean"),
    
    a('Read the Documentation', 
      href="https://bakebrain.shinyapps.io/sampling_distribution/docs/index.html"),
    br(),
    br(),
  
  sidebarLayout(
    sidebarPanel(
      radioButtons("dist", "Distribution type:",
                   c("Normal" = "norm",
                     "Uniform" = "unif",
                     "Log-normal" = "lnorm",
                     "Exponential" = "exp")),
      br(),
      
      sliderInput("n", "Number of observations:", value = 50, min = 1, max = 1000),
      sliderInput("sample_size", "Sample size:", value = 10, min = 1, max = 50),
      sliderInput("sample_amount", "# of Samples:", value = 100, min = 1, 
                  max = 10000)
    ),
    
    mainPanel(
      plotOutput("plot"),
      plotOutput("sdist")

    )
  )
))