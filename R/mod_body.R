#' mod_body UI Function
#'
#' @description A shiny Module for the main body area, which contains nested modules for each panels.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
#' @importFrom gargoyle watch
#' @importFrom bslib navset_bar nav_panel nav_spacer nav_menu nav_item

mod_body_ui <- function(id) {
  ns <- NS(id)

  ########### temp
  link_shiny <- tags$a(class = "drop_down_item", shiny::icon("github"), "Shiny", href = "https://github.com/rstudio/shiny", target = "_blank")
  link_posit <- tags$a(class = "drop_down_item", shiny::icon("r-project"), "Posit", href = "https://posit.co", target = "_blank")
  ###########

  tagList(

    navset_bar(
      selected = "Overview",
      id       = ns("tabs"),  # Unique id added here

     # gap = "10px",

     padding = c("0px", "14px", "30px", "14px"),


      # Panel 1: Overview:
      nav_panel(title = "Overview", mod_body_1_overview_ui(id = ns("body_1_overview"))),

      nav_spacer(),
      nav_menu(
        title = "Links",
        nav_item(link_shiny),
        nav_item(link_posit)
      )
    )
  )
}

#' mod_body Server Functions
#'
#' @noRd
mod_body_server <- function(id, display, function_area){
  moduleServer(id, function(input, output, session){
    ns <- session$ns

    mod_body_1_overview_server("body_1_overview", display, function_area)

    select_function_area(function_area,
                         base_model_ui  = "Hi (placeholder for modules)",
                         fine_tuning_ui = "Hello (placeholder for modules)",
                         efpmpedia_ui   = mod_EFPMpedia_ui("EFPMpedia_1"))


    mod_EFPMpedia_server("EFPMpedia_1")

  })
}
