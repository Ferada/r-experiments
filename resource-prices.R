# data from http://faostat3.fao.org/

resourcePrices <- read.csv("8e0be6b6-2375-44cc-aef4-9789b9e3784e.csv", header = TRUE)

library (ggplot2)

world <- resourcePrices[resourcePrices$ElementName != "Year average" & !is.na(resourcePrices$Value) & resourcePrices$FlagD == "Official data",]
world$Month <- match(world$ElementName, month.name)
world$Date <- as.Date(paste(world$Year, "-", world$Month, "-1", sep = ""), "%Y-%m-%d")

region <- world[world$AreaName == "Germany",]
ggplot(data = region, aes(x = Date, y = Value, group = ItemName, colour = ItemName)) + geom_line()

regions <- world[world$AreaName %in% c("Germany", "United Kingdom", "France", "United States of America") & world$ItemName == "Consumer Prices, General Indices (2000 = 100)",]
ggplot(data = regions, aes(x = Date, y = Value, group = AreaName, colour = AreaName)) + geom_line()
