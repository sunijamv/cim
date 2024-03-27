north.arrow <-
function(x, y, h, lab = "North", lab.pos = "below") {
    polygon(c(x, x, x + h/2), c(y - (1.5 * h), y, y - 
        (1 + sqrt(3)/2) * h), col = "black", border = NA)
    polygon(c(x, x + h/2, x, x - h/2), c(y - (1.5 * 
        h), y - (1 + sqrt(3)/2) * h, y, y - (1 + sqrt(3)/2) * 
        h))
    if (lab.pos == "below") 
        text(x, y - (2.5 * h), lab, adj = c(0.5, 0), 
            cex = 1) else text(x, y + (0.25 * h), lab, adj = c(0.5, 
        0), cex = 1.5)
}
