library(shiny)
library(bslib)
library(fontawesome)
library(shinyjs)
library(R6)
library(bsicons)
library(gargoyle)

source(file = "mod_body_overview.R")
source(file = "fct_select_area.R")

# Module 1: Welcome page (please fold) ---------------------------------------------------------------------------------

mod_0_welcome_ui <- function(id) {
  ns <- NS(id)
  tagList(

    tags$div(
      id = "start-page",

      page_fillable(
        padding = c(0, 0, 0, 0),

        tags$div(
          id    = "ui_welcome_information",
          style = "position: absolute; top: 15vh; left: 50%; transform: translateX(-50%); text-align: center; color: black; z-index: 3;",
          alt   = "Full name and slogan of the model",

          # 1.1 Header:
          tags$h1("Welcome page",
                  id    = "welcome_header",
                  style = "font-size: 2.5rem; font-weight: bold; "),
        ),

        tags$img(src   = "img/sweeping_fractal_lines.svg",
                 style = "width: 100vw; height: 100vh; object-fit: cover;"),

        tags$div(
          id    = "button_container",
          class = "d-flex justify-content-center gap-2",
          style = "position: absolute; bottom: 17%; left: 50%; transform: translateX(-50%);",

          input_task_button(
            id         = ns("explore_button"),
            label      = "Explore more",
            label_busy = "Exploring",
            auto_reset = FALSE,
            icon_busy  = fa_i(name = "spinner", class = "fa-spin", "aria-hidden" = "true"),
            class      = "bs-btn-hover-bg")
        )
      )
    )
  )
}

mod_0_welcome_server <- function(id){
  moduleServer(id, function(input, output, session){
    ns <- session$ns

    # Transition to Main App
    observeEvent(input$explore_button, {
      runjs(
        "// Fade out the welcome page and fade in the main app simultaneously:
         $('#start-page').fadeOut(1200);
         $('#main-app').fadeIn(1200);
        ")
    })
  })
}


# Module 2: Shiny display control (Key input from Shiny) ---------------------------------------------------------------
mod_header_ui <- function(id) {

  ns <- NS(id)

  tagList(

    tags$div(id = "ui_header_container",

             # 1.4 Utility buttons:
             tags$div(id =  "utility_panel",

                      # (3/3) Button for display theme:
                      input_dark_mode(mode = "light",
                                      id   = ns("display_mode"),
                                      alt  = "Button to toggle between dark and light modes"))
    )
  )
}


mod_ui_header_server <- function(id){

  moduleServer(id, function(input, output, session){

    ns <- session$ns

  })
}

# Module 3: iframe will appear after `EFPMpedia` is clicked (please fold) ----------------------------------------------

mod_body_ui <- function(id) {
  ns <- NS(id)

  tagList(

    navset_bar(
      selected = "Overview",
      id       = ns("tabs"),  # Unique id added here

      # gap = "10px",

      padding = c("0px", "14px", "30px", "14px"),


      # Panel 1: Overview:
      nav_panel(title = "Overview", mod_body_1_overview_ui(id = ns("body_1_overview")))

    )
  )
}


mod_body_server <- function(id, function_area){
  moduleServer(id, function(input, output, session){
    ns <- session$ns

    mod_body_1_overview_server("body_1_overview", function_area)

    select_function_area(function_area,
                         base_model_ui  = "(placeholder for the base module)",
                         fine_tuning_ui = "(placeholder for the 2nd module)",
                         efpmpedia_ui   = mod_EFPMpedia_ui("EFPMpedia_1"))


    mod_EFPMpedia_server("EFPMpedia_1")

  })
}





# Module 4: iframe (key module for the output quarto website) ----------------------------------------------------------

mod_EFPMpedia_ui <- function(id) {
  ns <- NS(id)
  tagList(

    page_fillable(

      padding = c(0, 0, 0, 0),

      tags$iframe(
        id    = "EFPMpedia",
        src   = "_site/index.html",
        style = "height:86.5vh; margin-top:-37px; width:100%;")
    )
  )
}


mod_EFPMpedia_server <- function(id){
  moduleServer(id, function(input, output, session){
    ns <- session$ns

    # The target JavaScript is here:
    runjs("
        // Wait until Shiny is fully idle (app is ready), then run dark mode sync script
    $(document).on('shiny:idle', function () {

      var iframe = document.getElementById('EFPMpedia');
      var innerDoc = iframe.contentDocument || iframe.contentWindow.document;
      var ShinyDarkMode = document.getElementById('ui_header-display_mode').shadowRoot.querySelector('button');
      var QuartoDarkMode = innerDoc.querySelector('.quarto-color-scheme-toggle');

      QuartoDarkMode.addEventListener('click', function(event) {
          if (!event.isTrusted) {
              return;
          }
          ShinyDarkMode.click();
      });

      ShinyDarkMode.addEventListener('click', function(event) {
          if (!event.isTrusted) {
              return;
          }
          QuartoDarkMode.click();
      });

      // Remove this event listener to prevent re-running multiple times
      $(document).off('shiny:idle');
    });
      ")

  })
}





# Main app -------------------------------------------------------------------------------------------------------------

ui <- tagList(

  useShinyjs(),

  mod_0_welcome_ui("welcome"),


  page_fillable(
    id      = "main-app",
    style   = "display: none; opacity: 0; !important",  # Initially hidden
    theme   = bs_theme(version = 5),
    lang    = "en",
    padding = c(0, 0, 0, 0),

    # 1.1 Module of the top header area:
    mod_header_ui(id = "ui_header"),

    mod_body_ui(id   = "ui_body")

  )
)

server <- function(input, output, session) {

  function_area_manager <- functional_areas$new()

  mod_0_welcome_server("welcome")

  mod_ui_header_server(id = "ui_header")

  mod_body_server(id = "ui_body", function_area = function_area_manager)

}



shinyApp(ui, server)
