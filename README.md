# dsgettingandcleaning
This repository is created for the DS course Getting and Cleaning Data

## What's in this repo

1. Raw data downloaded from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  
2. run_analysis.R script that has helper functions to read, filter and write tidy data out. 
3. Tidy data after applying the cleanup roles as described in the assignment.

## How data is organized

1. Raw data is under the raw_data directory
2. run_analysis.R is in the top level directory 
3. tidy_data contains the tidy data in output.csv

## How data was cleaned up

The CodeBook.Rmd has detailed steps taken to clean up the data. The generated CodeBook.html file is also included. 

## How to run the run_analysis.R script

1. git clone the repository
2. Copy the run_analyis.R to the raw_data directory
3. Open RStudio.app or R.app
4. source("/path_to/run_analysis.R")
4. allData <- filterData(getMergedData())
5. writeData(allData)
