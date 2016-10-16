# Run this script before starting anything else
# Replaces all NA's to 0's and converts any variables that are not numericals to numericals

library(class)
library(MASS)

# Convert 0 to NA
dta<-read.csv("SongCSV.csv")
dta[dta==0]<-NA

# Convert factor class to numerical
dta$Year<-as.numeric(as.character(dta$Year))
dta$KeySignature<-as.numeric(as.character(dta$KeySignature))
dta$EndFadeIn<-as.numeric(as.character(dta$EndFadeIn))
dta$Danceability<-as.numeric(as.character(dta$Danceability))
