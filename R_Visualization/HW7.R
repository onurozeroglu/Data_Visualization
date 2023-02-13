library(ggplot2)
library(dplyr)
#View(economics)
#Task 1 
qplot(pop, unemploy, data=economics, colour = date , xlab =  "Population" , ylab = "Unemployed polulation")
qplot(pop, psavert, data=economics, colour = date , xlab =  "Population" , ylab = "Personal savings rate" )

#Task 2
econ.point <- ggplot(economics)
lmcoef <- coef(lm(psavert ~ date, economics))
econ.point + geom_point( aes(x = date, y = psavert) ) +
  geom_abline(intercept = lmcoef[1], slope = lmcoef[2] ) + xlab("Years") + ylab("Personal savings rate")


econ.unemp <- ggplot(economics)
lmcoef <- coef(lm(pce ~ pop, economics))
econ.unemp + geom_point(aes(x = pop, y = pce), colour = "brown") +
  geom_abline(intercept = lmcoef[1], slope = lmcoef[2]) + xlab("Population") + ylab("personal consumption expenditures")


econ.hist <- ggplot(economics, aes(uempmed))
econ.hist + geom_histogram(color = "blue", fill = "black") + xlab("Median duration of unemployment") + ylab("Total number")

#task 3
econ.filtered <- economics %>%
  filter(psavert > 6, pop > 300000) %>%
  arrange(desc(pce)) %>%
  head(10)

ggplot(econ.filtered, aes(x = pce, y = pop, size = psavert , label = date), guide = FALSE) +
  geom_point(colour = "yellow",
             fill = "brown",
             shape = 21) + scale_size_area(max_size = 16) +
  scale_x_continuous() +
  scale_y_continuous() + 
  geom_text(size = 3) + 
  xlab("personal consumption expenditures") + 
  ylab("Total population")
  theme_bw()

  