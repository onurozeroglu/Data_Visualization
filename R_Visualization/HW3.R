Eggs<-read.csv("http://jolej.linuxpl.info/Eggs.csv", header=TRUE)
Eggs$Month<-as.factor(Eggs$Month)
Eggs$First.Week<-as.factor(Eggs$First.Week)
Eggs$Easter<- as.factor(Eggs$Easter)
library(ggplot2)
#1
scat <- ggplot(Eggs, aes(x = Week, y = Cases))
scat + geom_point(aes(color = Month), shape = 21, fill = "White",
                  size = 3, stroke = 2) + theme_light() +
  labs(x = "Week", y = "Cases")

#2
library(GGally)
library(viridis)
library(dplyr)
library(hrbrthemes)

easter_graph <- ggplot(Eggs, aes(x = Week, y = Cases, col= factor(Easter)))
easter_graph + geom_point(aes(color = factor(Easter)))


easter2 <- ggparcoord(Eggs,columns = 7:11, groupColumn = 5,title = "Parallel Coordinate Plot for the Iris Data", alphaLines = 0.3)+scale_color_viridis(discrete=TRUE)+theme_ipsum()+theme(plot.title = element_text(size=10))
easter2 

grouped_easter <- Eggs %>%
  group_by(Easter) %>%
  summarize(
    eggpr = mean(Egg.Pr)
    , beefpr = mean(Beef.Pr)
    , porkpr = mean(Pork.Pr)
    , chickenpr = mean(Chicken.Pr)
    , cerealpr = mean(Cereal.Pr))
grouped_easter 
barplot(grouped_easter$eggpr,
        main = "eggpr",
        xlab = "Easter",
        ylab = "eggpr",
        names.arg = grouped_easter$Easter,
        col = "darkred")

par(mfrow=c(2,3))
barplot(grouped_easter$eggpr,
        main = "eggpr",
        xlab = "Easter",
        ylab = "eggpr",
        names.arg = grouped_easter$Easter,
        col = "darkred")
barplot(grouped_easter$beefpr ,
        main = "beefpr ",
        xlab = "Easter",
        ylab = "beefpr ",
        names.arg = grouped_easter$Easter,
        col = "darkred")
barplot(grouped_easter$porkpr ,
        main = "porkpr ",
        xlab = "Easter",
        ylab = "porkpr ",
        names.arg = grouped_easter$Easter,
        col = "darkred")
barplot(grouped_easter$chickenpr ,
        main = "chickenpr ",
        xlab = "Easter",
        ylab = "chickenpr ",
        names.arg = grouped_easter$Easter,
        col = "darkred")
barplot(grouped_easter$cerealpr,
        main = "cerealpr",
        xlab = "Easter",
        ylab = "cerealpr",
        names.arg = grouped_easter$Easter,
        col = "darkred")



#3

df <- Eggs[,c(1,7:11)]
g <- ggplot(df, aes(Eggs$Week))
g <- g + geom_line(aes(y=Egg.Pr), colour="red")
g <- g + geom_line(aes(y=Beef.Pr), colour="green")
g <- g + geom_line(aes(y=Pork.Pr), colour="yellow")
g <- g + geom_line(aes(y=Cereal.Pr), colour="blue")
g <- g + geom_line(aes(y=Chicken.Pr), colour="purple")
g <- g + geom_line(aes(y=Cereal.Pr), colour="grey")
g + labs(y = "Price")
