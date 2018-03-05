lbroad <- function (spectrum, lb = .2) {
      
      npoints = 2048
      specmin <- 1.5*spectrum$x[1] - 0.5*spectrum$x[nrow(spectrum)]
      specmax <- 1.5*spectrum$x[nrow(spectrum)] - 0.5*spectrum$x[1]
      specrange <- seq(from = specmin, to = specmax, length.out = npoints)
      lb_spec <- data.frame(x = specrange, y = rep(0, npoints))
      
      for (i in 1:nrow(spectrum)) {
            lby <- spectrum$y[i] * dnorm(lb_spec$x, mean = spectrum$x[i], sd = lb)
            lb_spec$y <- lb_spec$y + lby
      }
      
      lb_spec
}