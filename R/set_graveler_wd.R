set_graveler_wd <- function (path, talkative = TRUE)
{
  path <- normalizePath(path)
  if (talkative) {
    cat_green_tick(sprintf("Definining golem working directory as `%s`",
                           path))
  }
  options(golem.wd = path)
  invisible(path)
}
