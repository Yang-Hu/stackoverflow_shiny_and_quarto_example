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


      layout_column_wrap(

        card(
          card_header("Introduction"),
          card_body(
            layout_column_wrap(
              width = 1/2,
              plotOutput(outputId = ns("plot")),
              markdown("### Title
          This famous (Fisher's or Anderson's) **iris data** set gives the measurements in
            centimeters of the variables sepal length and width and petal length and width,
            respectively, for 50 flowers from each of 3 species of iris. The species are Iris
            setosa, versicolor, and virginica.")
            )
          )
        )

      ),



      # Colour combination comes from: https://bslib.shinyapps.io/build-a-box/

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
              title           = " ",
              markdown(paste0("Built on the latest data.")),

              full_screen     = FALSE,
              style           = "cursor: pointer;"),


            value_box(
              id              = ns("fine_tuning"),
              showcase        = bs_icon(name = "exposure"),
              showcase_layout = "left center",
              value           = "Fine-Tuning",
              title           = " ",
              markdown("Modify the base model levers and compare different scenarios to the baseline."),

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
  )
}

#' ui_2_1_overview Server Functions
#'
#' @noRd
mod_body_1_overview_server <- function(id, display, button){
  moduleServer(id, function(input, output, session){
    ns <- session$ns

    output$plot <- renderPlot({

      iris |>
        ggplot2::ggplot(ggplot2::aes(x = Sepal.Length, y = Sepal.Width)) +
        ggplot2::geom_point() +
        ggplot2::theme_minimal()
    })

    onclick(id = "base_model",  expr = button$increment_base_model()  )
    onclick(id = "fine_tuning", expr = button$increment_fine_tuning() )
    onclick(id = "efpmpedia",   expr = button$increment_efpmpedia()   )
  })
}
