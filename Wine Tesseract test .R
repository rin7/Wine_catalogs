getwd()

library(stringr)
full = readRDS('FullBoxes.rds')
first_image = rbind(full[[1]])
head(first_image)
class(full)
class(first_image)
stringr::str_extract_all


#selecting price base on pattern which is common among most pages
pattern <- "[0-9]"
#selectPrice <- str_extract_all(first_image$text, pattern, simplify = TRUE)
selectPriceSub <- first_image[(str_extract_all(first_image$text, pattern, simplify = TRUE)),]
selectPriceSub


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

