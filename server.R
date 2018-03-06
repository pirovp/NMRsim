source("scripts/nmrsim1.R")
source("scripts/couplers.R")
source("scripts/plotters.R")
source("scripts/lbroad.R")

server <- function(input, output) {
      nucs <- data.frame(I = c(.5, .5), J = c(14, 6), n = c(2L,1L))
      nucs[nrow(nucs) + 3,] <- NA
      spectra <- reactive({
            nucs <- hot_to_r(input$hot)
            nucs <- nucs[which(complete.cases(nucs)),]
            simspec(nucs, lb = input$lb)
            })
      
      ## Handsontable
      nuchot <-
            rhandsontable(nucs, readOnly = FALSE, height = 200, stretchH = "all") %>% 
            hot_col("I", type = "dropdown", source = seq(0.5, 5, 0.5))
            
            
      output$hot <- renderRHandsontable(nuchot)
      
      output$lbplot <- renderPlot(plotSpecLb(spectra()[[2]]))

      output$text <- renderText(paste("Line broadening of ", input$lb, "Hz (Gaussian):"))
}