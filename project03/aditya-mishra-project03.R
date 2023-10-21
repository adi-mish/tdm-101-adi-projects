#Q1
myDF <- read.csv("/anvil/projects/tdm/data/craigslist/vehicles.csv")
dim(myDF)
str(myDF)
summary(myDF)

#Q2
sum(is.na(myDF$year))
sum(is.na(myDF$year)) / dim(myDF)[1] * 100
goodyearsDF <- subset(myDF, !is.na(myDF$year))
dim(goodyearsDF)
#Q2B.
head(goodyearsDF)
missingyearsDF <- subset(myDF, is.na(myDF$year))
dim(missingyearsDF)
#Q2C.
head(missingyearsDF)

#Q3.
year_meanDF <- aggregate(price ~ year, data = myDF, FUN = mean)
#Q3A.
year_meanDF <- aggregate(price ~ year, data = myDF, FUN = mean)
table(myDF$year)
which.max(table(myDF$year))

#Q4.
tail((sort(table(myDF$region_url))), 1)
tail((sort(table(myDF$state))), 3)

#Q5.
years <- subset(aggregate(price ~ year, data = myDF, FUN = mean))$year
prices <- subset(aggregate(price ~ year, data = myDF, FUN = mean))$price
plot(years, prices)
plot(years[prices<1500000], prices[prices<1500000])
plot(years[prices<100000], prices[prices<100000])