#' ---
#' title: "R Download de Séries Temporais do Yahoo Finance via quantmod"
#' author: "Bruno Tebaldi de Queiroz Barbosa"
#' date: "2025-11-23"
#' output: html_document
#' ---


# Install dependencies ----------------------------------------------------
# Install sidrar package if not already installed
if (!require("quantmod")) {
    install.packages("quantmod")
    library(quantmod)
}

# Setup -------------------------------------------------------------------
rm(list = ls())
library(quantmod)
library(ggplot2)

# Dataload ----------------------------------------------------------------

# Explore quantmod package
help(package = "quantmod")

# Get stock data for Petrobras (PETR4.SA). note the .SA suffix for São Paulo stock exchange.
# auto.assign = FALSE prevents automatic assignment to environment.
MyVariable <- getSymbols("PETR4.SA",  auto.assign = FALSE)
head(MyVariable)

# Get stock data for Microsoft (MSFT).
# auto.assign = TRUE assigns data to environment.
getSymbols("MSFT",  auto.assign = TRUE)
head(MSFT)

# Plot the data -----------------------------------------------------------

# Convert to data frame for ggplot
tbl_petr4 <- data.frame(Date = index(MyVariable), coredata(MyVariable))
head(tbl_petr4)

ggplot(tbl_petr4, aes(x = Date, y = PETR4.SA.Close)) +
  geom_line(color = "blue") +
  labs(title = "PETR4.SA Closing Prices",
       x = "Date",
       y = "Closing Price (BRL)") +
  theme_minimal()
