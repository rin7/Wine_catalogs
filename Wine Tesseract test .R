getwd()

library(stringr)
library(ggplot2)
full = readRDS('FullBoxes.rds')
first_image = rbind(full[[1]])
head(full)
head(first_image)
class(full)
class(first_image)
stringr::str_extract_all


#selecting price base on pattern which is common among most pages
pattern <- "^\\d+\\.\\d{1,2}$"   #problem !!!
selectPrice <- grep(pattern, first_image$text, value = TRUE)
#doesn't work
#selectPriceSub <- first_image[(str_extract_all(first_image$text, pattern, simplify = TRUE)),]
selectPrice <- first_image[(grep(pattern, first_image$text)),]
dim(selectPrice)
class(selectPrice)

#plot the historgram for each page digit and price dist and also text height
hist(selectPrice$right)
#calculate the avg height and sd for the price index 
numOfRow <- nrow(selectPrice)
numHeight <- selectPrice$top - selectPrice$bottom
priceHeightAvg <- sum(numHeight)/numOfRow
#bind indeces height value to data frame 
selectPriceHeight <- cbind(selectPrice, numHeight) 
#histogram of indeces height and also their mean and SD
hist(numHeight)
priceSD <- sd(numHeight)
#filtering indeces (price) base on their height using avg height and SD
priceHeightFilter <- selectPriceHeight[((selectPriceHeight$numHeight < (priceHeightAvg+(3*priceSD))) 
                                        & (selectPriceHeight$numHeight > (priceHeightAvg-(3*priceSD)))),]
dim(priceHeightFilter)
hist(priceHeightFilter$numHeight)

#
index_left = c()
index_right = c()
d = 1
b = nrow(first_image)
for (i in  1:b){
  if (first_image$text[i] == "Bottle"){
    index_left[d] = c(first_image$left[i])
    index_right[d] = c(first_image$right[i])
    d = d + 1
  }
}
dim(first_image)
y = apply(first_image$left, sum)


#apply example
# Construct a 5x6 matrix
X <- matrix(rnorm(20), nrow=4, ncol=5)

# Sum is the function, any function that we want to apply to our matrix the values of each column with `apply()`
# 1 is to apply to row, 2 means apply to column, c(1,2) means both row and col
apply(X, 2, sum)

#lapply to work with list
# Create a list of matrices
MyList <- list(A,B,C)

# Extract the 2nd column from `MyList` with the selection operator `[` with `lapply()`
lapply(MyList,"[", , 2)

# Extract the 1st row from `MyList`
lapply(MyList,"[", 1, )

