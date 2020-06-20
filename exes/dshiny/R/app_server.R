#' The application server-side
#' 
#' @param input,output,session Internal parameters for {shiny}. 
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_server <- function( input, output, session ) {
  # List the first level callModules here
  
  # Combine the selected variables into a new data frame
  selectedData <- reactive({
    datasets::iris[, c(input$xcol, input$ycol)]
  })
  
  clusters <- reactive({
    stats::kmeans(selectedData(), input$clusters)
  })
  
  output$plot1 <- renderPlot({
    grDevices::palette(c("#E41A1C", "#377EB8", "#4DAF4A", "#984EA3",
                         "#FF7F00", "#FFFF33", "#A65628", "#F781BF", "#999999"))
    
    graphics::par(mar = c(5.1, 4.1, 0, 1))
    plot(selectedData(),
         col = clusters()$cluster,
         pch = 20, cex = 3)
    graphics::points(clusters()$centers, pch = 4, cex = 4, lwd = 4)
  })
}
