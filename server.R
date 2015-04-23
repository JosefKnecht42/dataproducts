# server.R
library(ggplot2)
library(reshape2)

##options(browser ="C:/Program Files/Google/Chrome/Application/chrome.exe")

taxes <- readRDS("data/data.rds")


shinyServer(function(input, output) {
  
  output$plot <- renderPlot({
    ##countries <- c("2","3")
    col = c(1,as.integer(input$countries))
    mtaxes <- melt(taxes[col],id="Date")
    mtaxes$value <- as.double(mtaxes$value)
    i1 <- mtaxes$Date  > as.Date(paste0(input$years[1],"-1-1"))
    i2 <- mtaxes$Date  < as.Date(paste0(input$years[2],"-1-1"))
    ##i1 <- mtaxes$Date  > as.Date(paste0("1950","-1-1"))
    ##i2 <- mtaxes$Date  < as.Date(paste0("1980","-1-1"))
    
      mtaxes <- mtaxes[(i1*i2)==T,]
    ggplot(data=mtaxes, 
          aes(x=Date, y=value, colour=variable)) +
          geom_line(size = 2) + 
          ylim(0,100) + 
          xlab("Year") + 
          ylab("Inheritance Tax [%]") + 
          guides(color=guide_legend(title="Countries"))
        
    
    ##qplot(taxes$Date[(i1*i2)==T],taxes$Germany[(i1*i2)==T])
    
  })
 
})

