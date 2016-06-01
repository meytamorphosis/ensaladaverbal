
### Creating iobjects in R

weight_kg <- 55
weight_kg
2.2 * weight_kg
weight_lb <- 2.2*weight_kg
weight_kg <- 100
weight_lb

### Challenge
mass <- 47.5
age <- 122
age <- age-20
mass <- mass * 2.0
mass_index <- mass/age
mass_index

### Vectors and data types
weight_g <- c(50,60,65,82, 90)
weight_g
animals <- ("mouse", "rat", "dog")

length(weight_g)
length(animals)

class(weight_g)
str(weight_g)
weight_g <- c(30, weight_g)

## ## We’ve seen that atomic vectors can be of type character, numeric, integer, and
## ## logical. But what happens if we try to mix these types in a single
## ## vector?
## 
## ## What will happen in each of these examples? (hint: use `class()` to
## ## check the data type of your object)
num_char <- c(1, 2, 3, 'a')
num_logical <- c(1, 2, 3, TRUE)
char_logical <- c('a', 'b', 'c', TRUE)
tricky <- c(1, 2, 3, '4')
class(num_char)

## 
## ## Why do you think it happens?
## 
## ## Can you draw a diagram that represents the hierarchy of the data
## ## types?

### Subsetting
animals <- c("mouse", "rat","dog","cat")
animals[2]
animals[c(3,2)]
animals[c(1,2,3,2,1,4)]

weight_g <- c(21,34,39,54,50)
weight_g[c(TRUE,FALSE,TRUE,FALSE,FALSE)]
weight_g >50
weight_g[weight_g >=50]

# OR:|
weight_g[weight_g<30|weight_g>=50]
# AND: &
weight_g[weight_g > 30 & weight_g ==21]
# NOT: !
weight_g[! (weight_g>30&weight_g==21)]

animals[animals=="rat" | animals=="cat"]
animals[animals%in% c("rat","cat","duck")]


 #Can u figure out why `"four" > "five"` returns `TRUE`?
"four">"five"
#because it uses alphabetical order

###Missing data
planets <- c("Mercury","Venus","Earth","mars","Jupiter","Saturn", "Uranus", "Neptune", NA)

heights <- c(2,4,4,NA,6)
mean(heights)
mean(heights,na.rm=TRUE)
mean (heights, na.rm=TRUE)
max(heights)
max(heights,na.rm=TRUE)
#na.omits(heights) omite los NA
#o sea
mean(na.omit(heights))

heights [!is.na(heights)]

###Challenge
#Why does the following piece of code give an error message?
vec <- c(2,4,4,"NA",6)
mean(vec,na.rm=TRUE)
##Why does the error message say the argument is not numeric?
##Because "NA" is a character not a number. Cannot get mean from characters.

### Presentation of the survey data
## download.file("https://ndownloader.figshare.com/files/2292169",
##               "data/portal_data_joined.csv")

surveys <- read.csv(file="data/portal_data_joined.csv")
head (surveys)
tail(surveys)

## Challenge
## Based on the output of `str(surveys)`, can you answer the following questions?
## * What is the class of the object `surveys`? It's a data frame
## * How many rows and how many columns are in this object? 34786; 13
## * How many species have been recorded during these surveys? 48
row(surveys)


### Factors
sex <- factor(c("male", "female", "female", "male"))
levels(sex)
nlevels(sex)

food <- factor(c("low", "high", "medium", "high", "low", "medium", "high"))
levels(food)
food <- factor(food, levels=c("low", "medium", "high"))
levels(food)
min(food) ## doesn't work
food <- factor(food, levels=c("low", "medium", "high"), ordered=TRUE)
levels(food)
min(food) ## works!

f <- factor(c(1, 5, 10, 2))
as.numeric(f)               ## wrong! and there is no warning...
as.numeric(as.character(f)) ## works...
as.numeric(levels(f))[f]    ## The recommended way.

## Challenge
##
## * In which order are the treatments listed? levels(exprmt)
##
## * How can you recreate this plot with "control" listed
## last instead of first?
exprmt <- factor(c("treat1", "treat2", "treat1", "treat3", "treat1", "control", "treat1", "treat2", "treat3"))
table(exprmt)
barplot(table(exprmt))

exprmt <- factor(exprmt, levels=c("treat1", "treat2","treat3", "control"))
table(exprmt)
barplot(table(exprmt))

## The data.frame class
## Compare the output of these examples, and compare the difference between when
## the data are being read as `character`, and when they are being read as
## `factor`.
example_data <- data.frame(animal=c("dog", "cat", "sea cucumber", "sea urchin"),
                           feel=c("furry", "furry", "squishy", "spiny"),
                           weight=c(45, 8, 1.1, 0.8))
str(example_data)
example_data <- data.frame(animal=c("dog", "cat", "sea cucumber", "sea urchin"),
                           feel=c("furry", "furry", "squishy", "spiny"),
                           weight=c(45, 8, 1.1, 0.8), stringsAsFactors=FALSE)
str(example_data)
## ## Challenge
## ##  There are a few mistakes in this hand crafted `data.frame`,
## ##  can you spot and fix them? Don't hesitate to experiment!
author_book <- data.frame(author_first=c("Charles", "Ernst", "Theodosius"), 
                          author_last=c("Darwin", "Mayr", "Dobzhansky"),
                          year=c(NA,1942, 1970))

## ## Challenge:
## ##   Can you predict the class for each of the columns in the following
## ##   example?
## ##   Check your guesses using `str(country_climate)`:
## ##   * Are they what you expected? Why? why not?
## ##   * What would have been different if we had added `stringsAsFactors = FALSE`
## ##     to this call? ---
## ##   * What would you need to change to ensure that each column had the
## ##     accurate data type?
country_climate <- data.frame(country=c("Canada", "Panama", "South Africa", "Australia"),
                                climate=c("cold", "hot", "temperate", "hot/temperate"),
                               temperature=c(10, 30, 18, 15),
                               northern_hemisphere=c(TRUE, TRUE, FALSE, FALSE),
                               has_kangaroo=c(FALSE, FALSE, FALSE, TRUE))
stringAsFactors=FALSE

## Sequences and Subsetting data frames

### 1. The function `nrow()` on a `data.frame` returns the number of
### rows. Use it, in conjuction with `seq()` to create a new
### `data.frame` called `surveys_by_10` that includes every 10th row
### of the survey data frame starting at row 10 (10, 20, 30, ...)
###
### 2. Create a data.frame containing only the observation from 1999 of the -->
### surveys dataset.





