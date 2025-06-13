iris %>% view()

iris %>% 
  pull(Species) %>% unique()

iris %>% 
  filter(Species=="setosa") %>% 
  ggplot(aes(x=Sepal.Length,y=Sepal.Width))+
  geom_point()+
  labs(title = "setosa")

# _____________________________________________________________________________
--------------------------------------------------------------------------------
  library(shiny)
library(tidyverse)  # Required for dplyr and ggplot functions

ui <- fluidPage(
  selectInput("species", "Select Species", choices = c("setosa", "versicolor", "virginica")),
  plotOutput("speciesplot"),
  tableOutput("speciestable")
)

server <- function(input, output, session) {
  
  # Reactive expression for filtered data
  speciesdata <- reactive({
    iris %>% 
      filter(Species == input$species)
  })
  
  # Render plot using the reactive data
  output$speciesplot <- renderPlot({
    speciesdata() %>% 
      ggplot(aes(x = Sepal.Length, y = Sepal.Width)) +
      geom_point() +
      labs(title = paste("Sepal Plot for", input$species))
  })
  
  # Render table using the reactive data
  output$speciestable <- renderTable({
    speciesdata()
  })
}

shinyApp(ui, server)

