plotSpec <- function(spectrum) {
      ggplot(spectrum, aes(x,y)) +
            geom_point() +
            scale_y_continuous(limits = c(0, NA)) +
            geom_segment(aes(x=x, y=0, xend=x, yend = y))
}

plotSpecLb <- function(spectrum) {
      ggplot(spectrum, aes(x,y)) +
            geom_point(size = 0.1) +
            geom_line() +
            scale_y_continuous(limits = c(0, NA))
}