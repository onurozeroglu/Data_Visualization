library(ggplot2)
library(ggplot2movies)
library(dplyr)
library(tidyverse)
?movies
View(movies)
movies

# top 25 movies
top25 <- movies %>%
  arrange(desc(rating)) %>%
  head(25) %>%
  mutate(title = fct_reorder(title, rating))

top25.bar <- ggplot(top25, aes(title, rating, fill = title))
top25.bar +
  geom_col() +
  coord_flip() +
  theme(legend.position = "none")

#lenght of movies
gmovies.hist <- ggplot(data = movies, aes(length))
gmovies.hist + geom_histogram(color = "white", fill = "black") +
  scale_x_continuous(limits = c(0, 200)) + xlab("The lenght of the movie") + ylab("Number of movies")

# facet wrap of movies after 1960
genres <- movies %>%
  gather(Action, Animation, Comedy, Drama, Documentary, Romance, Short,
         key = "genre",
         value = "grades")


genres.br <- genres %>%
  filter(year >= 1960)
movies.br <- ggplot(genres.br, aes(year))
movies.br + geom_bar(aes(fill = genre)) +
  theme(axis.text.x = element_text(angle = 90, hjust = 1)) +
  facet_wrap( ~ genre) + xlab("Year") + ylab("Number of movies")

