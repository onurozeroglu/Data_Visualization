# Exercise.

# Please install sandwich package and execute the following code in R :

data(Investment, package="sandwich")
Investment <- as.data.frame(Investment)

# Investments in the USA, an annual time series from 1963 to 1982 with 7 variables. 

# Please investigate factors  related to investments in the USA, create visualization using lattice package.
library(latticeExtra)
a<-xyplot(RealInv~Investment,Investment, pch=3, type="b")
b<-xyplot(Interest~Investment, Investment, pch=1 , type="b")
c<-c(a, b, layout = 1:2)
update(c, scales = list(y = list(rot = 0)), ylab = c("real Investment", "Interest Rate"),xlab="Investment")

d<-xyplot(Price~Investment,Investment, pch=3, type="b")
f<-xyplot(GNP~Investment, Investment, pch=1 , type="b")
e<-c(d, f, layout = 1:2)
update(e, scales = list(y = list(rot = 0)), ylab = c("Price", "GNP"),xlab="Investment")


library(latticeExtra)
Investment1 <- data.frame(Years=c(1963:1982),Investment)
a<-xyplot(Investment~Years,Investment1, pch=0)
b<-xyplot(RealInv~Years, Investment1, pch=1)
c<-xyplot(Interest~Years, Investment1, pch=2)
d<-xyplot(GNP~Years, Investment1, pch=3)
e<-xyplot(Price~Years, Investment1, pch=4)
graph<-c(a, b, c, d, e, layout=c(1, 5))
update(graph, scales = list(y = list(rot = 0)), ylab = c("Investments", "Real Inv","Interest","GNP","Price"),
       panel=function(x, y) {
         panel.loess(x, y)
         panel.xyplot(x, y)
       })


xyplot(Investment~GNP, Investment, pch=0,
       panel=function(x, y) {
         panel.lmline(x, y)
         panel.xyplot(x, y)
       })

