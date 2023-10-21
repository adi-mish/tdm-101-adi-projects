options(jupyter.rich_display = F)
library(data.table)

products <- fread("/anvil/projects/tdm/data/icecream/combined/products.csv")
reviews <- fread("/anvil/projects/tdm/data/icecream/combined/reviews.csv")
titles <- fread("/anvil/projects/tdm/data/movies_and_tv/titles.csv")
episodes <- fread("/anvil/projects/tdm/data/movies_and_tv/episodes.csv")
ratings <- fread("/anvil/projects/tdm/data/movies_and_tv/ratings.csv")

#1a.
head(products$ingredients, n = 1)
#1b.
products1 <- products[grepl("GUAR GUM", products$ingredients),]
sort(products1$rating, decreasing = TRUE)

#2a.
bigDF <- merge(products, reviews, by = c("brand", "key"))

#3a.
StrangerThingsDF <- subset(episodes, show_title_id == "tt4574334")
bigDF <- merge(merge(merge(merge(StrangerThingsDF, titles, by.x = "show_title_id", by.y = "title_id"), 
                                    titles, by.x = "episode_title_id", by.y = "title_id"), 
                                    ratings, by.x = "show_title_id", by.y = "title_id"),
                                    ratings, by.x = "episode_title_id", by.y = "title_id")
tail(bigDF[order(bigDF$rating.y),], 5)

#4a.
bigDF[(bigDF$season_number == 3) & (bigDF$rating.y < 8.5),]
#4b.
subset(bigDF, (season_number == 3) & (rating.y < 8.5))

