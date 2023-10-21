#Q1.
myDF <- read.csv("/anvil/projects/tdm/data/craigslist/vehicles.csv", stringsAsFactors = TRUE)
str(myDF)
tail(sort(table(myDF$state)), 5)
table(myDF$price >= 2000)
mean(myDF$price)

#Q2.
myDF$mileage_category <- cut(myDF$odometer, breaks = c(0,50000,100000,150000,Inf) , labels = c("Low","Moderate","High","Very High"))
myDF$has_VIN <- (is.na(myDF$VIN) | is.null(myDF$VIN))
myDF$description_length <- cut(nchar(as.character(myDF$description)), breaks = c(0,50,100,200,500,Inf) , labels = c("Very Short","Short","Medium","Long","Very Long"))

#Q3.
table(myDF$mileage_category)
table(myDF$has_VIN)
table(myDF$description_length)

#Q4.
myTexasDF <- subset(myDF, state == "tx")
tail(sort(table(myDF$state)))
popularStateDF <- subset(myDF, state == "ca")
myFavoriteDF <- subset(myDF, state == "in")

#Q5.
options(jupyter.rich_display = T)
myTexasDF <- subset(myDF, state == "tx" & !is.na(lat) & !is.na(long))
library(leaflet)
library(sf)
points <- st_as_sf(myTexasDF, coords = c("long","lat"), crs = 4326)
addCircleMarkers(addTiles(leaflet(myTexasDF)), radius = 0.5)
popularStateDF <- subset(myDF, state == "ca" & !is.na(lat) & !is.na(long))
points1 <- st_as_sf(popularStateDF, coords = c("long","lat"), crs = 4326)
addCircleMarkers(addTiles(leaflet(popularStateDF)), radius = 0.5)
myFavoriteDF <- subset(myDF, state == "in" & !is.na(lat) & !is.na(long))
points2 <- st_as_sf(myFavoriteDF, coords = c("long","lat"), crs = 4326)
addCircleMarkers(addTiles(leaflet(myFavoriteDF)), radius = 0.5)