#' Graveler Module
#'
#' Creates module of the specified name
#'
#' @export

level_up <- function(name, pkg = get_graveler_wd(), open = TRUE, dir_create = TRUE){
  library(golem)
  library(cli)

  old <- setwd(normalizePath(pkg))
  on.exit(setwd(old))

  dir_created <- create_dir_if_needed("R", dir_create)

  if (!dir_created) {
    cat_red_bullet("File not added (needs a valid directory)")
    return(invisible(FALSE))
  }

  where <- file.path("R", paste0("mod_", name, ".R"))

  if (!check_file_exist(where)) {
    return(invisible(FALSE))
  }

  file.create(where)

  write_there <- function(...) {
    write(..., file = where, append = TRUE)
  }

  glue <- function(...) {
    glue::glue(..., .open = "%", .close = "%")
  }

  write_there("# Module UI")
  write_there(" ")
  write_there(glue("#' @title mod_%name%_ui and mod_%name%_server"))
  write_there("#' @description A shiny module.")
  write_there(" ")
  write_there(glue("mod_%name%_ui <- function(id) {"))
  write_there("\tns <- NS(id)")
  write_there("\ttabItem(")
  write_there(glue("\t\ttabName = \"%name%\","))
  write_there("\t\tfluidRow(")
  write_there("\t\t\t")
  write_there("\t\t)")
  write_there("\t)")
  write_there("}")
  write_there(" ")
  write_there("# Module Server")
  write_there(" ")
  write_there(glue("mod_%name%_server <- function(input, output, session) {"))
  write_there("\tns <- session$ns")
  write_there("}")
  write_there(" ")
  write_there("## copy to body.R")
  write_there(glue("# mod_%name%_ui(\"%name%_ui_1\")"))
  write_there(" ")
  write_there("## copy to app_server.R")
  write_there(glue("# callModule(mod_%name%_server, \"%name%_ui_1\")"))
  write_there(" ")
  write_there("## copy to sidebar.R")
  write_there(glue("# menuItem(\"displayName\",tabName = \"%name%\",icon = icon(\"user\"))"))
  write_there(" ")

  golem::add_fct("display", module = name)

  cat_green_tick(glue("Files created at %where%"))

  if (rstudioapi::isAvailable() & open) {
    rstudioapi::navigateToFile(where)
  } else {
    cat_bullet(glue("Go to %where%"), bullet = "square_small_filled", bullet_col = "red")
  }
}
