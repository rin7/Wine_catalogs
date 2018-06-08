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
first_image = (full[[1]])

head(full)
head(first_image)
class(full)
class(first_image)
stringr::str_extract_all

library(tesseract)
##using tesseractto read and extract data into xml - but r tesseract is better but couldnt isntal in windows
xml <- ocr("C:/Users/ARIN/Google Drive/DaViS/Quarters/Spring 18/STA 160 - Stat data science project/SampleCatalogPages/UCD_Lehmann_0011.jpg", HOCR = TRUE)
cat(xml)


#selecting price base on pattern which is common among most pages
pattern <- "^[.]|[0-9]+[.,]+[0-9]{2}$"   #select only price !!!

selectPriceList <- grep(pattern, first_image$text, value = TRUE) #we can use invert to see what it doesnt detect invert = TRUE

selectPriceList2 <- grep(pattern2, first_image$text, value = TRUE)
#next line doesn't work correctly
#selectPriceSub <- first_image[(str_extract_all(first_image$text, pattern, simplify = TRUE)),]
selectPrice <- first_image[(grep(pattern, first_image$text)),]
for ( i in nrow(selectPrice){
  if selectPrice$left[i] == selectPrice$left[i+1]
}
#type of our dataframe
sapply(selectPrice, typeof)
str(selectPrice)
selectPrice$text<- as.double(selectPrice$text)
sapply(selectPrice, )
dim(selectPrice)
hist(selectPrice$right)
patternB <- "Bottle"
bottleText <- first_image[grep(patternB, first_image$text),]

#plot the historgram for each page digit and price dist and also text height
hist(selectPrice$right)
#calculate the avg height and sd for the price index 
numOfRow <- nrow(selectPrice)
numHeight <- selectPrice$top - selectPrice$bottom
width <- selectPrice$right - selectPrice$left
widthAvg <- sum(width)/numOfRow
charWidth <- widthAvg/3.5
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
set.seed(10) # every time it randomly point, so we set seed zero, so everytime get a same result
cluster.df <- cbind(priceHeightFilter$right)
sort(selectPrice$right)
priceClustering <- kmeans(cluster.df, 4)

clusteringPriceDf <- cbind(priceHeightFilter, priceClustering$cluster)
a <- clusteringPriceDf[(sort(clusteringPriceDf$'priceClustering$cluster')),]

plot(priceHeightFilter, col =(priceClustering$cluster +1) , main="K-Means result with 4 clusters", pch=20, cex=2)
hist(clusteringPriceDf)
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


