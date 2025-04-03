#' ui_1_header
#'
#' @description A class generator function
#'
#' @importFrom gargoyle init
#' @importFrom R6 R6Class
#'
#' @noRd

display_mode <- R6::R6Class(
  classname = "display_mode",
  public = list(
    mode = "light",

    initialize = \() {
      init("display_mode")
    }
  )
)
