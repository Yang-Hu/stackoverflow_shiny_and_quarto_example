#' mod_0_welcome UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList observeEvent
#' @importFrom htmltools tags
#' @importFrom bslib page_fillable input_task_button
#' @importFrom fontawesome fa_i
#' @importFrom shinyjs runjs

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

          # 2.1 Header:
          tags$h1("Welcome page",
                  id    = "welcome_header",
                  style = "font-size: 2.5rem; font-weight: bold; animation: fadeIn 1s ease-in;")
        ),

        # 3. Background art [or science? :)] ---------------------------------------------------------------------------

        tags$img(src   = "www/img/sweeping_fractal_lines.svg",
                 style = "width: 100vw; height: 100vh; object-fit: cover; animation: fadeIn 1s ease-in;"),


        # 4. Action button ---------------------------------------------------------------------------------------------
        # The only interactive element in this page that invites the users to explore the main application.

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
            class      = "bs-btn-hover-bg",
            alt        = "Please click this button to enter the main model page")
        )
      )
    )
  )
}

#' mod_0_welcome Server Functions
#'
#' @noRd
mod_0_welcome_server <- function(id){
  moduleServer(id, function(input, output, session){
    ns <- session$ns

    # Transition to Main App
    observeEvent(input$explore_button, {
      runjs(
        "// Fade out the welcome page and fade in the main app simultaneously:
         $('#start-page').fadeOut(1200);
         $('#main-app').fadeIn(1200);

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

  })
}
