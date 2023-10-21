#2C. In R

system("hostname", intern=TRUE)

#4B. In R

mem <- 256000 #Memory in Anvil subcluster A in GB
gb_to_b <- 1000000000 #Conversion factor from GB to Bytes
gb_to_tb <- 1000 #Conversion factor from GB to TB

memb <- mem * gb_to_b
memtb <- mem / gb_to_tb

print(paste("The memory of Anvil subcluster A is", memb, "bytes."))
print(paste("The memory of Anvil subcluster A is", memtb, "terabytes."))

#5.

dat <- read.csv("/anvil/projects/tdm/data/disney/flight_of_passage.csv")
head(dat)

flight_of_passage <- dat

rm(dat)

head(flight_of_passage)