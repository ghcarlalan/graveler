#' Plot Anscombe
#'
#' Generate anscombe plot
#'
#' @param dataset can be piped into
#' @param dataset_num numeric. which dataset from the quartet to plot
#'
#' @export
anscombe_plot <- function(dataset, dataset_num = 1) {
  p <- dataset %>%
    ggplot(
      aes(
        x = eval(sym(paste0("x", {{ dataset_num }}))),
        y = eval(sym(paste0("y", {{ dataset_num }})))
      )
    ) +
    geom_smooth(method = "lm", color = "black", se = FALSE) +
    geom_point(color = "orange", size = 3) +
    theme_classic() +
    labs(
      x = paste0("X", {{ dataset_num }}),
      y = paste0("Y", {{ dataset_num }}),
      title = paste("Quartet", {{ dataset_num }})
    ) +
    scale_x_continuous(breaks = seq(4, 20, 2)) +
    scale_y_continuous(breaks = seq(4, 14, 2)) +
    coord_cartesian(xlim = c(4, 20), ylim = c(4, 14))

  plotly::ggplotly(p)
}
