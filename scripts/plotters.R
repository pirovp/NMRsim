plotSpec <- function(spectrum) {
      ggplot(spectrum, aes(x, y)) +
            scale_y_continuous(
                  limits = c(0, NA),
                  labels = NULL,
                  breaks = NULL,
                  name = NULL
            ) +
            scale_x_continuous(limits = c(
                  1.3 * spectrum$x[1] - 0.3 * spectrum$x[nrow(spectrum)],
                  1.3 * spectrum$x[nrow(spectrum)] - 0.3 * spectrum$x[1]
            )) +
      xlab("delta freq. (Hz)") +
            geom_segment(aes(
                  x = x,
                  y = 0,
                  xend = x,
                  yend = y
            ), size = 2) +
            theme_classic()
}

plotSpecLb <- function(spectrum) {
      ggplot(spectrum, aes(x, y)) +
            geom_line() +
            scale_y_continuous(
                  limits = c(0, NA),
                  labels = NULL,
                  breaks = NULL,
                  name = NULL
            ) +
            xlab("delta freq. (Hz)") +
            theme_classic()
}
