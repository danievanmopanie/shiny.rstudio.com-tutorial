library(shiny)

ui <- fluidPage(
  sliderInput(       #?sliderInput() question mark to look at the help file
    inputId = "num", 
    label = "Choose a number", 
    value = 50, min = 0, max = 100),
  
  plotOutput("hist")
  
)

#server <- function(input, output) {}

#shinyApp(ui = ui, server = server)

server <- function(input, output) {
  output$hist <- renderPlot({
    title = print(paste("Slider number selected histogram of", input$num, "random values"))
    hist(rnorm(input$num), main = title)
  })
}

shinyApp(ui = ui, server = server)
