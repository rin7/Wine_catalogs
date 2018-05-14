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