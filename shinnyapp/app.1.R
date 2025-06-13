library(shiny)

ui <- fluidPage(
  textInput("id1",label = "Enter name"),
  textInput("id2",label = "Enter place"),
  # output
  textOutput("outid1")
  
)


server <- function(input, output, session) {
  
  output$outid1<-renderText({
  paste0(input$id1,"is from",input$id2)  
   
  })
}

shinyApp(ui, server)