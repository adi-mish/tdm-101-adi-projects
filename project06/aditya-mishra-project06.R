myDF <- read.csv("/anvil/projects/tdm/data/olympics/athlete_events.csv", stringsAsFactors=TRUE)
options(jupyter.rich_display = F)
str(myDF)

#1A.
table(myDF$Games)
#1B.
DF1980 <- myDF[myDF$Year == 1980,]
unique(DF1980$NOC)
#1C.
duplicated_athletes <- unique(myDF$Name[duplicated(myDF$Name)])
mynewDF <- subset(myDF, Name %in% duplicated_athletes)

#2A.
tapply(myDF$Age, myDF$NOC, mean, na.rm=TRUE)
#2B.
tail(sort(tapply(myDF$Height, myDF$Sport, max, na.rm=TRUE)), 5)

myDF <- read.csv("/anvil/projects/tdm/data/death_records/DeathRecords.csv", stringsAsFactors = TRUE)

#3A.
str(myDF)
#3B.
month_order <- c("January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December")
myDF$MonthOfDeath <- factor(myDF$MonthOfDeath)
levels(myDF$MonthOfDeath) <- month_order
#3C.
table(myDF$MonthOfDeath)

#4A.
sort(tapply(myDF$Age, myDF$Race, mean), decreasing = TRUE)
#4B.
tapply(myDF$Age[myDF$Sex == "F"], myDF$Race[myDF$Sex == "F"], mean)
tapply(myDF$Age[myDF$Sex == "M"], myDF$Race[myDF$Sex == "M"], mean)

#5A.
myDF <- read.csv("/anvil/projects/tdm/data/olympics/athlete_events.csv", stringsAsFactors=TRUE)
plot(tapply(myDF$Height, myDF$Weight, mean), xlab = "Weight", ylab = "Mean height according to weight")
#5B.
dotchart(tapply(myDF$Age[myDF$Sex == "M"], myDF$Race[myDF$Sex == "M"], mean), xlab = "Age in years", ylab = "Race code")
dotchart(tapply(myDF$Age[myDF$Sex == "F"], myDF$Race[myDF$Sex == "F"], mean), xlab = "Age in years", ylab = "Race code")
