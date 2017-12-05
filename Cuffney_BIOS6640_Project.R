##########################
# BIOS 6640: Project
# Michael Cuffney   
# Data Created: 11/27/2017
# Last Edited: 12/05/2017
##########################

library(foreign)
# Reading in the Data
setwd("C:\\Users\\micha\\Desktop\\Python & R in Data Science\\Project\\Weather")
temp = list.files(pattern="*.txt")
for (i in 1:length(temp)) assign(temp[i], read.table(temp[i],
     col.names = c('year', 'mo', 'day','raint(mm/d)', 'tavg(C)', 'rh(%)', 'sd(mmHg)', 'psfc(hPa)'), skip=3))
