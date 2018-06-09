truth <- read.csv("C:/Users/ARIN/Google Drive/DaViS/Quarters/Spring 18/STA 160 - Stat data science project/project/training set/df_0069t.csv")
sample <- read.csv("C:/Users/ARIN/Google Drive/DaViS/Quarters/Spring 18/STA 160 - Stat data science project/project/training set/df_0069.csv")

#convert the column of name to charachter type
truth[, 2] <- sapply(truth[, 2], as.character)
sample[, 2] <- sapply(sample[, 2], as.character)

accuracy <- adist(truth, sample, ignore.case = F, counts = T, fixed = T)
diag(accuracy)

bottlePrice <- mapply(adist, truth$name, sample$name)

class(accuracy)
dim(accuracy)

sapply(truth, class)
nrow(sample)


## Cf. the examples for agrep:
adist("lasy", "1 lazy 2")
## For a "partial approximate match" (as used for agrep):
adist("lasy", "1 lazy 2", partial = TRUE)


