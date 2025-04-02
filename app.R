library(shiny)
library(bslib)
library(htmltools)

ui <- page_fillable(

    input_dark_mode(id = "shiny_control", mode = "light"),

    tags$iframe(
      src = "_site/index.html",

      style = "height:86vh"
    )





)

server <- function(input, output, session) {

}

shinyApp(ui, server)
