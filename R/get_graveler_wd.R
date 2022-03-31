get_graveler_wd <- function ()
{
  if (is.null(getOption("golem.wd"))) {
    cat_red_bullet("Couldn't find golem working directory")
    cat_green_tick("Definining golem working directory as `.`")
    cat_line("You can change golem working directory with set_golem_wd('path/to/wd')")
    set_graveler_wd(".")
  }
  getOption("golem.wd")
}
