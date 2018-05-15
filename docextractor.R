setwd("C:/Users/ARIN/Google Drive/DaViS/Quarters/Spring 18/STA 160 - Stat data science project/SampleCatalogPages/Abbyy_output_pdf")

library(dplyr)
library(tidyr)
library(purrr)
library(readr)

help(docxtractor)
??docxtractor

##read all file from existing folder
read_folder <- function(infolder) {
  data_frame(file = dir(infolder, full.names = TRUE)) %>%
    mutate(text = map(file, read_lines)) %>%
    transmute(id = basename(file), text) %>%
    unnest(text)
}
read_folder("C:/Users/ARIN/Google Drive/DaViS/Quarters/Spring 18/STA 160 - Stat data science project/SampleCatalogPages/Abbyy_output_pdf")

