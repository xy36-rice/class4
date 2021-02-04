# EBIO338/358: Analysis and Visualization of Biological Data
# Class 4: R Essentials Continued

# Topics covered:
    # Strings
    # Missing values
    # Factors
    # Lists
    # Exporting and importing data


# Strings; missing values

# Clear objects in environment
rm(list=ls())

# Build dataframe: 
city <- c("Houston", NA, "New York", "Atlanta", "Seattle")
state <- c("TX", NA, "NY", "GA", "WA")
population <-  c(2.1, NA, 8.2, NA, 6.1)
area <- c(637, NA, 468, 134, 142)
density <- (population/area)*1000000
mydf <- data.frame(city, state, population, area, density, stringsAsFactors = T)
mydf

str(mydf)

# Convert text to upper case or lower case 
toupper(city)
tolower(state)

# Concatenate strings with the function paste()
city_state <- paste(city, state)
city_state

x <- paste(city, "area", area, "sq mi")
x

# Extract text using substr()
substr(city_state, 1, 3)
city_state
nchar(city_state)
substr(city_state, nchar(city_state)-1, nchar(city_state))

# Replace text within a string
gsub(" ", "_", city_state)

# Identify which elements contain specified characters
grep("e", city_state)

# Code in lines 24 - 45 has been applied to individual vectors rather than mydf.
# What happens if it is applied to columns of mydf identified with the $ (e.g., mydf$city)?

is.factor(mydf$city)
levels(mydf$city)
mydf$city <- as.character(mydf$city)


size <- c("extra small", "small", "medium", "large", "extra large")
class(size)
levels(size)

size <- as.factor(size)
class(size)
levels(size)

is.ordered(size)
size <- as.ordered(size)
class(size)

# TO DO: Add a column to mydf that has city names in all capitals followed by a comma and 
# then full state abbreviations in all lower case


# LISTS are "generic vectors" and are another way to store data. (Until now, we have been working with "atomic vectors")
# An element within a list can store any type of R object; elements within a list can store different types of objects

list(city, state)
y <- list(city, state, x, 1:3, (population/area)*1000000, mydf)
y

y[[1]]
y[[1]][2]
y[[6]][3, 2]

str(y)
names(y) <- c("city", "state", "x", "vec", "density", "mydf")
str(y)
y

y$city[2:3]
y$mydf$city

# TO DO 
# A) extract the third element of y 
# B) convert it to upper case 
# C) make this change within y 
# D) add a 7th element of your choice to y


# Exporting data

# We can export dataframe mydf and the list y so that we have a stored file of them

# Use write.table() to export vectors, matrices or dataframes to a file. 
write.table(mydf, "mydf.txt")
# The most common way to export and import data is as a csv file
write.table(mydf, "mydf.csv", sep=",")
# or
write.csv(mydf, "mydf.csv")


# Use save() to export lists to an R data object for later use in R  
save(y, file="Our_Class04_list.RData")


# Now clear all objects from the environment
rm(list=ls())
ls()
# Importing data

# Usually we want to read data directly in from a file. 
# R can read in various file types. *.csv is the most commonly used one. 

temps <- read.csv(file="temperature_data.csv")

# Common errors that thwart read commands
# spaces in file names (e.g., 'animal.density' not 'animal density')
# the number of variable names in row 1 != the number of columns (remember != means ≠)
# blank spaces where values are missing (use "NA"). You can avoid this using "na.strings"' e.g.:
            #  y <- read.csv("FILE_NAME", na.strings=c("","9999","?"))

# Read back in the Rdata object we saved that contained y
load("Our_Class04_list.RData")


# You can also read data straight off the web with a full URL

webdata <- read.table("http://www.bio.ic.ac.uk/research/mjcraw/therbook/data/temperatures.txt", header = TRUE)
webdata

# It's good practice to examine data you read in before beginning to analyze or graph it

dim(temps)  
class(temps)
names(temps)

str(temps)

head(temps) # Shows the first 5 rows
tail(temps) # Shows the last 5 rows

# TO DO: Examine the webdata. How does it compare to temps?
  

  

