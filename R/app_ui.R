#' The application User-Interface
#'
#' @param request Internal parameter for `{shiny}`.
#'     DO NOT REMOVE.
#' @import shiny
#' @import bslib
#' @import htmltools
#' @importFrom shinyjs useShinyjs
#'
#' @noRd

app_ui <- function(request) {

  # Application UI logic:
  tagList(

    # Leave this function for adding external resources:
    golem_add_external_resources(),

    # 0. Welcome page UI -----------------------------------------------------------------------------------------------

    mod_0_welcome_ui("welcome"),


    # 1. Main page -----------------------------------------------------------------------------------------------------

    page_fillable(
      id      = "main-app",
      style   = "display: none; opacity: 0; !important",  # Initially hidden
      theme   = bs_theme(version = 5),
      lang    = "en",
      padding = c(0, 0, 0, 0),

      # 1.1 Module of the top header area:
      mod_header_ui(id = "ui_header"),

      # 1.2 Module of the main body area:
      mod_body_ui(id   = "ui_body")
    )
  )
}

#' Add external Resources to the Application
#'
#' This function is internally used to add external
#' resources inside the Shiny application.
#'
#' @import shiny
#' @importFrom golem add_resource_path activate_js favicon bundle_resources
#' @noRd
golem_add_external_resources <- function() {

  # General resources:
  add_resource_path(
    "www",
    app_sys("app/www")
  )

  tags$head(
    favicon(resources_path = "www/img"),
    bundle_resources(
      path          = app_sys("app/www"),
      app_title     = "Example"
    ),

    # Add here other external resources
    # for example, you can add shinyalert::useShinyalert()
    useShinyjs()
  )
}
