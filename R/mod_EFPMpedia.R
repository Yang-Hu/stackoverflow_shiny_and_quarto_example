#' EFPMpedia UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_EFPMpedia_ui <- function(id) {
  ns <- NS(id)
  tagList(

    page_fillable(

      padding = c(0, 0, 0, 0),

      tags$iframe(
        id = "EFPMpedia",
        src = "www/_site/index.html",
        style="height:86.5vh; margin-top:-37px; width:100%")

    )
  )
}

#' EFPMpedia Server Functions
#'
#' @noRd
mod_EFPMpedia_server <- function(id){
  moduleServer(id, function(input, output, session){
    ns <- session$ns

  })
}

## To be copied in the UI
# mod_EFPMpedia_ui("EFPMpedia_1")

## To be copied in the server
# mod_EFPMpedia_server("EFPMpedia_1")
