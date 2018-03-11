# Getting_and_cleaning_data
Repo contains Coursera project on course Getting and Cleaning Data.

Data analysis is based on dataset downloaded from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

One of the most exciting areas in all of data science right now is wearable computing. Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users.

In this project, data collected from the accelerometer and gyroscope of the Samsung Galaxy S smartphone was retrieved, worked with, and cleaned, to prepare a tidy data that can be used for later analysis.

# Elements of project

Project contains four files:
- README.md - file with project desciption
- run_analysis.R - R code with full activities required to get tidy data
- CodeBook.md - list and decription of variables
- tidy_data.txt - output of run_analysis.R, cleaned and transfomed data.

# Study design

Below desciptions could be helpful to understand of study designing:

>One of the most exciting areas in all of data science right now is wearable computing - see for example this article. Companies like >Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users.

>In this project, data collected from the accelerometer and gyroscope of the Samsung Galaxy S smartphone was retrieved, worked with, and >cleaned, to prepare a tidy data that can be used for later analysis.

From the downloaded data was extracted 66 variables which indicates means and standard deviations. Data with activities and subject was binded by columns for test and train set.

# Dataset creation process

tidy_data.txt file is prepared by following steps:
1. Download data
2. Unzip data
3. Load tables (for each, train and test, X tables, Y tables and subject tables)
4. Bind by columns Y, subject and X tables for both datasets
5. Merge test and train data
6. Read features file and extract variables which indicates only means and standard deviations
7. Substitute activity numbers by desriptive names
8. Change variable names to be more descriptive
9. Group data by activities and subjects and then create averaged values
10. Write as txt file.
