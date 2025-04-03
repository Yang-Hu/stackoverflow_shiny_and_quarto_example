#' The application server-side
#'
#' @param input,output,session Internal parameters for {shiny}.
#'     DO NOT REMOVE.
#' @import shiny
#'
#' @noRd

app_server <- function(input, output, session) {

  # 0. Preparation -----------------------------------------------------------------------------------------------------

  # 0.1 Display mode
  display_manager       <- display_mode$new()

  # 0.2 First page buttons:
  function_area_manager <- functional_areas$new()


  # 1. Body ------------------------------------------------------------------------------------------------------------

  mod_0_welcome_server("welcome")

  # 1.1 Header:
  mod_ui_header_server(id = "ui_header", display = display_manager)

  # 1.2 Main area:
  mod_body_server(id = "ui_body", display = display_manager, function_area = function_area_manager)

}
