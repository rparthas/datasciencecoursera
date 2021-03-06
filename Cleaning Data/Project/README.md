# Project - Getting And Cleaning Data
Author: Rajagopal Parthasarathi


##Purpose
>The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. 
>The goal is to prepare tidy data that can be used for later analysis.
>You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 
 
>1. a tidy data set as described below
>2. a link to a Github repository with your script for performing the analysis
>3. a code book that describes the variables, the data, and any transformations or work that you 
   performed to clean up the data called CodeBook.md. 

>You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected. 


##Description
>One of the most exciting areas in all of data science right now is wearable computing - see for example [this article] (http://www.insideactivitytracking.com/data-science-activity-tracking-and-the-battle-for-the-worlds-top-sports-brand/) .
>Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. 
>The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone.
>A full description is available at the site where the data was obtained:

>http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

>Here are the data for the project:

>https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

>You should create one R script called run_analysis.R that does the following. 

  >1. Merges the training and the test sets to create one data set.
  >2. Extracts only the measurements on the mean and standard deviation for each measurement. 
  >3. Uses descriptive activity names to name the activities in the data set
  >4. Appropriately labels the data set with descriptive variable names. 
  >5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 


##Steps to Run the Project

>1. All Data files must be placed in the source code directory such as 
	* activity_labels.txt
	* features.txt
	* train/X_train.txt & train/y_train.txt & train/subject_train.txt
	* test/X_test.txt & test/y_test.txt & test/subject_test.txt
>2. Navigate to the directory and run R in the directory
>3. Type ```source('run_analysis.R')``` to run the code
>4. See the tab delimited output file ```tidy.txt``` produced in the same directory

##Analysis Description

>The R script performs the following action 

  >1. Reads all the training and test data set into memory
  >2. Merges the training and test into a single memory object
  >3. ```addActivity```Creates a activity map by merging the activity id and activity levels. It adds the subject details to the original dataset
      as the column
  >4. ```filterMeanAndStd```Creates a subset of the data by filtering mean and standard deviation measures
  >5. ```tidify``` Master function to create a tidy dataset. It creates a tidy header . The first step is creating a subset and then breaking into
     required format using ```addHeader``` . Each and every row is processed and broken into subsequent rows
     
