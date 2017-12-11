####################################################################################
# BIOS 6640: Project                                                               #
# 01_Cuffney_BIOS6640_Project_Exploratory_Analysis.R                               #
# Exploratory analysis                                                             #
# Michael Cuffney                                                                  #
# Data Created: 12/10/2017                                                         #
# Last Edited: 12/10/2017                                                          #
# Finalilzed: 12/10/2017                                                           #
####################################################################################
library(mosaic)
library(data.table)
library(lattice)

# Load analysis dataset
load(file = 'C:\\Users\\micha\\Desktop\\Python & R in Data Science\\Project\\Data\\RDATA\\malaria.RData')

########## Begin descripitve graphics ##########

# Create plots of the relationshi average incidecne rate and avg temperature by region
malariaplot <- na.omit(malaria)
plot(smooth.spline(malariaplot$AvgTemp[malariaplot$Region=="Center"], malariaplot$lagince[malariaplot$Region=="Center"], df=4), type="l",
     col="red", xlab="Average Temperature (Celecius)", ylab="Average incidence (per 1,000)", 
     main="Average incidence by Temperature \n and Region", ylim=c(0, 80), lty=5, lwd=2)
lines(smooth.spline(malariaplot$AvgTemp[malariaplot$Region=="Coastal"], malariaplot$lagince[malariaplot$Region=="Coastal"], df=4), type="l",
      col="blue", lty=4, lwd=2)
lines(smooth.spline(malariaplot$AvgTemp[malariaplot$Region=="Northern"], malariaplot$lagince[malariaplot$Region=="Northern"], df=4), type="l",
      col= "dark green", lty=3, lwd=2)
lines(smooth.spline(malariaplot$AvgTemp[malariaplot$Region=="Southern"], malariaplot$lagince[malariaplot$Region=="Southern"], df=4), type="l",
      col="purple", lty=2, lwd=2)
legend("bottomright", c("Center", "Coastal", "Northern", "Southern"), 
       text.col = c("blue", "red", "dark green", "purple"), lty=c(5,4,3,2), cex = 1, bty = "n", 
       title.col="black", title="Region", lwd=2)

# Create plots of the relationship between incidecene and average rainfall by region
plot(smooth.spline(malariaplot$AvgRain[malariaplot$Region=="Center"], malariaplot$lagince[malariaplot$Region=="Center"], df=4), type="l",
     col="red", xlab="Average Rainfall (mm)", ylab="Average incidence (per 1,000)", 
     main="Average incidence by Rainfall \n and Region", ylim=c(0, 150), lty=5, lwd=2)
lines(smooth.spline(malariaplot$AvgRain[malariaplot$Region=="Coastal"], malariaplot$lagince[malariaplot$Region=="Coastal"], df=4), type="l",
      col="blue", lty=4, lwd=2)
lines(smooth.spline(malariaplot$AvgRain[malariaplot$Region=="Northern"], malariaplot$lagince[malariaplot$Region=="Northern"], df=4), type="l",
      col="dark green", lty=3, lwd=2)
lines(smooth.spline(malariaplot$AvgRain[malariaplot$Region=="Southern"], malariaplot$lagince[malariaplot$Region=="Southern"], df=4), type="l",
      col="purple", lty=2, lwd=2)
legend("topleft", c("Center", "Coastal", "Northern", "Southern"), 
       text.col = c("blue", "red", "dark green", "purple"), lty=c(5,4,3,2), cex = 1, bty = "n", 
       title.col="black", title="Region", lwd=2)

# Create boxplots of incidecne, rainfall and temperature by epiyear
par(mfrow=c(3,2))
boxplot(malaria$AvgRain ~ malaria$Epiyear, ylim=c(0,20), xlab="Year", ylab="Average weekly rainfall (mm)", col="blue")
boxplot(malaria$AvgTemp ~ malaria$Epiyear, ylim=c(10,40), xlab="Year", ylab="Average weekly temperature (C)", col="red")
boxplot(malaria$lagince ~ malaria$Epiyear, ylim=c(0,200), xlab="Year", ylab="Average weekly incidence (per 1,000)", col="yellow")

par(mfrow=c(3,2))
hist(malaria$AvgRain, breaks=20, xlab="Average Weekly rainfall", main="", col="grey")
hist(malaria$AvgTemp, breaks=20, xlab="Weekly ave temperature (Celcius)", main="", col="grey")
hist(malaria$lagince, breaks=20, xlab="Weekly average incidence", main="", col="grey")
########## End descriptive graphics ##########

########## Begin Descriptive statistics ##########
# Calculate descriptive statistcs by epiyear
avgtemp_year <- favstats(AvgTemp ~ Epiyear, data = malaria)
avgrain_year <- favstats(AvgRain ~ Epiyear, data = malaria)
avginc_year <- favstats(lagince ~ Epiyear, data = malaria)

# calculate descriptive statistcs by region
Avgtemp_reg <- favstats(AvgTemp ~ Region, data = malaria)
Avgrain_reg <- favstats(AvgRain ~ Region, data = malaria)
avginc_reg <- favstats(lagince ~ Region, data = malaria)

# Calculate descriptive statistcs by Region & Epiyear
Avgtemp_regepi <- favstats(AvgTemp ~ Region + Epiyear, data = malaria)
Avgrain_regepi <- favstats(AvgRain ~ Region + Epiyear, data = malaria)
avginc_regepi <- favstats(lagince ~ Region + Epiyear, data = malaria)

# claculate descriptive statistcs by epiyweek
weekly_temp <- favstats(AvgTemp ~ Epiweek, data = malaria)
weekly_rain <- favstats(AvgRain ~ Epiweek, data = malaria)
weekly_indc <- favstats(lagince ~ Epiweek, data = malaria)

# Calculate total rainfall and incidecen per year
(yearly_rain <- sum(AvgRain ~ Epiyear, data = malaria, na.rm = getOption("na.rm", TRUE)))
(yearly_ince <- sum(lagince ~ Epiyear, data = malaria, na.rm = getOption("na.rm", TRUE)))

# Calcualte the number of districts in each region
DT <- data.table(malaria)
DT[, .(number_of_distinct_orders = uniqueN(District)), by = Region]

# Calcualate correlation between independent variables and outcome
cor(malaria$AvgTemp, malaria$lagince, use = "complete.obs")
cor(malaria$AvgRain, malaria$lagince, use = "complete.obs")
########## End Descriptive Statistics ##########


