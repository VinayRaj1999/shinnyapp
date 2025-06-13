library(shiny)
library(tidyverse)
library(janitor)
library(lubridate)

ui <- fluidPage(
  tableOutput("tb1")
)

server <- function(input, output, session) {
  
  # Load and clean the dataset
  data1 <- reactive({
    read_csv("INDIA-AQI-DATA-2015-2020.csv") %>%
      clean_names()
  })
  
  # Extract date parts safely
  data2 <- reactive({
    df <- data1()
    
    df %>% 
      mutate(
        year = year(date),
        month = month(date),
        day = day(date),
        week = week(date),
        weekdays = wday(date, label = TRUE)
      )
  })
  
  # Show table
  output$tb1 <- renderTable({
    data2() %>% head(20)  # show only first 20 rows for safety
  })
}

shinyApp(ui, server)
