getwd()

library(stringr)
library(ggplot2)

library(tidyverse)  # data manipulation
library(cluster)    # clustering algorithms
library(factoextra) # clustering visualization
library(dendextend) # for comparing two dendrograms

full = readRDS('FullBoxes.rds')
head(full)
a <- names(full)
for (i in a) {
  first_image_i = (full[[i]])
}
first_image = (full[[17]])
first_image
head(full)
head(first_image)
class(full)
class(first_image)
stringr::str_extract_all

library(tesseract)
##using tesseract 
xml <- ocr("C:/Users/ARIN/Google Drive/DaViS/Quarters/Spring 18/STA 160 - Stat data science project/SampleCatalogPages/UCD_Lehmann_0011.jpg", HOCR = TRUE)
cat(xml)


#selecting price base on pattern which is common among most pages
pattern <- "^[0-9]+[.,]+[0-9]{2}$"   #select only price !!!
pattern2 <- ".+[0-9]+[.,]+[0-9]{2}+."
selectPriceList <- grep(pattern, first_image$text, value = TRUE) #we can use invert to see what it doesnt detect invert = TRUE
selectPriceList <- grep(pattern2, first_image$text, value = TRUE)
#next line doesn't work correctly
#selectPriceSub <- first_image[(str_extract_all(first_image$text, pattern, simplify = TRUE)),]
selectPrice <- first_image[(grep(pattern, first_image$text)),]
dim(selectPrice)
hist(selectPrice$right)
patternB <- "Bottle"
bottleText <- first_image[grep(patternB, first_image$text),]

#plot the historgram for each page digit and price dist and also text height
hist(selectPrice$right)
#calculate the avg height and sd for the price index 
numOfRow <- nrow(selectPrice)
numHeight <- selectPrice$top - selectPrice$bottom
priceHeightAvg <- sum(numHeight)/numOfRow ##calculate the avg height
#bind indeces height value to data frame 
selectPriceHeight <- cbind(selectPrice, numHeight) 
dim(selectPriceHeight)
#histogram of indeces height and also their mean and SD
hist(numHeight)
priceSD <- sd(numHeight)
#filtering indeces (price) base on their height using avg height and SD
priceHeightFilter <- selectPriceHeight[((selectPriceHeight$numHeight < (priceHeightAvg+(3*priceSD))) 
                                        & (selectPriceHeight$numHeight > (priceHeightAvg-(3*priceSD)))),]
dim(priceHeightFilter)
hist(priceHeightFilter$numHeight)


#***********************
#using K-mean clustering
library(dplyr)
set.seed(10)
cluster.df <- cbind(selectPriceHeight$right, selectPriceHeight$numHeight)
priceClustering <- kmeans(cluster.df, 2)

plot(priceHeightFilter, col =(priceClustering$cluster +1) , main="K-Means result with 4 clusters", pch=20, cex=2)

###using hirarchical clustering to test 
# compute divisive hierarchical clustering
hc4 <- diana(selectPrice)

# Divise coefficient; amount of clustering structure found
hc4$dc
## [1] 0.8514345

# plot dendrogram
pltree(hc4, cex = 0.6, hang = -1, main = "Dendrogram of diana")




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

