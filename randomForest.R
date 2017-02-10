library(randomForest)
library(tree)
require(xgboost)

set.seed(1)
samp <- sample(nrow(region_dta_selected), 0.6 * nrow(region_dta_selected))
train <- region_dta_selected[samp,]
test <- region_dta_selected[-samp,]
region_dta_selected$region <- NULL
tree.region <- tree(region~., data=train, mtry=7)
model <- randomForest(region~., data=train)
boost.region <- gbm(region~., data=train)
yhat.boost <- predict(boost.region, newdata=test)
