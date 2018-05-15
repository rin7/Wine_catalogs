setwd('/Users/tommylee/Desktop/STA 160/')

full = readRDS('FullBoxes.rds')
first_image = rbind(full[[1]])



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

#apply example
# Construct a 5x6 matrix
X <- matrix(rnorm(20), nrow=4, ncol=5)

# Sum is the function, any function that we want to apply to our matrix the values of each column with `apply()`
# 1 is to apply to row, 2 means apply to column, c(1,2) means both row and col
apply(X, 2, sum)

