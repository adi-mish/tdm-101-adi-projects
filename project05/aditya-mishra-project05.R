options(jupyter.rich_display = F)
myDF <- read.csv("/anvil/projects/tdm/data/election/escaped2020sample.txt", sep="|")
head(myDF$TRANSACTION_DT)
library(lubridate, warn.conflicts = FALSE)
myDF$newdates <- mdy(myDF$TRANSACTION_DT)

#1A.
myDF$TRANSACTION_YR <- year(myDF$newdates)
#1B.
tapply(myDF$TRANSACTION_AMT, myDF$TRANSACTION_YR, sum)
year_sum <- aggregate(list(myDF$TRANSACTION_AMT), list(myDF$TRANSACTION_YR), sum)
print(year_sum)
colnames(year_sum) <- c(year_sum$TRANSACTION_YR, year_sum$TRANSACTION_AMT_CUM)
#1C.
plot(year_sum, xlab = "Transaction years", ylab = "Cumulative transaction amounts")

#2A.
my2020DF <- subset(myDF, TRANSACTION_YR == "2020")
my2020DF$TRANSACTION_MONTH <- month(my2020DF$newdates) 
#2B. 
tapply(my2020DF$TRANSACTION_AMT, my2020DF$TRANSACTION_MONTH, sum)
month_sum <- aggregate(list(my2020DF$TRANSACTION_AMT), list(my2020DF$TRANSACTION_MONTH), sum)
colnames(month_sum) <- c(month_sum$TRANSACTION_AMT, month_sum$TRANSACTION_AMT_CUM)
#2C.
plot(month_sum, xlab = "Transaction months", ylab = "Cumulative transaction amounts")

#3A.
tail(sort(tapply(myDF$TRANSACTION_AMT, myDF$NAME, sum)))
#3B.
tapply(myDF$TRANSACTION_AMT, myDF$STATE, sum)
tail(sort(tapply(myDF$TRANSACTION_AMT, myDF$STATE, sum)), 5)
colnames(myDF)
#3C.
tail(sort(tapply(myDF$TRANSACTION_AMT, myDF$ZIP_CODE, sum)), 10)

#4A.
dotchart(tail(sort(tapply(myDF$TRANSACTION_AMT, myDF$STATE, sum)),5))
#4B.
dotchart(tail(sort(tapply(myDF$TRANSACTION_AMT, myDF$ZIP_CODE, sum)),10))

#5.
print(year_sum)