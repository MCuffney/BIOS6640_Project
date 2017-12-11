####################################################################################
# BIOS 6640: Project                                                               #
# 03_Cuffney_BIOS6640_Project_Possion_regression.R                                 #
# Possion analysis                                                                 #
# Michael Cuffney                                                                  #
# Data Created: 12/10/2017                                                         #
# Last Edited: 12/11/2017                                                          #
# Finalilzed: 12/11/2017                                                           #
####################################################################################
library(MASS)
library(lme4)

load('C:\\Users\\micha\\Desktop\\Python & R in Data Science\\Project\\Data\\RDATA\\malaria.rdata')

malaria["lagince"] <- round(malaria$lagince)


# fit a standard possion regression model
glm1 <- glmer(cases ~ 1 + AvgTemp + templag4 + AvgRain + rainlag4 + (1|District), offset=log(u5total), family=poisson, data=malaria)

summary(glm1)
