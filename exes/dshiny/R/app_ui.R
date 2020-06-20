vars <- setdiff(names(datasets::iris), "Species")

#' The application User-Interface
#' 
#' @param request Internal parameter for `{shiny}`. 
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_ui <- function(request) {
  tagList(
    # Leave this function for adding external resources
    golem_add_external_resources(),
    
    # List the first level UI elements here
    pageWithSidebar(
      headerPanel('Iris k-means clustering'),
      sidebarPanel(
        selectInput('xcol', 'X Variable', vars),
        selectInput('ycol', 'Y Variable', vars, selected = vars[[2]]),
        numericInput('clusters', 'Cluster count', 3, min = 1, max = 9)
      ),
      mainPanel(
        plotOutput('plot1')
      )
    )
  )
}

#' Add external Resources to the Application
#' 
#' This function is internally used to add external 
#' resources inside the Shiny application. 
#' 
#' @import shiny
#' @importFrom golem add_resource_path activate_js favicon bundle_resources
#' @noRd
golem_add_external_resources <- function(){
  
  add_resource_path(
    'www', app_sys('app/www')
  )
 
  tags$head(
    favicon(),
    bundle_resources(
      path = app_sys('app/www'),
      app_title = 'dshiny'
    )
    # Add here other external resources
    # for example, you can add shinyalert::useShinyalert() 
  )
}

