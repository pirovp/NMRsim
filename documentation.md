---
title: "Documentation"
author: "Paolo Pirovano"
date: "7 March 2018"
output: html_document
---

## NMR fine structure simulator

This app simulates the fine structure of an NMR spectrum; alternatively, it can be considered a squiggly line generator.

It takes a table of nuclides as input, and outputs a figure corresponding to the simulated spectrum of an hypotetical single nuclide interacting with the system, according to the rules of J coupling (https://en.wikipedia.org/wiki/J-coupling).

Each row in the input table defines a set of equivalent nuclides, with the following constraints:

- I = nuclear magnetic moment (0.5, 1, 1.5, ...)

- J = Coupling constant (whatever you want)

- n = number of equivalent nuclides (positive integer)

The programme then applies Gaussian line broadening, with intensity defined through the input slider.
The resulting spectrum is updated in real time.