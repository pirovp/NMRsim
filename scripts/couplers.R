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

couplen <- function (spectrum = data.frame(x = 0, y = 1), n = 1, I = .5, J = 1) {
      if (n == 0) return(spectrum)
      for (i in 1:n) {
            spectrum <- couple(spectrum, I, J)
            i = i + 1
      }
      sumSpec(spectrum)
}

sumSpec <- function(spectrum) {
      spectrum %>% group_by(x) %>% summarise(y = sum(y))
}