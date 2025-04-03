#' Logic for selecting functional areas when value boxes are clicked: after the first click, a nested UI will be
#' inserted. All nested UIs are initially hidden, and if a UI is present and the user clicks again, they will be
#' directed to the clicked UI.
#' @importFrom shiny observeEvent
#' @importFrom gargoyle watch
#' @importFrom bslib nav_insert nav_panel nav_select
#'
#' @noRd

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
