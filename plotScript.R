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
with(dta,plot(Tempo,Year))
abline(coef(regTempo)) # draw trend line using coefficients of the linear regression

with(dta,plot(Duration,Year))
abline(coef(regDuration))

with(dta,plot(TimeSignature,Year))
abline(coef(regTimeSignature))

with(dta,plot(KeySignature,Year))
abline(coef(regKeySignature))

with(dta,plot(ArtistLatitude,Year))
abline(coef(regArtistLatitude))

with(dta,plot(ArtistLongitude,Year))
abline(coef(regArtistLongitude))

with(dta,plot(StartFadeOut,Year))
abline(coef(StartFadeOut))

with(dta,plot(EndFadeIn,Year))
abline(coef(EndFadeIn))

# Plot data with log
with(dta,plot(log(Tempo),Year))
with(dta,plot(log(Duration),Year))
with(dta,plot(log(TimeSignature),Year))
with(dta,plot(log(KeySignature),Year))
with(dta,plot(log(ArtistLatitude),Year))
with(dta,plot(log(ArtistLongitude),Year))
with(dta,plot(log(StartFadeOut),Year))
with(dta,plot(log(EndFadeIn),Year))

# Boxplot
with(dta,boxplot(Year~Tempo))
with(dta,boxplot(Year~KeySignature))
with(dta,boxplot(Year~TimeSignature))
