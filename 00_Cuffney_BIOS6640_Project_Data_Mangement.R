####################################################################################
# BIOS 6640: Project                                                               #
# 00_Cuffney_BIOS6640_Project_Data_Mangement.R                                     #
# Data creation, mangement & cleaning                                              #
# Michael Cuffney                                                                  #
# Data Created: 11/27/2017                                                         #
# Last Edited: 12/10/2017                                                          #
# Finalilzed: 12/10/2017                                                           #
####################################################################################
library(foreign)
library(plyr)
library(dplyr)
library(EpiWeek)
library(DataCombine)
setwd("C:\\Users\\micha\\Desktop\\Python & R in Data Science\\Project\\Weather")

########## Begin creating weather dataset ##########
paths <- dir(pattern = "\\.txt$")
names(paths) <- basename(paths)
weather <- ldply(paths, read.table, col.names = c('year', 'mo', 'day','raint', 'tavg', 'rh', 'sd', 'psfc'), skip=3)

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
weather$District <- gsub('_', ' ', weather$District)
weather$District <- sub("BILENE MACIA", "BILENE - MACIA", weather$District)
weather$District <- sub("CAHORA BASSA", "CAHORA-BASSA", weather$District)
weather$District <- sub("CIDADE DE NACALA PORTO", "CIDADE DE NACALA-PORTO", weather$District)
weather$District <- sub("CIDADE DE XAI XAI", "CIDADE DE XAI-XAI", weather$District)
weather$District <- sub("NACALA VELHA", "NACALA-VELHA", weather$District)
weather$District <- sub("NAMAPA ERATI", "NAMAPA - ERATI", weather$District)
weather$District <- sub("RAPALE", "RAPALE-NAMPULA", weather$District)
weather$District <- sub("XAI XAI", "XAI-XAI", weather$District)

unique((as.character(weather$District))) # checking that the district neames match with the incidence data

# remove the .id variable (the filenames)
weather <- weather[,-1]

# Create Epiyear and Epiweek for mergering
weather["Date"] <- paste(weather$year, weather$mo, weather$day, sep = "/")
weather$Date <- as.Date(weather$Date, format = "%Y/%m/%d")
week <- dateToEpiweek(weather$Date, format = "%Y-%m-%d", firstday = "Sunday")
weather["Epiweek"] <-  week[2]
weather['Epiyear'] <- week[1]

# Create varaibles for average temperature, rainfall, and relative humididty by district, epiyear, and epiweek
avgtemp <- aggregate(tavg ~ District + Epiyear + Epiweek, weather, mean )
avgrain <- aggregate(raint ~ District + Epiyear + Epiweek, weather, mean)
avgrh <- aggregate(rh ~ District + Epiyear + Epiweek, weather, mean)

# Merge avgtemp, avgrain and avgrh to create final weather dataset, save final weather dataset
merge1 <- merge(avgtemp, avgrain, by = c('District', 'Epiyear', 'Epiweek'),all = T, all.x = T, all.y = T)
weatherfinal <- merge(merge1, avgrh, by = c('District', 'Epiyear', 'Epiweek'), all = T, all.x = T, all.y = T)
colnames(weatherfinal)[4:6] <- c('AvgTemp', 'AvgRain', 'AvgRH')
save(weatherfinal, file = 'C:\\Users\\micha\\Desktop\\Python & R in Data Science\\Project\\Data\\RDATA\\weather.RData')
########## End Creating weather dataset ##########

########## Begin reading in the intervention and incidence data ##########
# Read in the intervention data
intven <- read.csv('C:\\Users\\micha\\Desktop\\Python & R in Data Science\\Project\\Data\\intervention.csv', header=TRUE)

# Read in the incdience data
inciden <- read.csv('C:\\Users\\micha\\Desktop\\Python & R in Data Science\\Project\\Data\\incidence.csv', header=TRUE)
sorted <- inciden[order(inciden$District),]
unique((as.character(sorted$District))) # used to check that the district names match with the weather data

# Save the intervention and incidnece datasets
save(intven, file = 'C:\\Users\\micha\\Desktop\\Python & R in Data Science\\Project\\Data\\RDATA\\intervention.RData')
save(inciden, file = 'C:\\Users\\micha\\Desktop\\Python & R in Data Science\\Project\\Data\\RDATA\\incidence.RData')
########## End reading in the intervention and incidence data ##########

########## Begin mergering data ##########
# Merge weather data and incidence data by District, Epiyear, & Epiweek
weathindce <- merge(weatherfinal, inciden, by = c("District", "Epiyear", "Epiweek"),all = T, all.x = T, all.y = T)

# Create incidence varaible (cases/u5total) x 1,000
weathindce['incidence'] <- (weathindce$cases/weathindce$u5total) * 1000
save(weathindce, file = 'C:\\Users\\micha\\Desktop\\Python & R in Data Science\\Project\\Data\\RDATA\\weathindce.RData')

# create seprate intervention datasets [Sadly could not figure out how to create the intervention varaibles, final analysis was done with out the intervention data]
# irs <- intven[1:3]
# irs["Epiyear"] <- irs$IRSyear
# irs["Epiweek"] <- irs$IRSepiWeek
# itn <- intven[, c('DISTCODE', 'ITNyear', 'ITNepiWeek')]
# itn["Epiyear"] <- itn$ITNyear
# itn["Epiweek"] <- itn$ITNepiWeek

# Merge irs and itn datasets with weathindce data
# weathmergeirs <- merge(weathindce, irs, by = c("DISTCODE", "Epiyear", "Epiweek"), all = T, all.x = T, all.y = T)
# malaria <- merge(weathmergeirs, itn, by = c("DISTCODE", "Epiyear", "Epiweek"), all = T, all.x = T, all.y = T)
# save(malaria, file = 'C:\\Users\\micha\\Desktop\\Python & R in Data Science\\Project\\Data\\RDATA\\malaria.RData')
########## End merging the datasets ##########

########## Begin creation of analysis dataset ##########
# create incidence per 1,000 variable
weathindce['incidence'] <- (weathindce$cases/weathindce$u5total) * 1000

# create the lag varaible for incidecne
lag1 <- slide(weathindce, Var ='incidence', TimeVar = 'Epiweek', NewVar = 'lagince', slideBy = 4)

# Remove obseravations with missing district codes
malaria <- subset(lag1,complete.cases(lag1$DISTCODE))

# Save the final dataset
save(malaria,  file = 'C:\\Users\\micha\\Desktop\\Python & R in Data Science\\Project\\Data\\RDATA\\malaria.RData')
########## End creation of analysis dataset ##########













                  