#Q1
myDF <- read.csv("/anvil/projects/tdm/data/flights/subset/1995.csv")
dim(myDF)
str(myDF)

#Q2
myairports <- myDF$Origin
head(myairports)
class(myairports)
head(myairports, 250)
myairports250 <- head(myairports, 250)
table(myairports250)

#Q3
summary(myDF$Origin[myDF$Origin == "IND"])
summary(myDF$Dest[myDF$Dest == "IND"])
myDF[894,]$Origin
myDF[894,]$Dest
str(myDF$Distance[myDF$Distance < 200])

#Q4
sort(table(myDF$UniqueCarrier))
tail(sort(table(myDF$TailNum)), 11)

#Q5
hist(myDF$Dist, main = "Histogram of Flight Distances (in miles)", xlab = "Flight Distance(in miles)", ylab = "Number of Flights", col = "lightgreen")