####################################################################################
# BIOS 6640: Project                                                               #
# 03_Cuffney_BIOS6640_Project_Possion_regression.R                                 #
# Possion analysis                                                                 #
# Michael Cuffney                                                                  #
# Data Created: 12/10/2017                                                         #
# Last Edited: 12/10/2017                                                          #
# Finalilzed: 12/10/2017                                                           #
####################################################################################
library(MASS)

load('C:\\Users\\micha\\Desktop\\Python & R in Data Science\\Project\\Data\\RDATA\\malaria.rdata')

malaria["lagince"] <- round(malaria$lagince)

# fit a standard possion regression model
fit1 <- glm(lagince ~ AvgTemp, data = malaria, family = poisson(link="log"))
summary(fit1)

fit2 <- glm(lagince ~ AvgRain, data = malaria, family = poisson)
summary(fit2)

fit1 <- glm(lagince ~ AvgTemp + AvgRain + Region, data = malaria, family = poisson)



# fit a quasi-likihood model
fit2 <- glm(lagince ~ AvgTemp + AvgRain + Region, data = malaria, family = quasipoisson)
summary(fit2)

# fit a negative binomal model
nbi <- glm.nb(lagince ~ AvgTemp + AvgRain + Region, data = malaria)
summary(nbi)
