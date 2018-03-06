source("scripts/nmrsim1.R")
source("scripts/couplers.R")
source("scripts/plotters.R")
source("scripts/lbroad.R")

server <- function(input, output) {
      nucs <- data.frame(I = c(.5, 1), J = c(7, 20), n = c(2,1))
      ## Handsontable
      #observe({nucs  <- hot_to_r(input$nucs)})
      output$text <- renderText(paste("Line broadening of ", input$lb, "Hz (Gaussian):"))
      spectra <- reactive(simspec(nucs, lb = input$lb))
      output$nucs <- renderRHandsontable(rhandsontable(nucs, stretchH = "all"))
      #output$lineplot <- renderPlot(plotSpec(spectra()[[1]]))
      output$lbplot <- renderPlot(plotSpecLb(spectra()[[2]]))
}