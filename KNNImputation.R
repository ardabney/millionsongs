# Run this right after script.R
# Five-fold knn imputation for the missing values


library(DMwR)
imputedDta <- knnImputation(dta, k = 5, scale = T, meth = "weighAvg", distData=NULL)
