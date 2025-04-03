#' Header UI Function
#'
#' @description A shiny Module for creating the top header area of the UI.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
#' @importFrom htmltools tags
#' @importFrom bslib input_dark_mode nav_select card_body navset_card_underline tooltip
#' @importFrom gargoyle trigger
#' @importFrom bsicons bs_icon

mod_header_ui <- function(id) {

  ns <- NS(id)

  tagList(

    # 1. Container for HTML elements -----------------------------------------------------------------------------------

    tags$div(id = "ui_header_container",

             # 1.4 Utility button:
             tags$div(id =  "utility_panel",

                      # Button for display theme:
                      input_dark_mode(mode = "light",
                                      id   = ns("display_mode"),
                                      alt  = "Button to toggle between dark and light modes"))
    )
  )
}

#' Header Server Functions
#'
#' @noRd

mod_ui_header_server <- function(id, display){

  moduleServer(id, function(input, output, session){

    ns <- session$ns

    # 1. Observe the input for display mode ----------------------------------------------------------------------------

    observeEvent(input$display_mode, {

      # 1.1 Assign the new value:
      display$mode <- input$display_mode

      # 1.2 Update every time input is updated:
      trigger("display_mode")
    })
  })
}
