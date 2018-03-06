library(rhandsontable)

ui <- fluidPage(
      
      titlePanel("NMR multiplet simulator"),
      
      # Sidebar with input
      sidebarLayout(
            sidebarPanel(
                  rHandsontableOutput("nucs"),
                  br(),
                  br(),
                  sliderInput("lb",
                             "Line broadening (Hz):",
                              min = 0.1,
                              max = 10,
                              value = 1)
            ),
            
            mainPanel(
                  p(textOutput("text")),
                  plotOutput("lbplot")#,
                  #p("Infinitely sharp peaks:"),
                  #plotOutput("lineplot"),
                  #br()
            )
      )
)