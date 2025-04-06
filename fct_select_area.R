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



select_function_area <- function(function_area, base_model_ui, fine_tuning_ui, efpmpedia_ui) {

  # 1. Logic of the base model -----------------------------------------------------------------------------------------

  observeEvent(watch("base_model_click"), {

    if (function_area$base_model == 1) {

      nav_insert(
        id       = "tabs",
        target   = "Overview",
        position = "after",
        select   = TRUE,
        nav      = nav_panel(title = "Base Model", base_model_ui)
      )

    } else {

      nav_select(id = "tabs", selected = "Base Model")
    }
  })


  # 2. Logic of the Fine-Tuning model ----------------------------------------------------------------------------------

  observeEvent(watch("fine_tuning_click"), {

    if (function_area$fine_tuning == 1 & function_area$base_model == 0) {

      nav_insert(
        id       = "tabs",
        target   = "Overview",
        position = "after",
        select   = TRUE,
        nav      = nav_panel(title = "Fine-Tuning", fine_tuning_ui)
      )

    } else if (function_area$fine_tuning == 1 & function_area$base_model == 1) {

      nav_insert(
        id       = "tabs",  # Match the id from navset_bar
        target   = "Base Model",
        position = "after",
        select   = TRUE,
        nav      = nav_panel(title = "Fine-Tuning", fine_tuning_ui))

    } else {

      nav_select(id = "tabs", selected = "Fine-Tuning")
    }
  })


  # 3. Logic of the EFPMpedia model ------------------------------------------------------------------------------------

  observeEvent(watch("efpmpedia_click"), {

    if (function_area$base_model == 0 & function_area$fine_tuning == 0 & function_area$efpmpedia == 1) {

      nav_insert(
        id       = "tabs",
        target   = "Overview",
        position = "after",
        select   = TRUE,
        nav      = nav_panel(title = "EFPMpedia", efpmpedia_ui)
      )

    } else if (function_area$base_model >= 1 & function_area$fine_tuning == 0 & function_area$efpmpedia == 1) {

      nav_insert(
        id       = "tabs",
        target   = "Base Model",
        position = "after",
        select   = TRUE,
        nav      = nav_panel(title = "EFPMpedia", efpmpedia_ui)
      )

    } else if (function_area$base_model >= 0 & function_area$fine_tuning >= 1 & function_area$efpmpedia == 1) {

      nav_insert(
        id       = "tabs",  # Match the id from navset_bar
        target   = "Fine-Tuning",
        position = "after",
        select   = TRUE,
        nav      = nav_panel(title = "EFPMpedia", efpmpedia_ui)
      )

    } else {

      nav_select(id = "tabs", selected = "EFPMpedia")
    }
  })
}
