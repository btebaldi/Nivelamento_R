
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
  xgboost::xgb.DMatrix(label = train$xau_try_gram)


pred_Dmatrix <- test %>% 
  dplyr::select(xe, xau_usd_ounce) %>% 
  as.matrix() %>% 
  xgboost::xgb.DMatrix()

# Define the targets of the regression
targets <- train$xau_try_gram


# Cross-validation --------------------------------------------------------

nrounds <- 2
param <- list(
  # nrounds = seq(100,200),
  max_depth = c(6,15,20), 
  colsample_bytree = 1, 
  eta = c(0.5, 0.75, 1),
  gamma = 0,
  min_child_weight = 1,  
  subsample = 1,
  nthread = 2,
  objective = "reg:squarederror")
#  nrounds max_depth eta gamma colsample_bytree min_child_weight #subsample
#1     100         6 0.5     0                1                1         1

cat('running cross validation\n')
# do cross validation, this will print result out as
# [iteration]  metric_name:mean_value+std_value
# std_value is standard deviation of the metric
res <- xgb.cv(params = param,
       data = train_Dmatrix,
       # label = xgboost::xgb.DMatrix(targets),
       # label = targets,
       nrounds = 2000,
       nfold = 10,
       metrics = {'error'},
       verbose = T)



