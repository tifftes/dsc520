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
