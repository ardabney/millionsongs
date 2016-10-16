# Leave-one-out cross validation for the linear models and qda,lda,knn classification models


# Performs CV to obtain MSE
mse<-numeric(nrow(dta))
for(i in 1:nrow(dta)) {
	data_test<-dta[i,]
	data_train<-dta[-i,]
	reg<-lm(Year~ArtistLatitude+ArtistLongitude
		+Duration+KeySignature+Tempo+TimeSignature
		+StartFadeOut+EndFadeIn
		,data=data_train)
	fitted<-predict(reg,newdata=data_test)
	mse[i]<-mean((data_test$Year-fitted)**2)
	#adj_R2[i]<-summary(reg)$adj.r.squared
}


# Doesn't work
# CV for LDA
confusion_matrix<-vector("list",1946)
for(i in 1:nrow(dta)) {
	data_test<-region_dta_selected[i,]
	data_train<-region_dta_selected[-i,]
	lda_out <- lda(region ~ ., data_train, na.action = "na.omit")
	lda.pred<-predict(lda_out, data_test)
	confusion_matrix[[i]]<-table(lda.pred$class, data_test$region)
}

conf_sum <- matrix(0,nrow=8,ncol=8)
for(i in 1:1946) {
	conf_sum <- conf_sum + confusion_matrix[[i]]
	conf_avg <- conf_sum/1946
}

confusion_matrix[[i]]<-table(data_test$region, lda.pred)

#end of CV loop
confusion_matrix_cv <- mean(1946 matrices)
