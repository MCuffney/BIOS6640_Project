####################################################################################
# BIOS 6640: Project                                                               #
# 01_Cuffney_BIOS6640_Project.R                                                    #
# Reading in the weather data for each district then combing them into one dataset #
# Michael Cuffney                                                                  #
# Data Created: 11/27/2017                                                         #
# Last Edited: 12/07/2017                                                          #
####################################################################################

library(foreign)
setwd("C:\\Users\\micha\\Desktop\\Python & R in Data Science\\Project\\Weather")
# Reading in the Data

library(plyr)
paths <- dir(pattern = "\\.txt$")
names(paths) <- basename(paths)
weather <- ldply(paths, read.table, col.names = c('year', 'mo', 'day','raint(mm/d)', 'tavg(C)', 'rh(%)', 'sd(mmHg)', 'psfc(hPa)'), skip=3)

# Creating the distrcit variable based on the file name
weather["District"] <- weather$.id
weather$District <- sub('_ZAM.*','', weather$District)
weather$District <- sub('_CAB.*','', weather$District)
weather$District <- sub('_NAM.*','', weather$District)
weather$District <- sub('_TET.*','', weather$District)
weather$District <- sub('_CAB.*','', weather$District)
weather$District <- sub('_MAN.*','', weather$District)
weather$District <- sub('_GAZ.*','', weather$District)
weather$District <- sub('_MAP.*','', weather$District)
weather$District <- sub('_SOF.*','', weather$District)
weather$District <- sub('_NIA.*','', weather$District)
weather$District <- sub('_INH.*','', weather$District)
weather$District <- gsub('_', '-', weather$District)
unique((as.character(weather$District)))

# remove the .id variable (the filenames)
weather <- weather[,-1]

# saving the weather dataset
save(weather, file = 'C:\\Users\\micha\\Desktop\\Python & R in Data Science\\Project\\Data\\weather.RData')
