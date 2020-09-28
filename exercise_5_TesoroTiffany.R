# Assignment: ASSIGNMENT 5
# Name: Tesoro, Tiffany
# Date: 2020-09-17

## Load the ggplot2 package
library(ggplot2)
theme_set(theme_minimal())

## Set the working directory to the root of your DSC 520 directory
setwd("/Users/tiffanytesoro/Documents/GitHub/520")

## Load the `data/r4ds/heights.csv` to
acs_df <- read.csv("data/acs-14-1yr-s0201.csv")

## 1. What are the elements in your data (including the categories and data types)?

#PRINT COLUMN NAMES
#CATERGORIES: ID, ID2, GEOGRAPHY, POPGROUPID, POPGROUP.DISPLAY.LABEL, RACESREPORTED, HSDEGREE, BACHDEGREE
colnames(acs_df)

#PRINT CLASS FOR EACH CATEGORIES
#REFERRED FROM https://www.guru99.com/r-apply-sapply-tapply.html
lapply(acs_df, class)
#$Id
#[1] "character"
#$Id2
#[1] "integer"
#$Geography
#[1] "character"
#$PopGroupID
#[1] "integer"
#$POPGROUP.display.label
#[1] "character"
#$RacesReported
#[1] "integer"
#$HSDegree
#[1] "numeric"
#$BachDegree
#[1] "numeric"

## 2. Please provide the output from the following functions: str(); nrow(); ncol()

str(acs_df)
## 'data.frame':	136 obs. of  8 variables:
## $ Id                    : chr  "0500000US01073" "0500000US04013" "0500000US04019" "0500000US06001" ...
## $ Id2                   : int  1073 4013 4019 6001 6013 6019 6029 6037 6059 6065 ...
## $ Geography             : chr  "Jefferson County, Alabama" "Maricopa County, Arizona" "Pima County, Arizona" "Alameda County, California" ...
## $ PopGroupID            : int  1 1 1 1 1 1 1 1 1 1 ...
## $ POPGROUP.display.label: chr  "Total population" "Total population" "Total population" "Total population" ...
## $ RacesReported         : int  660793 4087191 1004516 1610921 1111339 965974 874589 10116705 3145515 2329271 ...
## $ HSDegree              : num  89.1 86.8 88 86.9 88.8 73.6 74.5 77.5 84.6 80.6 ...
## $ BachDegree            : num  30.5 30.2 30.8 42.8 39.7 19.7 15.4 30.3 38 20.7 ...
nrow(acs_df)
## [1] 136
ncol(acs_df)
## [1] 8

## 3. Create a Histogram of the HSDegree variable using the ggplot2 package.
ggplot(acs_df, aes(HSDegree)) + geom_histogram()

## a. Set a bin size for the Histogram.
ggplot(acs_df, aes(HSDegree)) + geom_histogram(bins = 10)

## b. Include a Title and appropriate X/Y axis labels on your Histogram Plot.

## Title: HSDegree vs. Count
## X label: HSDegree (Percentage of Population)
## Y Label: Count
ggplot(acs_df, aes(HSDegree)) + geom_histogram(bins = 10) + ggtitle("HSDegree vs. Count") + xlab("HSDegree (Percentage of Population)") + ylab("Count")

## 4. Answer the following questions based on the Histogram produced:
##   a. Based on what you see in this histogram, is the data distribution unimodal?
# When the bin size is 10, the data distribution appears to be unimodal.

##   b. Is it approximately symmetrical?
# The distribution appears to be skewed to the left so it is not approximately symmetrical.

##   c. Is it approximately bell-shaped?
# Since the distribution is skewed, it does not have the bell-shaped distribution.

##   d. Is it approximately normal?
# Since the distribution is skewed, it does not have the normal distribution.

##   e. If not normal, is the distribution skewed? If so, in which direction?
# The distribution appears to be skewed to the left because the tail is on the left which also means the mean is skewed negatively/to the left of the peak.

##   f. Include a normal curve to the Histogram that you plotted.
ggplot(acs_df, aes(x = HSDegree)) + geom_histogram(bins = 10) + stat_function(fun = dnorm, geom = "line") + ggtitle("HSDegree vs. Count") + xlab("HSDegree (Percentage of Population)") + ylab("Count")

## g. Explain whether a normal distribution can accurately be used as a model for this data.
# A normal distribution could not be used as a model for the data because it is slightly skewed to the left.

## 5. Create a Probability Plot of the HSDegree variable.
#REFERENCED FROM http://www.instantr.com/2012/11/28/creating-a-normal-probability-plot/
qqnorm(acs_df$HSDegree)
qqline(acs_df$HSDegree)

## 6. Answer the following questions based on the Probability Plot:
##   a. Based on what you see in this probability plot, is the distribution approximately normal? Explain how you know.
# The distribution appears to be approximately normal because the plots are slightly curved but in general follow the direction of a positively angled line.

## b. If not normal, is the distribution skewed? If so, in which direction? Explain how you know.
# The distribution at the ends are further away from the positive angled line, so it appears to be skewed at the tails.

## 7. Now that you have looked at this data visually for normality, you will now quantify normality with numbers using the stat.desc() function. Include a screen capture of the results produced.
#install.packages ("pastecs")
library (pastecs)
stat.desc(acs_df)

## 8. In several sentences provide an explanation of the result produced for skew, kurtosis, and z-scores. 
## In addition, explain how a change in the sample size may change your explanation?
#Skewness can change the results in that it shows asymmetric tendencies of data. The skew can either be positive or negative which indicate a lack of symmetry.
#Kurtosis shows how pointed the peak of the data distribution. Negative kurtosis indicates a flatter peak and positive indicates a taller peak.
#Z-scores show the distance in standard deviations a point is from the mean.
#Greater sample score can make it easier ti identify outliers and may change all the three results typically making them more accurate.

#REFERENCED FROM https://www.geeksforgeeks.org/skewness-and-kurtosis-in-r-programming/
library(moments) 
print(skewness(acs_df$HSDegree)) 
print(kurtosis(acs_df$HSDegree))  
