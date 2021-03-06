########################
### train_XGBoost ###
########################


xgbtrain <- function(features, labels, w = NULL, eta_val = 0.05 ,gamma = 0.1, lmd = 0.005, nr = 500, md = 5){
  
  labels<- ifelse(labels == 2, 0, 1)
  param <- list(objective = "binary:logistic", eval_metric = list("error","auc"))
  
  model <- xgboost(data = features, 
                   label = labels, 
                   weight =  w, 
                   params = param, 
                   eta = eta_val,
                   lambda = lmd, 
                   gamma = gamma,
                   nrounds = nr, 
                   verbose = 0, 
                   max_depth = md,
                   
                   alpha = 1,
                   min_child_weight = 5,
                   colsample_bytree = 0.8,
                   subsample = 0.8,
                   nthread = 4
                   ) 
  
  return(model)
}


