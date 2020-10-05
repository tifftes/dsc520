# Assignment: ASSIGNMENT 9
# Name: Tesoro, Tiffany
# Date: 2020-10-04

## Set the working directory to the root of your DSC 520 directory
setwd("/Users/tiffanytesoro/Documents/GitHub/520")

## Load the `data/student-survey.csv` to
survey_df <- read.csv("data/student-survey.csv")

## Install packages for correlation analysis in R
install.packages("Hmisc"); install.packages("ggm"); 
install.packages("ggplot2"); install.packages("polycor")

## Load packages for correlation analysis in R
library(book); library(ggm); library(ggplot2);
library(Hmisc); library(polycor)

## r covariance
cov(survey_df[])

## calculates correlation for all dataframe
cor(survey_df, use = "complete.obs", method = "pearson")

## r pair correlation
cor.test(survey_df$TimeReading, survey_df$Happiness, method = "pearson")

## r pair negative correlation 
cor.test(survey_df$TimeReading, survey_df$Happiness, alternative = "less", method = "pearson")

## r confidence interval 99% correlation
cor.test(survey_df$TimeReading, survey_df$Happiness, alternative = "less", method = "pearson", conf.level = 0.99)

## r coefficient of determination
TimeTV.lm = lm(TimeTV ~ Happiness, data=survey_df)
summary(TimeTV.lm)$r.squared 

## r correlation coefficient
TimeTV = survey_df$TimeTV  
Happiness = survey_df$Happiness    
cor(TimeTV, Happiness) 

## r partial correlation - control TimeReading
pcor(c("Happiness", "TimeTV", "TimeReading"), var(survey_df))

## r partial correlation - control Gender
pcor(c("Happiness", "TimeTV", "Gender"), var(survey_df))

## r partial correlation - control TimeTV
pcor(c("Happiness", "TimeReading", "TimeTV"), var(survey_df))