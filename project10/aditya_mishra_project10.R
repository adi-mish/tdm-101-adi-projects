library(data.table)
options(jupyter.rich_display = F)
orders <- fread("/anvil/projects/tdm/data/restaurant/orders.csv")
vendors <- fread("/anvil/projects/tdm/data/restaurant/vendors.csv")

#1a.
fries_rows <- grepl("Fries", vendors$vendor_tag_name)
vendors_fries <- subset(vendors, fries_rows)
#1b.
fries_df <- grep("Fries", vendors$vendor_tag_name)
vendors_fries2 <- vendors[fries_df, ]
#1c.
dim(vendors_fries)
dim(vendors_fries2)

#2a.
mydf <- table(vendors$delivery_charge)
#2b.
prop.table(mydf) * 100

#3a.
vendors_subset <- subset(vendors, vendor_category_id == 2)
mydf1 <- table(vendors_subset$delivery_charge)
prop.table(mydf1) * 100
#3b.
vendors_subset1 <- subset(vendors, vendor_category_id == 3)
mydf2 <- table(vendors_subset1$delivery_charge)
prop.table(mydf2) * 100

#4a.
tapply(vendors$delivery_charge, vendors$vendor_category_id, table)
#4b.
tapply(vendors$delivery_charge, vendors$vendor_category_id, function(x) {prop.table(table(x)) * 100})

#5a.
sapply(tapply(vendors$delivery_charge, vendors$vendor_category_id, table), function(x){prop.table(x) * 100}, simplify = FALSE)
