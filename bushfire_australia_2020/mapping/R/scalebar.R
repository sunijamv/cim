scalebar <-
function(loc, length, unit = "km", division.cex = 0.8, 
    bg = "white", border = "black", ...) {
    lablength <- length
    length <- length/111
    x <- c(0, length/c(4, 2, 4/3, 1), length * 1.1) + 
        loc[1]
    y <- c(0, length/(10 * 3:1)) + loc[2]
    rect(x[1] - diff(x)[1]/4, y[1] - (y[2] - y[1]), 
        x[5] + strwidth(paste(round(x[5] * 111 - loc[1] * 
            111, 0), unit))/2 + diff(x)[1]/4, y[4] + 
            (y[4] - y[1])/2, col = bg, border = border)
    cols <- rep(c("black", "white"), 2)
    for (i in 1:4) rect(x[i], y[1], x[i + 1], y[2], 
        col = cols[i])
    for (i in 1:5) segments(x[i], y[2], x[i], y[3])
    labels <- round(x[c(1, 3)] * 111 - loc[1] * 111, 
        0)
    labels <- append(labels, paste(round(x[5] * 111 - 
        loc[1] * 111, 0), unit))
    text(x[c(1, 3, 5)], y[4], labels, adj = 0.5, cex = division.cex)
}
