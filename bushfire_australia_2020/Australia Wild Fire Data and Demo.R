
#(citation)  Australia Wild Fire Data and Demo, https://moodle.warwick.ac.uk/course/view.php?id=31687

 
setwd("~/Desktop/CIM UAV/Visualisation/Graphical Report ")

  library( maps )
  library( mapdata ) 
  library( sp)
  library(sf)
  library( maptools)
  library( sfsmisc )
  library( raster )
  library( rgeos )
  library( rgdal )
  library( scales )
  library(GISTools)
  library(oz) 

## the reason I have so many libraries called, is because I tried various methods to get the way I wanted it
## I am now afraid to uncall it because, I don't want to take the chance of breaking the code and having to fix it again
## However, I am aware that the main libraries that I am using are, "sp", "sf", "oz", "rgdal"
# (citation) Bill Venables and Kurt Hornik (2016). oz: Plot the Australian Coastline and States. R package version 1.0-21. 
# (citation) https://CRAN.R-project.org/package=oz 



AuSt <- st_read("Australia_Polygon.shp")

# (citation) Simple Features for R, https://cran.r-project.org/web/packages/sf/vignettes/sf1.html

st_geometry_type(AuSt)


fia <- read.csv("fire_nrt_M6_96062.csv", sep=",")


fia$acq_date <- as.Date(fia$acq_date, format = "%d/%m/%Y")



summary(fia)
head(fia)

#(citation)  Australia Wild Fire Data and Demo, https://moodle.warwick.ac.uk/course/view.php?id=31687

 
head(AuSt)
png(filename = "Rplot%03d.png",
    width = 800, height = 600, units = "px", pointsize = 12,
    bg = "white",  res = NA)
# R Documentation, https://www.rdocumentation.org/packages/grDevices/versions/3.4.1/topics/png

plot(st_geometry(AuSt),col = sf.colors(12, categorical = TRUE), border = 'grey', 
     axes = TRUE) 

plot(AuSt["name"], key.pos = 4)
# citation R Documentation, https://cran.r-project.org/web/packages/sf/vignettes/sf5.html

title(main="States of Australia", col.main="black")


 oz(states = TRUE) 
 # (citation) Bill Venables and Kurt Hornik (2016). oz: Plot the Australian Coastline and States. R package version 1.0-21. 
 # (citation) https://CRAN.R-project.org/package=oz 

 heat <- rgb(255,0,0,max=255,alpha=25,names="red1")
  points(fia$longitude, fia$latitude, pch=16, col=heat,cex= .5)
  

  heat <- rgb(255,0,0,max=255,alpha=25,names="red1")
  points(fia$longitude, fia$latitude, pch=16, col=heat,cex= 1)
  

  heat <- rgb(255,0,0,max=255,alpha=25,names="red1")
  points(fia$longitude, fia$latitude, pch=16, col=heat,cex= 1.5)
  

  heat <- rgb(255,0,0,max=255,alpha=25,names="red1")
  points(fia$longitude, fia$latitude, pch=16, col=heat,cex= 2)
  
  # inspired from the lab exercises.

  dev.off()

  
  