#test on eta
eta_val_test <- c(0.02,0.023,0.027,0.03,0.033,0.037,0.04,0.043,0.047,0.05,0.053)

res_cv_temp <- matrix(0, nrow = 11, ncol = 4)
for(i in 1:length(eta_val_test)){
  cat("eta_val = ", eta_val_test[i], "\n")
  res_cv_temp[i,] <- xgbcv.function(features = feature_train, labels = label_train, K,
                                    eta_val =eta_val_test[i],nr = 50,
                                    reweight = sample.reweight)}
#etc best 0.043


#test on gamma
gamma <- c(0,0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8)
res_cv_temp2 <- matrix(0, nrow = 9, ncol = 4)
for(i in 1:length(gamma)){
  cat("gamma = ", gamma[i], "\n")
  res_cv_temp2[i,] <- xgbcv.function(features = feature_train, labels = label_train, K,
                                    eta_val =0.043,
                                    gamma = gamma[i],
                                    nr = 50,
                                    reweight = sample.reweight)}
#gamma best 0.4


#test on maxdepth
md <- c(0,1,2,3,4,5,6)
res_cv_temp3 <- matrix(0, nrow = 7, ncol = 4)
for(i in 1:length(md)){
  cat("md = ", md[i], "\n")
  res_cv_temp3[i,] <- xgbcv.function(features = feature_train, labels = label_train, K,
                                     eta_val =0.43,
                                     gamma = 0.04,
                                     nr = 50,
                                     md = md[i], reweight = sample.reweight)}
#md best 1 but i will choose 5 for higher AUC


#test on nr
nr <- c(20,50,100,150,200,500)
res_cv_temp4 <- matrix(0, nrow = 6, ncol = 4)
for(i in 1:length(nr)){
  cat("nr = ", nr[i], "\n")
  res_cv_temp4[i,] <- xgbcv.function(features = feature_train, labels = label_train, K,
                                     eta_val =0.43,
                                     gamma = 0.04,
                                     md = 5,
                                     nr = nr[i],reweight = sample.reweight)}
#nr best 200

#single

res_cv_temp5 <- matrix(0, nrow = 1, ncol = 4)
res_cv_temp5[i,] <- xgbcv.function(features = feature_train, labels = label_train, K,eta_val =0.05,
                                     lmd = 0.005,gamma = 0.1,md = 5,nr = 500,  reweight = sample.reweight)

