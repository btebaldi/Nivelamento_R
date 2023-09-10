#' ---
#' title: "Time Series - Exemplos"
#' author: "Bruno Tebaldi de Queiroz Barbosa"
#' date: "2023-02-04"
#' output: html_document
#' ---


# Setup -------------------------------------------------------------------
library(tidyverse)
library(readxl)


# Data Load ---------------------------------------------------------------
AirPassengers <- read_excel("scripts/Aula 5 - Time Series/database/AirPassengers.xlsx")
economics <- read_excel("scripts/Aula 5 - Time Series/database/economics.xlsx")
Nile <- read_excel("scripts/Aula 5 - Time Series/database/Nile.xlsx")


# Estatisticas descritivas ------------------------------------------------

summary(AirPassengers)
summary(economics)
summary(Nile)

# Exibir os primeiros 10 elementos do conjunto de dados Nile
head(Nile, 10)

# Exibir os últimos 12 elementos do conjunto de dados Nile
tail(Nile, 12)

# Plotagem dos graficos ---------------------------------------------------


AirPassengers %>% 
  mutate(dt = Year*100 + Month) %>% 
  ggplot() + 
  geom_line(mapping = aes(x = dt, y = x))

AirPassengers %>% 
  mutate(dt = lubridate::ymd(Year*100 + Month, truncated = 1)) %>% 
  ggplot() + 
  geom_line(mapping = aes(x = dt, y = x))

economics %>% 
  ggplot() + 
  geom_line(mapping = aes(x = date, y = psavert), colour = "red") + 
  geom_line(mapping = aes(x = date, y = uempmed), colour = "red")

Nile %>% 
  ggplot() + 
  geom_line(mapping = aes(x = year, y = nile))

# -------------------------------------------------------------------------

# What does the time index tell us?

# Some data are naturally evenly spaced by time. The time series discrete_data
# shown in the top figure has 20 observations, with one observation appearing at
# each of the discrete time indices 1 through 20. Discrete time indexing is
# appropriate for discrete_data.
#
# The time series continuous_series shown in the bottom figure also has 20
# observations, it is following the same periodic pattern as discrete_data, but
# its observations are not evenly spaced. Its first, second, and last
# observations were observed at times 1.210322, 1.746137, and 20.180524,
# respectively. Continuous time indexing is natural for continuous_series,
# however, the observations are approximately evenly spaced, with about 1
# observation observed per time unit. Let's investigate using a discrete time
# indexing for continuous_series.

Instructions
100 XP
Use plot(___, ___, type = "b") to display continuous_series versus continuous_time_index, its continuous time index
Create a vector 1:20 to be used as a discrete time index.
Now use plot(___, ___, type = "b") to display continuous_series versus discrete_time_index
Note the various differences between the resulting figures, but the approximation appears reasonable because the overall trend remained preserved


# Plot the continuous_series using continuous time indexing
par(mfrow=c(2,1))
plot(continuous_time_index, continuous_series, type = "b")

# Make a discrete time index using 1:20 
discrete_time_index <- 1:20

# Now plot the continuous_series using discrete time indexing
plot(discrete_time_index,continuous_series, type = "b")




# -------------------------------------------------------------------------

# Identifying the sampling frequency

# In addition to viewing your data and plotting over time, there are several
# additional operations that can be performed on time series datasets.
#
# The start() and end() functions return the time index of the first and last
# observations, respectively. The time() function calculates a vector of time
# indices, with one element for each time index on which the series was
# observed.
#
# The deltat() function returns the fixed time interval between observations and
# the frequency() function returns the number of observations per unit time.
# Finally, the cycle() function returns the position in the cycle of each
# observation.

# In this exercise, you'll practice applying these functions to the
# AirPassengers dataset, which reports the monthly total international airline
# passengers (in thousands) from 1949 to 1960.


Begin by plotting the AirPassengers data using a simple call to plot().
Next, list the first and last time observations in AirPassengers using start() and end(), respectively.
Finally, gain some additional insight into this dataset by using the time(), deltat(), frequency(), and cycle() commands AirPassengers.



# Plot AirPassengers
plot(AirPassengers)

# View the start and end dates of AirPassengers
start(AirPassengers)
end(AirPassengers)


# Use time(), deltat(), frequency(), and cycle() with AirPassengers 
time(AirPassengers)
deltat(AirPassengers)
frequency(AirPassengers)
cycle(AirPassengers)

# -------------------------------------------------------------------------


Missing values
Sometimes there are missing values in time series data, denoted NA in R, and it is useful to know their locations. It is also important to know how missing values are handled by various R functions. Sometimes we may want to ignore any missingness, but other times we may wish to impute or estimate the missing values.

Let's again consider the monthly AirPassengers dataset, but now the data for the year 1956 are missing. In this exercise, you'll explore the implications of this missing data and impute some new data to solve the problem.

The mean() function calculates the sample mean, but it fails in the presence of any NA values. Use mean(___, na.rm = TRUE) to calculate the mean with all missing values removed. It is common to replace missing values with the mean of the observed values. Does this simple data imputation scheme appear adequate when applied the the AirPassengers dataset?
  
  Instructions
100 XP
Use plot() to display a simple plot of AirPassengers. Note the missing data for 1956.
Use mean() to calculate the sample mean of AirPassengers with the missing data removed (na.rm = TRUE).
Run the pre-written code to impute the mean values into your missing data.
Use another call to plot() to replot your newly imputed AirPassengers data.
Run the pre-written code to add the complete AirPassengers data to your plot.



# Plot the AirPassengers data
plot(AirPassengers)

# Compute the mean of AirPassengers
mean(AirPassengers, na.rm = TRUE)

# Impute mean values to NA in AirPassengers
AirPassengers[85:96] <- mean(AirPassengers, na.rm = TRUE)

# Generate another plot of AirPassengers
plot(AirPassengers)

# Add the complete AirPassengers data to your plot
rm(AirPassengers)
points(AirPassengers, type = "l", col = 2, lty = 3)


# -------------------------------------------------------------------------

Creating a time series object with ts()
The function ts() can be applied to create time series objects. A time series object is a vector (univariate) or matrix (multivariate) with additional attributes, including time indices for each observation, the sampling frequency and time increment between observations, and the cycle length for periodic data. Such objects are of the ts class, and represent data that has been observed at (approximately) equally spaced time points. Now you will create time series objects yourself.

The advantage of creating and working with time series objects of the ts class is that many methods are available for utilizing time series attributes, such as time index information. For example, as you've seen in earlier exercises, calling plot() on a ts object will automatically generate a plot over time.

In this exercise, you'll familiarize yourself with the ts class by encoding some time series data (saved as data_vector) into ts and exploring the result. Your time series data_vector starts in the year 2004 and has 4 observations per year (i.e. it is quarterly data).

Instructions
100 XP
Apply print() and plot() to data_vector. Note that, by default, your plot does not contain time information.
Use ts() with data_vector to convert your data to a ts object. Set the start argument equal to 2004 and the frequency argument equal to 4. Assign the result to time_series.
Use print() and plot() to view your time_series object.


# Use print() and plot() to view data_vector
print(data_vector)
plot(data_vector)

# Convert data_vector to a ts object with start = 2004 and frequency = 4
time_series <- ts(data_vector, start= 2004, frequency = 4)

# Use print() and plot() to view time_series
print(time_series)
plot(time_series)


# -------------------------------------------------------------------------

Testing whether an object is a time series
When you work to create your own datasets, you can build them as ts objects. Recall the dataset data_vector from the previous exercise, which was just a vector of numbers, and time_series, the ts object you created from data_vector using the ts() function and information regarding the start time and the observation frequency. As a reminder, data_vector and time_series are shown in the plot on the right.

When you use datasets from others, such as those included in an R package, you can check whether they are ts objects using the is.ts() command. The result of the test is either TRUE when the data is of the ts class, or FALSE if it is not.

In this exercise, you'll explore the class of the datasets you've been using throughout this chapter.

Instructions
100 XP
Use is.ts() on the data_vector and time_series objects from the previous exercise.
Use another call to is.ts() to check the class of the Nile dataset used in earlier exercises.
Continue the trend by using is.ts() on the AirPassengers dataset.

Take Hint (-30 XP)


# Check whether data_vector and time_series are ts objects
is.ts(data_vector)
is.ts(time_series)


# Check whether Nile is a ts object
is.ts(Nile)

# Check whether AirPassengers is a ts object
is.ts(AirPassengers)

# -------------------------------------------------------------------------

Plotting a time series object
It is often very useful to plot data we are analyzing, as is the case when conducting time series analysis. If the dataset under study is of the ts class, then the plot() function has methods that automatically incorporate time index information into a figure.

Let's consider the eu_stocks dataset (available in R by default as EuStockMarkets). This dataset contains daily closing prices of major European stock indices from 1991-1998, specifically, from Germany (DAX), Switzerland (SMI), France (CAC), and the UK (FTSE). The data were observed when the markets were open, so there are no observations on weekends and holidays. We will proceed with the approximation that this dataset has evenly spaced observations and is a four dimensional time series.

To conclude this chapter, this exercise asks you to apply several of the functions you've already learned to this new dataset.

Instructions
100 XP
Use is.ts() to check whether eu_stocks is a ts object.
View the start, end, and frequency of eu_stocks using the start(), end(), and frequency() functions, respectively.
Generate a simple plot of your eu_stocks data using the plot() command.
Generate a more complex time series plot of your eu_stocks data using the ts.plot() command. Input the eu_stocks dataset into the pre-written code, but leave the other arguments as they are.
Use the pre-written code to add a legend to your time series plot.


# Check whether eu_stocks is a ts object
is.ts(eu_stocks)

# View the start, end, and frequency of eu_stocks
start(eu_stocks)
end(eu_stocks)
frequency(eu_stocks)


# Generate a simple plot of eu_stocks
plot(eu_stocks)

# Use ts.plot with eu_stocks
ts.plot(eu_stocks, col = 1:4, xlab = "Year", ylab = "Index Value", main = "Major European Stock Indices, 1991-1998")

# Add a legend to your ts.plot
legend("topleft", colnames(eu_stocks), lty = 1, col = 1:4, bty = "n")
