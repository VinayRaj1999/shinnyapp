library(shiny)

ui <- fluidPage(
  titlePanel("sidebar layout"),
  sidebarLayout(
    sidebarPanel(
      h1("T1")
    ),
    mainPanel()
  )
)

server <- function(input, output, session) {
  
}

shinyApp(ui, server)