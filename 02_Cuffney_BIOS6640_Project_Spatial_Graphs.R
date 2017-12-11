####################################################################################
# BIOS 6640: Project                                                               #
# 02_Cuffney_BIOS6640_Project_Spatial_Graphs.R                                     #
# Exploratory analysis                                                             #
# Michael Cuffney                                                                  #
# Data Created: 12/10/2017                                                         #
# Last Edited: 12/10/2017                                                          #
# Finalilzed: 12/10/2017                                                           #
####################################################################################
library(RColorBrewer)
library(sp)
library(maptools) 
library(lattice)
library(latticeExtra) # For layer()
library(rgdal)

# Load analysis dataset
load(file = 'C:\\Users\\micha\\Desktop\\Python & R in Data Science\\Project\\Data\\RDATA\\malaria.RData')

########## Begin creating Spatial graphs ##########
# Cereate spatial maps of avgtemp, avgrain and avgrh per district ber year

# aggreate by district, region, epiyear
yearlytemp <- aggregate(AvgTemp ~ DISTCODE + Region + Epiyear, malaria, mean)
yearlyrain <- aggregate(AvgRain ~ DISTCODE +  Region + Epiyear, malaria, mean)
yearlyincie <- aggregate(lagince ~ DISTCODE + Region + Epiyear, malaria, mean)
xcord <- aggregate(XCOORD ~ DISTCODE + Region + Epiyear, malaria, mean)
ycord <- aggregate(YCOORD ~ DISTCODE + Region + Epiyear, malaria, mean)
malay <- malaria[, c("DISTCODE", "District", "Epiyear")]
malay <- aggregate(DISTCODE ~ District + Epiyear, malay, mean)

# Merge aggregated data
merge1 <- merge(yearlyrain, yearlytemp, by=c("DISTCODE", "Region", "Epiyear"), all = T, all.x = T, all.y = T)
merge2 <- merge(merge1, yearlyincie, by=c("DISTCODE", "Region", "Epiyear"), all = T, all.x = T, all.y = T)
merge3 <-merge(merge2, xcord, by=c("DISTCODE", "Region", "Epiyear"), all = T, all.x = T, all.y = T)
final <- merge(merge3, ycord, by=c("DISTCODE", "Region", "Epiyear"), all = T, all.x = T, all.y = T)
dta <- merge(final, malay, by=c("DISTCODE", "Epiyear"), all = T, all.x = T, all.y = T)

poly1 <- readShapePoly('C:\\Users\\micha\\Desktop\\Python & R in Data Science\\Project\\Data\\Moz_admin2.shp', IDvar="DISTCODE")
plot(poly1)

# Create map for epiyear 2010
map10 <- subset(dta, Epiyear==2010)
# NEED TO SET ROWNAMES SAME AS THE ID VAR TO LINK #
rownames(map10) <- map10$DISTCODE

# sp package #
polydat10 <- SpatialPolygonsDataFrame(poly1, map10)

# MULTIPLE #
ince <- brewer.pal(n = 6, name = "RdPu")

# plot map
spplot(polydat10,'lagince', names.attr = "incidence", 
       colorkey=list(space="right"), scales = list(draw = TRUE), main = "Mozambique malaria incidence, 2010", 
       as.table = TRUE, cuts=5, col.regions = ince)

# Create map for epiyear 2011
map11 <- subset(dta, Epiyear==2011)
# NEED TO SET ROWNAMES SAME AS THE ID VAR TO LINK #
rownames(map11) <- map11$DISTCODE

# sp package #
polydat11 <- SpatialPolygonsDataFrame(poly1, map1)

# plot map
spplot(polydat11,'lagince', names.attr = "incidence", 
       colorkey=list(space="right"), scales = list(draw = TRUE), main = "Mozambique malaria incidence, 2011", 
       as.table = TRUE, cuts=5, col.regions = ince)

# Create map for epiyear 2012
map12 <- subset(dta, Epiyear==2012)
# NEED TO SET ROWNAMES SAME AS THE ID VAR TO LINK #
rownames(map12) <- map12$DISTCODE

# sp package #
polydat12 <- SpatialPolygonsDataFrame(poly1, map12)

# Plot map
spplot(polydat12,'lagince', names.attr = "incidence", 
       colorkey=list(space="right"), scales = list(draw = TRUE), main = "Mozambique malaria incidence, 2012", 
       as.table = TRUE, cuts=5, col.regions = ince)

# Create map for epiyear 2013
map13 <- subset(dta, Epiyear==2013)
# NEED TO SET ROWNAMES SAME AS THE ID VAR TO LINK #
rownames(map13) <- map13$DISTCODE

# sp package #
polydat13 <- SpatialPolygonsDataFrame(poly1, map13)

# Plot map
spplot(polydat13,'lagince', names.attr = "incidence", 
       colorkey=list(space="right"), scales = list(draw = TRUE), main = "Mozambique malaria incidence, 2013", 
       as.table = TRUE, cuts=5, col.regions = ince)

# Create map for epiyear 2014
map14 <- subset(dta, Epiyear==2014)
# NEED TO SET ROWNAMES SAME AS THE ID VAR TO LINK #
rownames(map14) <- map14$DISTCODE

# sp package #
polydat14 <- SpatialPolygonsDataFrame(poly1, map14)

# Plot map
spplot(polydat14,'lagince', names.attr = "incidence", 
       colorkey=list(space="right"), scales = list(draw = TRUE), main = "Mozambique malaria incidence, 2014", 
       as.table = TRUE, cuts=5, col.regions = ince)

# Create map for epiyear 2015
map15 <- subset(dta, Epiyear==2015)
# NEED TO SET ROWNAMES SAME AS THE ID VAR TO LINK #
rownames(map15) <- map15$DISTCODE

# sp package #
polydat15 <- SpatialPolygonsDataFrame(poly1, map15)

# Plot map
spplot(polydat15,'lagince', names.attr = "incidence", 
       colorkey=list(space="right"), scales = list(draw = TRUE), main = "Mozambique malaria incidence, 2015", 
       as.table = TRUE, cuts=5, col.regions = ince)

# Create map for epiyear 2016
map16 <- subset(dta, Epiyear==2016)
# NEED TO SET ROWNAMES SAME AS THE ID VAR TO LINK #
rownames(map16) <- map16$DISTCODE

# sp package #
polydat16 <- SpatialPolygonsDataFrame(poly1, map16)

# Plot map
spplot(polydat16,'lagince', names.attr = "incidence", 
       colorkey=list(space="right"), scales = list(draw = TRUE), main = "Mozambique malaria incidence, 2016", 
       as.table = TRUE, cuts=5, col.regions = ince)

# Create map for epiyear 2017
map17 <- subset(dta, Epiyear==2017)
# NEED TO SET ROWNAMES SAME AS THE ID VAR TO LINK #
rownames(map17) <- map17$DISTCODE

# sp package #
polydat17 <- SpatialPolygonsDataFrame(poly1, map17)

# Plot map
spplot(polydat17,'lagince', names.attr = "incidence", 
       colorkey=list(space="right"), scales = list(draw = TRUE), main = "Mozambique malaria incidence, 2017", 
       as.table = TRUE, cuts=5, col.regions = ince)


