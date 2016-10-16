# LDA, QDA, KNN classification models

# LDA
lda_out <- lda(region ~ ., region_dta_selected, prior = rep(1/7,7), na.action = "na.omit")

# LDA prediction and confusion matrix
lda.pred<-predict(lda_out,region_dta_selected)
table(lda.pred$class,region_dta_selected$region)

# QDA
qda_out <- qda(region_new~., region_new_selected, na.action="na.omit")

# QDA prediction and confusion matrix
# Uses new grouping region_new
qda.pred<-predict(qda_out,region_new_selected)
table(qda.pred$class,region_new_selected$region_new)

# Doesn't work
# KNN
knn_out <- knn(region_dta_selected, region_dta_selected, region_dta_selected$region, k=5, prob= TRUE)
