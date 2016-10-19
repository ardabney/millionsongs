# Performs linear regression on Year v. all the other variables.
# Plots the linear model with a scatterplot and boxplot.


# Linear regression
regTempo<-lm(Year~Tempo,data=dta)
regDuration<-lm(Year~Duration,data=dta)
regTimeSignature<-lm(Year~TimeSignature,data=dta)
regKeySignature<-lm(Year~KeySignature,data=dta)
regArtistLatitude<-lm(Year~ArtistLatitude,data=dta)
regArtistLongitude<-lm(Year~ArtistLongitude,data=dta)
regStartFadeOut<-lm(Year~StartFadeOut,data=dta)
regEndFadeIn<-lm(Year~EndFadeIn,data=dta)

# Plot data
with(dta,plot(Tempo,Year,main="Year v. Tempo"))
abline(coef(regTempo)) # draw trend line using coefficients of the linear regression

with(dta,plot(Duration,Year,main="Year v. Duration"))
abline(coef(regDuration))

with(dta,plot(TimeSignature,Year,main="Year v. Time Signature"))

with(dta,plot(KeySignature,Year,main="Year v. Key Signature"))

with(dta,plot(ArtistLatitude,Year,main="Year v. Artist Latitude"))

with(dta,plot(ArtistLongitude,Year,main="Year v. Artist Longitude"))

with(dta,plot(StartFadeOut,Year,main="Year v. StartFadeOut"))
abline(coef(StartFadeOut))

with(dta,plot(EndFadeIn,Year,main="Year v. EndFadeIn"))
abline(coef(EndFadeIn))

# Plot data with log
with(dta,plot(log(Tempo),Year,main="Year v. log(Tempo)"))
with(dta,plot(log(Duration),Year,main="Year v. log(Duration)"))
with(dta,plot(log(TimeSignature),Year,main="Year v. log(TimeSignaure)"))
with(dta,plot(log(KeySignature),Year,main="Year v. log(KeySignature)"))
with(dta,plot(log(ArtistLatitude),Year,main="Year v. log(ArtistLatitude)"))
with(dta,plot(log(ArtistLongitude),Year,main="Year v. log(ArtistLongitude)"))
with(dta,plot(log(StartFadeOut),Year,main="Year v. log(StartFadeOut)"))
with(dta,plot(log(EndFadeIn),Year,main="Year v. log(EndFadeIn)"))

# Boxplot
with(dta,boxplot(StartFadeOut~Year,main="StartFadeOut v. Year"))
with(dta,boxplot(EndFadeIn~Year,main="EndFadeIn v. Year"))
with(dta,boxplot(Year~KeySignature,main="Year v. Key Signature"))
with(dta,boxplot(Year~TimeSignature,main="Year v. Time Signature"))
