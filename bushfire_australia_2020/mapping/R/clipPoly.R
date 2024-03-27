clipPoly <-
function(clip=Polygon(cbind(c(145,145,146,146,145), y=c(-16,-17,-17,-16,-16))),
                     shape=qld, type=c('difference','intersection','union')) {
    require(rgeos) 
    ply <- SpatialPolygons(list(Polygons(list(clip), ID='rect')))
    if (type=='difference') return(gDifference(ply,shape))
    if (type=='intersection') return(gIntersection(ply,shape))
    if (type=='union') return(gUnion(ply,shape))
}
