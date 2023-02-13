library(gapminder)
library(dplyr)
library(maps)
library(rworldmap)
asia_gdp_capita = gapminder %>%
  filter(year == 2007, continent == "Europe") %>%
  select(country, gdpPercap)
joined_da<-joinCountryData2Map(asia_gdp_capita, joinCode="NAME", nameJoinColumn="country")
colourPalette <- RColorBrewer::brewer.pal(4,'RdPu')
mapCountryData(joined_da,nameColumnToPlot = "gdpPercap", colourPalette="rainbow", mapRegion='europe', addLegend = TRUE, , mapTitle = "gdp per capita 2007")

gdp_data <- data.frame(country = c("China", "India", "Japan", "South Korea", "Indonesia" , "Iran" , "Afghanistan" , "Turkmenistan" , "Pakistan", "Russia" , "Kazakhstan","Mongolia","Uzbekistan","Tajikistan","Kyrgyzstan","North Korea","Nepal","Singapore","Thailand","Vietnam","Bangladesh","Myanmar","Philippines","Cambodia","Sri Lanka","Malaysia","Maldives"),
                       gdppp = c(12556, 2256, 39313, 44116, 3566 , 1449 ,426 , 7422 ,1474,4494,11298,7156,3328,1280,1123,1300,1037,66176,6124,3409,1684,1317,3328,1430,4376,10576,9808))

joined_daa<-joinCountryData2Map(gdp_data, joinCode="NAME", nameJoinColumn="country")

mapBubbles(joined_daa, nameZSize="gdppp", nameZColour="gdppp", colourPalette="rainbow", oceanCol='lightblue', landCol='white', mapRegion='asia', addLegend = FALSE, catMethod = "pretty")
