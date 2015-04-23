library(shiny)

shinyUI(fluidPage(
  titlePanel("Top inheritance tax rate in rich countries, 1900-2013"),
  
  sidebarLayout(
    sidebarPanel(
      helpText("Data is taken from the book Capital in the Twenty-First Century by the by French economist Thomas Piketty"),
      
      sliderInput("years", 
                  label = h3("Years of interest:"),
                  min = 1900, max = 2013, value = c(1900, 2013)),
      
      checkboxGroupInput("countries", 
                         label = h3("Countries"), 
                         choices = list("U.S." = 2, 
                                        "U.K." = 3,
                                        "Germany" = 4,
                                        "France" = 5),
                         selected = 2)
   
      
    ),
    
    mainPanel(plotOutput("plot"))
  )
))