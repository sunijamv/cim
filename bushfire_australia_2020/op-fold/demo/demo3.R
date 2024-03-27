require( maps )
require( mapdata )


dev.new()

par(mfrow=c(2,2))
au2<- map(database = "worldHires", regions = "australia", 
    fill = TRUE, 
    col = "grey", 
    bg="lightblue")

plot(au2$x,au2$y)
title(main = "Australia Wildfires")
map.axes()


box(lty = '1373', col = 'red')

map.scale(-123.3, 50.7, ratio=FALSE, relwidth=0.2, cex=1.2)
box()
