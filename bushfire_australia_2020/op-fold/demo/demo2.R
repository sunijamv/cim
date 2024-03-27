fia <- read.csv("fire_nrt_M6_96062.csv", sep=",")

fia$acq_date <- as.Date(fia$acq_date, format = "%d/%m/%Y")
NumberOfSamples <- 1000
fia <- fia[ sample(1:dim(fia)[1], NumberOfSamples, replace=F ),  ]
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
#allow general polygon clipping library for R - library(gpclib)
#for creating geographical maps
#contains basic data to go along with 'maps' (topographic and geologic) 
#utilities from Seminar fuer Statistik ETH Zurich
#for creating projected maps
#tools to deal with raster maps
#interface to geometry engine - open source (GEOS) 
#bindings for the geospatial data abstractionlibrary #for transparency

# we can then produce a map that focuses on Australia...
# and add the points on top

AuSt <- readShapePoly("~/Desktop/CIM UAV/Visualisation/Graphical Report/Australia_Polygon.shp”)

dev.new()

au1 <- map( database= "worldHires",regions="Australia",
fill= FALSE, 
     xlim=c(110,160),
            ylim=c(-45,-5), mar=c(0,0,0,0))

plot(au1$x,au1$y)
title(main = "Australia Wildfires")


heat <- rgb(255,0,0,max=255,alpha=25,names="red1")
points(fia$longitude, fia$latitude, pch=16, col=heat,cex= .5)


heat <- rgb(255,0,0,max=255,alpha=25,names="red1")
points(fia$longitude, fia$latitude, pch=16, col=heat,cex= 1)


heat <- rgb(255,0,0,max=255,alpha=25,names="red1")
points(fia$longitude, fia$latitude, pch=16, col=heat,cex= 1.5)


heat <- rgb(255,0,0,max=255,alpha=25,names="red1")
points(fia$longitude, fia$latitude, pch=16, col=heat,cex= 2)

box(lty = '1373', col='black')