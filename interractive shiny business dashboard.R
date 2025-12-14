library(shiny)
library(ggplot2)
library(DT)
library(zoo)  # optional if you want to add moving averages

# Load EuStockMarkets dataset
data("EuStockMarkets")
stocks_ts <- as.data.frame(EuStockMarkets)
stocks_ts$Time <- 1:nrow(stocks_ts)  # Add a time variable

# UI
ui <- fluidPage(
  titlePanel("EuStockMarkets Dashboard"),
  
  sidebarLayout(
    sidebarPanel(
      selectInput("stock", "Select Stock Index:", 
                  choices = names(stocks_ts)[1:4], selected = "DAX"),
      sliderInput("obs", "Number of Observations to View:", 
                  min = 10, max = nrow(stocks_ts), value = 50),
      radioButtons("color", "Choose Point Color:",
                   choices = c("Blue" = "blue", "Red" = "red", "Green" = "green"),
                   selected = "blue"),
      checkboxInput("show_lm", "Show Linear Trend Line", value = TRUE)
    ),
    
    mainPanel(
      tabsetPanel(
        tabPanel("Plot", plotOutput("varPlot")),
        tabPanel("Table", DTOutput("dataTable")),
        tabPanel("Summary", verbatimTextOutput("summary"))
      )
    )
  )
)

# Server
server <- function(input, output) {
  
  # Reactive plot
  output$varPlot <- renderPlot({
    gg <- ggplot(stocks_ts[1:input$obs, ], aes_string(x = "Time", y = input$stock)) +
      geom_point(color = input$color, size = 3) +
      labs(x = "Time", y = input$stock, title = paste("Time Series of", input$stock)) +
      theme_minimal()
    
    if (input$show_lm) {
      gg <- gg + geom_smooth(method = "lm", se = FALSE, color = "black")
    }
    
    gg
  })
  
  # Reactive table
  output$dataTable <- renderDT({
    datatable(stocks_ts[1:input$obs, c("Time", input$stock)], 
              options = list(pageLength = input$obs))
  })
  
  # Summary
  output$summary <- renderPrint({
    summary(stocks_ts[, input$stock])
  })
  
}

# Run the app
shinyApp(ui = ui, server = server)
