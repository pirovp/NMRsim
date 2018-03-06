library(rhandsontable)

ui <- fluidPage(
      
      titlePanel("NMR multiplet simulator"),
      
      # Sidebar with input
      sidebarLayout(
            sidebarPanel(
                  p("Insert your list of nuclides; I must be half integer
                    (0.5, 1, 1.5, ...) and n integer; right click to add/remove
                    rows."),
                  rHandsontableOutput("hot"),
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