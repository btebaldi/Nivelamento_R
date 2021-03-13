
# Setup -------------------------------------------------------------------
rm(list = ls())

# Building data frame
library(readxl)

# Transform train and test data to DMatrix form
library(dplyr)
library(xgboost)

# Cross-validation
library(caret)


# Data load ---------------------------------------------------------------

df_xautry <- read_excel("./databases/xautry_reg.xlsx")
df_xautry$date <- as.Date(df_xautry$date)


#Splitting train and test data set
train <- df_xautry[df_xautry$date < "2021-01-01",]
test <- df_xautry[-(1:nrow(train)),]

# Define the DMatrix used in XGBoost
train_Dmatrix <- train %>% 
  dplyr::select(xe, xau_usd_ounce) %>% 
  as.matrix() %>% 
  xgboost::xgb.DMatrix()


pred_Dmatrix <- test %>% 
  dplyr::select(xe, xau_usd_ounce) %>% 
  as.matrix() %>% 
  xgboost::xgb.DMatrix()

# Define the targets of the regression
targets <- train$xau_try_gram


# Cross-validation --------------------------------------------------------


xgb_trcontrol <- caret::trainControl(
  method = "cv", 
  number = 10,
  allowParallel = TRUE, 
  verboseIter = FALSE, 
  returnData = FALSE
)

# Building parameters grid set
xgb_grid <- base::expand.grid(
  list(
    nrounds = seq(100,200),
    max_depth = c(15,20,6), 
    colsample_bytree = 1, 
    eta = c(0.5, 0.75, 1),
    gamma = 0,
    min_child_weight = 1,  
    subsample = 1)
)

# Building the model
model_xgb <- caret::train(
  train_Dmatrix,
  targets,
  trControl = xgb_trcontrol,
  tuneGrid = xgb_grid,
  method = "xgbTree",
  nthread = 10,
  objective = "reg:squarederror"
)

model_xgb$bestTune
#  nrounds max_depth eta gamma colsample_bytree min_child_weight #subsample
#1     100         6 0.5     0                1                1         1


# fit model
# bst <- xgboost(data = train_Dmatrix,
#                label = train$label,
#                max.depth = 2,
#                eta = 1,
#                nrounds = 2,
#                nthread = 2,
#                objective = "binary:logistic")


# Making the variables used in forecast object 
fitted <- model_xgb %>%
  stats::predict(train_Dmatrix) %>%
  stats::ts(start = c(2013,1),frequency = 12)

ts_xautrygram <- ts(targets,start=c(2013,1),frequency=12)
forecast_xgb <- model_xgb %>% stats::predict(pred_Dmatrix)
forecast_ts <- ts(forecast_xgb,start=c(2021,1),frequency=12)

# Preparing forecast object
forecast_xautrygram <- list(
  model = model_xgb$modelInfo,
  method = model_xgb$method,
  mean = forecast_ts,
  x = ts_xautrygram, 
  fitted = fitted,
  residuals = as.numeric(ts_xautrygram) - as.numeric(fitted)
)
class(forecast_xautrygram) <- "forecast"



# The function to convert decimal time label to wanted format
library(lubridate)
date_transform <- function(x) {format(date_decimal(x), "%Y")}

# Making a time series varibale for observed data
observed_values <- ts(test$xau_try_gram,start=c(2021,1),frequency=12)

# Plot forecasting
library(ggplot2)
library(forecast)

autoplot(forecast_xautrygram)+
  autolayer(forecast_xautrygram$mean,series="Predicted",size=0.75) +
  autolayer(forecast_xautrygram$x,series ="Train",size=0.75 ) +
  autolayer(observed_values,series = "Observed",size=0.75) +
  scale_x_continuous(labels =date_transform,breaks = seq(2013,2021,2) ) +
  guides(colour=guide_legend(title = "Time Series")) +
  ylab("Price") + xlab("Time") +
  ggtitle("") +
  theme_bw()

#Feature importance
library(Ckmeans.1d.dp)

xgb_imp <- xgb.importance(
  feature_names = colnames(train_Dmatrix),
  model = model_xgb$finalModel)

xgb.ggplot.importance(xgb_imp,n_clusters = c(2))+ 
  ggtitle("") +
  theme_bw()+
  theme(legend.position="none")

xgb_imp$Importance
#[1] 0.92995147 0.07004853 

