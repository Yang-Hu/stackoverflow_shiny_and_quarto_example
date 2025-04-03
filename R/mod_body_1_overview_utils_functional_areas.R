#' R6 class for functional_areas
#'
#' @description A class generator function for initiating unique IDs, monitoring click behaviour, and triggering actions
#'  accordingly.
#'
#' @importFrom gargoyle init trigger
#' @importFrom R6 R6Class
#'
#' @noRd

functional_areas <- R6Class(

  classname = "functional_areas",

  # 1. Define the initial values ---------------------------------------------------------------------------------------

  public = list(
    base_model  = 0,
    fine_tuning = 0,
    efpmpedia   = 0,


    # 2. Initialise the unique IDs -------------------------------------------------------------------------------------

    initialize = \() {
      init("base_model_click")
      init("fine_tuning_click")
      init("efpmpedia_click")
    },


    # 3. Define the increment_ functions -------------------------------------------------------------------------------

    increment_base_model = function() {
      self$base_model  <- self$base_model + 1
      trigger("base_model_click")
    },

    increment_fine_tuning = function() {
      self$fine_tuning <- self$fine_tuning + 1
      trigger("fine_tuning_click")
    },

    increment_efpmpedia = function() {
      self$efpmpedia   <- self$efpmpedia + 1
      trigger("efpmpedia_click")
    }
  )
)
