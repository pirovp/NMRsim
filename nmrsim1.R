library(dplyr)
library(ggplot2)

# line broadening, data from table, 

lbroad <- function (spectrum, lb = .2) {
      lb_spec <- data.frame(x = NULL, y = NULL)
      
      for (i in 1:nrow(spectrum)) {
            lbx <- spectrum$x[i] + seq(from = -4*lb, to = 4*lb, length.out = 10000)
            lby <- spectrum$y[i] * dnorm(lbx, mean = spectrum$x[i], sd = lb)
            lb_peak <- data.frame(x = lbx, y = lby)
            #lb_peak <- sumSpecLb(lb_peak, npoints = 100)
            lb_spec <- rbind(lb_spec, lb_peak)
      }
      
      lb_spec
      #sumSpecLb(lb_spec, npoints = nrow(lb_spec/500))
}

sumSpecLb <- function (spectrum, npoints = 1000) {
      cuts <- seq(from = min(spectrum$x), to = max(spectrum$x), length.out = npoints)
      spectrum %>%
            mutate(xpool = cut2(x, cuts = cuts, levels.mean = TRUE)) %>% 
            group_by(xpool) %>%
            summarise(y = sum(y)) %>%
            mutate(x = as.numeric(as.character(xpool))) %>%
            select(x, y)
}

couplen <- function (spectrum = data.frame(x = 0, y = 1), n = 1, I = .5, J = 1) {
      for (i in 1:n) {
            spectrum <- couple(spectrum, I, J)
            i = i + 1
      }
      sumSpec(spectrum)
}

couple <- function (start = data.frame(x = 0, y = 1), I = .5, J = 1) {
      nx <- NULL
      multiplicity = 2*I+1
      for (x in start$x) {
      splitpattern <- seq(from = -I, to = I, length.out = multiplicity)
      nx <- append(nx, x+splitpattern*J)
      }
      ny <- start$y / multiplicity
      data.frame(x = nx, y = ny)
}

sumSpec <- function(spectrum) {
       spectrum %>% group_by(x) %>% summarise(y = sum(y))
}

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