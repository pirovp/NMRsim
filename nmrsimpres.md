---
title: "NMR multiplet simulator"
author: "Paolo Pirovano"
date: "6 March 2018"
output: slidy_presentation
---



## What is this app about?


- A Shiny app to simulate the fine structure in NMR spectra
- This has got nothing to do with statistics or data science
- I had it half-done already from a personal project

### So, um, what's an NMR?


- No need to worry, just take it as a squiggly line generator
- https://en.wikipedia.org/wiki/Nuclear_magnetic_resonance_spectroscopy
- https://en.wikipedia.org/wiki/J-coupling

Why would I want it?

- Chemistry/physics homework maybe?

## How do I use it?


Input your list of nuclides in the table

- I = nuclear magnetic moment (0.5, 1, 1.5, ...)
- J = Coupling constant (whatever you want)
- n = number of equivalent nuclides (positive integer)


```r
simspec <- function(nuclides, lb = 1) {
      spectrum <- data.frame(x = 0, y = 1)
      for (i in 1:nrow(nuclides)) {
            spectrum <-
                  couplen(spectrum,
                          I = nuclides$I[i],
                          J = nuclides$J[i],
                          n = nuclides$n[i])
      }
      lbspc <- lbroad(spectrum, lb = lb)
      list(spectrum, lbspc)
}
```

## Example simulation


```r
nuclides <-  data.frame(I = c(.5, 1), J = c(7, 20), n = c(3,1))
spectrum <- simspec(nuclides)
plotSpec(spectrum[[1]])
```

![plot of chunk unnamed-chunk-2](assets/fig/unnamed-chunk-2-1.png)

## Line broadening

We get finite linewidth with a gaussian convolution (?) of the spectral lines.
You can select the broadening with the slider.

![plot of chunk unnamed-chunk-3](assets/fig/unnamed-chunk-3-1.png)![plot of chunk unnamed-chunk-3](assets/fig/unnamed-chunk-3-2.png)
