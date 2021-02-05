#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(dplyr)
library(ggplot2)


curvaNormal <- data.frame(x=seq(from=-4, to=4, by=0.001), y=dnorm(seq(from=-4, to=4, by=0.001)))

# Define UI for application that draws a histogram
ui <- fluidPage(
    
    # Application title
    titlePanel("Integral Numerica (Soma de Riemann)"),
    
    # Sidebar with a slider input for number of bins 
    sidebarLayout(
        sidebarPanel(
            sliderInput("bins",
                        "Number of bins:",
                        min = 1,
                        max = 100,
                        value = 2),
            textInput("a",
                      h4("Ponto Inferior (a >=-4)"),
                      value = -1),
            textInput("b",
                      h4("Ponto Superior (b <= 4)"),
                      value = 1),
            h6("se a=b -> a=-4, b=4")
        ),
        
        
        # Show a plot of the generated distribution
        mainPanel(
            plotOutput("distPlot"),
            # textOutput("distPlot"),
            h4(textOutput("selected_var"))
        )
    )
)

# Define server logic required to draw a histogram
server <- function(input, output) {

    output$distPlot <- renderPlot({
        # generate bins based on input$bins from ui.R
        n <- input$bins+1
        
        a <- min(as.numeric(input$a), as.numeric(input$b))
        b <- max(as.numeric(input$a), as.numeric(input$b))
        
        if(is.na(a)) { a <- -1 }
        if(is.na(b)) { b <- 1 }
        
        
        if(a < -4){ a <- -4}
        if(b > 4){ b <- 4}
        
        if(a==b){ b = 4; a = -4 }
        
        # Vamos dividir nosso intervalo
        intervalo <- seq(from=a, to=b, length.out = n)
        
        # Por questoes didaticas vamos organizar os dados em um data.frame
        data <- data.frame(inf = intervalo[-length(intervalo)],
                           sup = intervalo[-1],
                           med = as.numeric(NA),
                           f = as.numeric(NA)
        )

        # Calculamos o ponto medio
        data$med = (data$inf + data$sup)/2

        # Calculamos o valor da funcao no ponto medio
        data$f = dnorm(data$med)

      
        ggplot(curvaNormal) +
            geom_line(aes(x=x, y=y)) +
            geom_rect(aes(xmin=inf, xmax=sup, ymin=0, ymax=f), colour="black", fill="blue", alpha =0.3, data=data)
        
    })
    
    output$selected_var <- renderText({ 
        # generate bins based on input$bins from ui.R
        n <- input$bins+1
        
        a <- min(as.numeric(input$a), as.numeric(input$b))
        b <- max(as.numeric(input$a), as.numeric(input$b))
        
        if(is.na(a)) { a <- -1 }
        if(is.na(b)) { b <- 1 }

        if(a < -4){ a <- -4}
        if(b > 4){ b <- 4}
        
        if(a==b){ b = 4; a = -4 }
        
        # Vamos dividir nosso intervalo
        intervalo <- seq(from=a, to=b, length.out = n)
        
        # Por questoes didaticas vamos organizar os dados em um data.frame
        data <- data.frame(inf = intervalo[-length(intervalo)],
                           sup = intervalo[-1],
                           med = as.numeric(NA),
                           f = as.numeric(NA)
        )
        
        # Calculamos o ponto medio
        data$med = (data$inf + data$sup)/2
        
        # Calculamos o valor da funcao no ponto medio
        data$f = dnorm(data$med)
        
        # Calculamos a soma de Reimann
        Integral = sum(data$f * (data$sup - data$inf))
        print(sprintf("Soma de Riemann: %8.6f", Integral))
        
        
    })
}

# Run the application 
shinyApp(ui = ui, server = server)
