# EBIO 338/538 Class 04 R Essentials Practice Exercises

#1 Clear all objects
rm(list = ls())
#2 Import the file with Daphnia data and name it daphnia
daphnia <- read.csv("class4_pHDaphnia.csv")
#3 Examine the new data
# a) How many rows does it have? 
dim(daphnia)[1]
# b) How many columns does it have? 
dim(daphnia)[2]
# c) What are its dimensions
dim(daphnia)
# d) Is it a data frame?
is.data.frame(daphnia)
# e) How many types of Daphnia are there?
length(levels(as.factor(daphnia$Daphnia)))
# f) What are the different Detergents?
levels(as.factor(daphnia$Detergent))
# g) What is the range of pH values in the dataset?
range(daphnia$pH)
# h) What is the mean pH value?
mean(daphnia$pH)
# i) What is the maximum growth rate?
max(daphnia$Growth.rate)
# j) Extract the row with the maximum growth rate
maxgr <- max(daphnia$Growth.rate)
daphnia[daphnia$Growth.rate == maxgr,]
# k) Subset the observations in Tyne water
subTyne <- daphnia[daphnia$Water == "Tyne",]
# l) What are the dimensions of the subset from #k?
dim(subTyne)
# m) Create a new factored vector called new_vec that contains Water and Detergent information separated by and underscore _
new_vec <- paste(daphnia$Water, daphnia$Detergent, sep = "_")
# n) How many different unique combinations does new_vec contain?
length(unique(new_vec))
# o) Convert all uppercase letters in daphnia to lowercase
daphnia[] <- lapply(daphnia, tolower)
names(daphnia) <- tolower(names(daphnia))
# p) Remove "brand" from all rows of Detergent
daphnia$detergent <- substr(daphnia$detergent, 6, 6)
