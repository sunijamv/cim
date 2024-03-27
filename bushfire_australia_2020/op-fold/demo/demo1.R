library(sp)         #classes and methods for spatial data
library(maptools)   #tools for reading and handling  spatial objects
gpclibPermit()
library(maps)
library(mapdata)
library(sfsmisc)
library(mapproj)
library(raster)
library(rgeos)
library(rgdal)
library(scales)
library(GISTools)
#allow general polygon clipping library for R - library(gpclib)
#for creating geographical maps
#contains basic data to go along with 'maps' (topographic and geologic) 
#utilities from Seminar fuer Statistik ETH Zurich
#for creating projected maps
#tools to deal with raster maps
#interface to geometry engine - open source (GEOS) 
#bindings for the geospatial data abstractionlibrary #for transparency

setwd("~/Desktop/CIM UAV/Visualisation/Graphical Report ")

AuSt <- readShapePoly("~/Desktop/CIM UAV/Visualisation/Graphical Report/Australia_Polygon.shp”)


wfa$acq_date <- as.Date(wfa$acq_date, format = "%d/%m/%Y")
summary(wfa)
head(wfa)

NumberOfSamples <- 1000
wfa <- wfa[ sample(1:dim(wfa)[1], NumberOfSamples, replace=F ),  ]
library( maps )
library( mapdata ) # "a cleaned-up version of the CIA World Data Bank II data"
library(oz)
# we can then produce a map that focuses on Australia...
# and add the points on top

dev.new()

map(database = "worldHires", regions = "australia", 
    fill = TRUE, 
    col = "grey", 
    bg="lightblue")
    
plot(AuSt, add=TRUE,
    xlim=c(-140,-110),
    ylim=c(48,64),
    col=alpha("darkgreen",0.6),
    border=FALSE)
    
heat <- rgb(255,0,0,max=255,alpha=25,names="red1")
points(wfa$longitude, wfa$latitude, pch=16, col=heat,cex= .5)


heat <- rgb(255,0,0,max=255,alpha=25,names="red1")
points(wfa$longitude, wfa$latitude, pch=16, col=heat,cex= 1)


heat <- rgb(255,0,0,max=255,alpha=25,names="red1")
points(wfa$longitude, wfa$latitude, pch=16, col=heat,cex= 1.5)


heat <- rgb(255,0,0,max=255,alpha=25,names="red1")
points(wfa$longitude, wfa$latitude, pch=16, col=heat,cex= 2)

#put a scale on the map

map.scale(-123.3, 50.7, ratio=FALSE,
relwidth=0.2, cex=1.2)
    
    