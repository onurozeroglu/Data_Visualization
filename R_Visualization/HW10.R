library(grid)
library(lattice)
library(ggplot2)
library(ggplot2movies)
library(dplyr)
library(tidyverse)


data(Investment, package="sandwich")
Investment <- as.data.frame(Investment)

a <- xyplot(RealInv ~ Investment, Investment, pch = 3, type = "b")
b <- xyplot(Interest ~ Investment, Investment, pch = 1, type = "b")
c <- c(a, b, layout = 1:2)

grid.newpage()
pushViewport(viewport(layout = grid.layout(1, 2)))
print(a, vp = viewport(layout.pos.row = 1, layout.pos.col = 1))

grid.segments(x0 = 0.5, y0 = 0.7, x1 = 0.8, y1 = 0.88, default.units = "npc",
              arrow = arrow(angle = 15, type = "closed"), gp = gpar(fill = "black"))

grid.text("The arrow shows the highest point", x = unit(0.2, "npc"), y = unit(0.8, "npc"),
          just = "left", gp = gpar(col = "red", fontsize = 12))

print(b, vp = viewport(layout.pos.row = 1, layout.pos.col = 2))

grid.text("Arrow shows the highest point", x = unit(0.2, "npc"), y = unit(0.8, "npc"),
          just = "left", gp = gpar(col = "red", fontsize = 12))

grid.segments(x0 = 0.4, y0 = 0.7, x1 = 0.8, y1 = 0.85, default.units = "npc",
              arrow = arrow(angle = 20, type = "closed"), gp = gpar(fill = "black"))

pushViewport(viewport(layout = grid.layout(1, 7,
                                           heights = unit(1.25, "in"),
                                           widths = unit(rep(c(1, 1.25), length = 7),
                                                         rep(c("null", "in"),
                                                             length = 7)))))

pushViewport(viewport(layout.pos.col=2, gp=gpar(fill=NA)))
grid.rect(x = 1.5,  # Move the rectangle 1 unit to the right
          y = 1.4,  # Move the rectangle 2 units up
          width = 0.75, 
          height = 0.75,
          gp = gpar(col = "gray", fill = NA))

                 
rating_mean <- mean(top25$rating)
rating_sd <- sd(top25$rating)

top25.bar +
  geom_col() +
  coord_flip() +
  theme(legend.position = "none") +
  # Add annotations to the bars
  annotate("text", x = top25$title, y = top25$rating, label = round(top25$rating, 1), size = 3) +
  annotate("text", x = top25$title, y = rating_mean, label = "mean", size = 3, color = "red") +
  annotate("text", x = top25$title, y = rating_mean + rating_sd, label = "mean + sd", size = 3, color = "red") +
  annotate("text", x = top25$title, y = rating_mean - rating_sd, label = "mean - sd", size = 3, color = "red")    

               