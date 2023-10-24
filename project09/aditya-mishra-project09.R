    benfords_law <- function(d) log10(1+1/d)

#1a.
digits <-1:9
bf_val<-benfords_law(digits)
plot(digits, bf_val, xlab = "digits", ylab="probabilities", main="Benfords Law Plot Line")

#2a.
first_digit <- function(num) {
    num <- abs(num)
    if (num != 0) {
        while(num >= 10) {
            num <- num/10
        }
        while(num < 1) {
            num <- num*10
        }
        num <- floor(num)
    }
    return (num)
}

#3a.
library(data.table)
myDF <- fread("/anvil/projects/tdm/data/restaurant/orders.csv")
#3b.
myDF$fd_grand_total <- sapply(myDF$grand_total, first_digit)

#4a.
table(myDF$fd_grand_total)
#4b.
plot(table(myDF$fd_grand_total))

#5a.
find_orders_by_dates <- function (start_date, end_date) {
    orders_by_dates <- subset(myDF, ((myDF$delivery_date >= start_date) & (myDF$delivery_date <= end_date)))
    return(orders_by_dates)
}
#5b.
testDF <- find_orders_by_dates("2019-07-31", "2019-08-01")
head(testDF)