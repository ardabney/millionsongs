# Performs linear regression on Year v. all the other variables.
# The linear regression function is only written for Year v. Tempo.  Change "Tempo" to
# to other variables
# Plots the linear model with a scatterplot and boxplot.


# Linear regression
reg<-lm(Year~Tempo,dat=dta)

# Plot data
with(dta,plot(Tempo,Year))
abline(coef(reg)) # draw trend line using coefficients of reg

# Plot data with log
with(dta,plot(log(Tempo),Year))

# Boxplot
with(dta,boxplot(Year~Tempo))
