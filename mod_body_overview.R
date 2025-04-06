#' ui_2_1_overview UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
#' @importFrom bslib page_fillable layout_column_wrap input_task_button nav_insert update_task_button card_header card tooltip popover card_footer navset_card_tab
#' @importFrom gargoyle watch
#' @importFrom fontawesome fa_i
#' @importFrom shinyjs delay onclick
#'
#' @import ggplot2

mod_body_1_overview_ui <- function(id) {

  ns <- NS(id)

  tagList(

    layout_column_wrap(

      width = 1,
      heights_equal = "row",


      card(

        card_header(
          "Getting Started",
          tooltip(
            trigger = bs_icon("info-circle"),
            "Click any section to begin",
            placement = "auto"
          )
        ),

        card_body(

          layout_column_wrap(

            width         = 1/3,
            heights_equal = "row",

            value_box(
              id              = ns("base_model"),
              showcase        = bs_icon(name = "circle"),
              showcase_layout = "left center",
              value           = "Base Model",
              title           = " "),

              full_screen     = FALSE,
              style           = "cursor: pointer;"),


            value_box(
              id              = ns("fine_tuning"),
              showcase        = bs_icon(name = "exposure"),
              showcase_layout = "left center",
              value           = "Fine-Tuning",
              title           = " ",
              markdown("Modify the base model and compare different scenarios to the baseline."),

              full_screen     = FALSE,
              style           = "cursor: pointer;"),


            value_box(
              id              = ns("efpmpedia"),
              showcase        = bs_icon(name = "book"),
              showcase_layout = "left center",
              value           = "EFPMpedia",
              title           = " ",
              markdown("Explore detailed information about the model in the comprehensive documentation."),

              full_screen     = FALSE,
              style           = "cursor: pointer;")
          )

        )
      )
    )
}


mod_body_1_overview_server <- function(id, button){
  moduleServer(id, function(input, output, session){
    ns <- session$ns

    onclick(id = "base_model",  expr = button$increment_base_model()  )
    onclick(id = "fine_tuning", expr = button$increment_fine_tuning() )
    onclick(id = "efpmpedia",   expr = button$increment_efpmpedia()   )
  })
}
