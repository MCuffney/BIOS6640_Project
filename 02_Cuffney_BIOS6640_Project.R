#########################################################################################
# BIOS 6640: Project                                                                    #
# 01_Cuffney_BIOS6640_Project.R                                                         #
# Reading in intervention & incidence datasets and combining them with the weather data #
# Michael Cuffney                                                                       #
# Data Created: 12/05/2017                                                              #
# Last Edited: 12/05/2017                                                               #
#########################################################################################

library(foreign)
intven <- read.csv('C:\\Users\\micha\\Desktop\\Python & R in Data Science\\Project\\intervention.csv', header=TRUE)
inciden <- read.csv('C:\\Users\\micha\\Desktop\\Python & R in Data Science\\Project\\incidence.csv', header=TRUE)
sorted <- inciden[order(inciden$District),]
distcnm <- unique((as.character(sorted$District)))
distcnm

# saving the intervention and incidence datasets
save(intven, file = 'C:\\Users\\micha\\Desktop\\Python & R in Data Science\\Project\\Data\\intervention.RData')
save(inciden, file = 'C:\\Users\\micha\\Desktop\\Python & R in Data Science\\Project\\Data\\incidence.RData')

