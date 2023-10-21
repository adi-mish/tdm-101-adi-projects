options(jupyter.rich_display = F)
library(data.table)
products <- fread("/anvil/projects/tdm/data/icecream/combined/products.csv")
reviews <- fread("/anvil/projects/tdm/data/icecream/combined/reviews.csv")

#1
getingredients <- function(x) {
    unique(trimws(unlist(strsplit(x, ",|\\(|\\)"))))
}
getingredients(products$ingredients[3])
tail(sort(table(unlist(sapply(products$ingredients, getingredients), use.names = FALSE))), 11)
barplot(table(unlist(sapply(products$ingredients, getingredients), use.names = FALSE)))
x = products$name
y = products$rating
plot(table(products$rating), type = "b", frame = FALSE, pch = 19)

#2
products_reviews_by_rating <- function(products_df, reviews_df, myrating) {
    merge_results <- merge(products_df, reviews_df, by="key")
    products_reviews_results <- merge_results[merge_results$rating >= myrating, ]
    return(products_reviews_results)
}

#3
#define function which takes 3 arguments - "products_df", "reviews_df", "myrating"
products_reviews_by_rating <- function(products_df, reviews_df, myrating) { 
    #merge the dataframes "products_df" and "reviews_df" by the column "key" to create a new dataframe "merge_results"
    merge_results <- merge(products_df, reviews_df, by="key")
    #filter "merge_results" to select rows where the "rating" column is greater than or equal to the provided "myrating" parameter and create a new dataframe "products_reviews_results"
    products_reviews_results <- merge_results[merge_results$rating >= myrating, ]
    #returns the newly created dataframe "products_reviews_results"
    return(products_reviews_results)
}

#4
my_selection <- products_reviews_by_rating(products, reviews, 4.5)
str(my_selection)

#5
products_with_ingredient <- function(ingredient) {
    contains_ingredient <- grepl(ingredient, products$ingredients)
    num <- sum(contains_ingredient)
    return(num)
}
products_with_ingredient("SALT")

