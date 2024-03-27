# I am calling the data 'wfa'- Wild fires Australia
# I am trying my level best but depending mostly on the exercises done on class as well as the demo code provided with the assignment"

setwd("~/Desktop/CIM UAV/Visualisation/Graphical Report ")
wfa <- read.csv("fire_nrt_M6_96062.csv", sep=",")

# to ensure date format is correct, based on the demo code provided on moodle

wfa$acq_date <- as.Date(wfa$acq_date, format = "%d/%m/%Y")

# summary of the data 

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

map( database="worldHires", regions="Australia", fill= FALSE, 
     xlim=c(110,160),
     ylim=c(-45,-5), mar=c(0,0,0,0))

oz(states = TRUE) 
heat <- rgb(255,0,0,max=255,alpha=25,names="red1")
points(wfa$longitude, wfa$latitude, pch=16, col=heat,cex= .5)


heat <- rgb(255,0,0,max=255,alpha=25,names="red1")
points(wfa$longitude, wfa$latitude, pch=16, col=heat,cex= 1)


heat <- rgb(255,0,0,max=255,alpha=25,names="red1")
points(wfa$longitude, wfa$latitude, pch=16, col=heat,cex= 1.5)


heat <- rgb(255,0,0,max=255,alpha=25,names="red1")
points(wfa$longitude, wfa$latitude, pch=16, col=heat,cex= 2)

box(lty = '1373', col='black')