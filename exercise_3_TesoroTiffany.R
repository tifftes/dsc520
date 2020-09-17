# Assignment: EXERCISE 3
# Name: Tesoro, Tiffany
# Date: 2020-09-10

## WORK FROM EXERCISE 2 TO SET UP DATA; SCROLL DOWN FOR EXERCISE 3
## Check your current working directory using `getwd()`
getwd()

## List the contents of the working directory with the `dir()` function
dir()

## If the current directory does not contain the `data` directory, set the
## working directory to project root folder (the folder should contain the `data` directory
## Use `setwd()` if needed
setwd("/Users/tiffanytesoro/Documents/GitHub/520")

## Import the Scores.csv dataset that has been provided for you
## Setting 'stringAsFactors' to 'FALSE' inverses factor interpretation
class_scores <- read.csv("data/scores.csv", stringsAsFactors = FALSE)
str(class_scores)

## Read the file `data/scores.csv` to `scores_df`
## Display summary statistics using the `summary()` function
scores_df <- read.csv("data/scores.csv")
summary(scores_df)

## Import the `jsonlite` library
library(jsonlite)

## Convert the scores_df dataframe to JSON using the `toJSON()` function
toJSON(scores_df)

## Convert the scores dataframe to JSON using the `toJSON()` function with the `pretty=TRUE` option
toJSON(scores_df, pretty=TRUE)

## EXERCISE 3 QUESTIONS AND RESPONSES
## Use the appropriate R functions to answer the following questions:
## 1. What are the observational units in this study?
colnames(scores_df)

##   2. Identify the variables mentioned in the narrative paragraph and determine which are 
## categorical and quantitative?
class(scores_df$Score)
class(scores_df$Section)

##   3. Create one variable to hold a subset of your data set that contains only the Regular 
## Section and one variable for the Sports Section.
regular_class <- subset(scores_df, Section == "Regular")
sports_class <- subset(scores_df, Section == "Sports")

## 4. Use the Plot function to plot each Sections scores and the number of students achieving 
## that score. Use additional Plot Arguments to label the graph and give each axis an appropriate label.
with(
  regular_class, 
  plot(Count, Score, main = "with(regular_class, plot(Count, Score))")
)
with(
  sports_class, 
  plot(Count, Score, main = "with(sports_class, plot(Count, Score))")
)
## Alternative plot function code I found formatted a little different than above
plot(x = regular_class$Count , y = regular_class$Score, type = 'p', main = "with(regular_class, plot(Count, Score))")
plot(x = sports_class$Count , y = sports_class$Score, type = 'p', main = "with(sports_class, plot(Count, Score))")

## Once you have produced your Plots answer the following questions:
##   a. Comparing and contrasting the point distributions between the two section, looking at both 
## tendency and consistency: Can you say that one section tended to score more points than the other? 
## Justify and explain your answer.

## 4a. Based on the plots, the y-axis has different labels with regular_class scores
## ranging from a little below 280 to 380 and sports_class scores ranging from 200 to 400.
## The plots alone show that 4 scores are less than or equal to 300 in both classes.
## Counting the plots above 300 there are 13 for regular_class and 12 for sports_class.
## It is difficult to tell based on counting the points alone whether one section
## tended to score more points than the other so I used functions to compare.
## The highest score appears to be from sports_class which is confirmed through
max(regular_class$Score)
max(sports_class$Score)
max(regular_class$Score) > max(sports_class$Score)
## The lowest score is also from sports_class
min(regular_class$Score)
min(sports_class$Score)
min(regular_class$Score) > min(sports_class$Score)
## However, the mean and median for regular_class scores were higher which is 
## a better way to see which section scored higher. By looking at these numbers,
## it appears that even though a student received the highest score in the sports_class
## based on mean and median the regular_class scored more points overall.
mean(regular_class$Score)
mean(sports_class$Score)
mean(regular_class$Score) > mean(sports_class$Score)
median(regular_class$Score)
median(sports_class$Score)
median(regular_class$Score) > median(sports_class$Score)

## b. Did every student in one section score more points than every student in the other section? 
## If not, explain what a statistical tendency means in this context.
regular_class$Score >= sports_class$Score
regular_class$Score <= sports_class$Score
## Looking at the data frame of each section, I can see that not every student in one section
## scored more points than every student the other section. For that reason, 
## statistical tendency helps me get a better idea of which section did better overall
## through comparing mean and median. The mean provides the average and the median
## provides the middle most number in case of outliers that pull the average a litte
## bit higher. 

## c. What could be one additional variable that was not mentioned in the narrative that could be 
## influencing the point distributions between the two sections?

## 4c. Attendance might be an unmentioned variable that could influence the point distribution 
## between the two sections. Another could be the time of the class or mode of learning
## (if offered both in person and/or online).
  
