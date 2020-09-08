This file is used with reference to the `run_analysis.R` script.
I have in general used 5 steps to process the data. The final result is a tidy dataset with all the variables grouped by certain features.

- Step 1: After loading the required libraries, the first step is to download and read the data. I used `read.csv` to read all the csv files. 
         features <- features.txt : 561 rows, 2 columns
         
         Functions used `read.csv`
         
         features <- "features.txt"
         act_label <- activity_labels.txt : 6 rows, 2 columns 
         subject_test <- test/subject_test.txt : 2947 rows, 1 column         
         x_test <- test/X_test.txt : 2947 rows, 561 columns         
         y_test <- test/y_test.txt : 2947 rows, 1 columns         
         subject_train <- test/subject_train.txt : 7352 rows, 1 column        
         x_train <- test/X_train.txt : 7352 rows, 561 columns        
         y_train <- test/y_train.txt : 7352 rows, 1 columns
         
- Step 2: As all the files were sepereate, this step was to merge all relevant data from the dataframes.
          Functions used `rbind()`, `cbind()`
          
          X (10299 rows, 561 columns) <- x_trian, x_test,
          Y (10299 rows, 561 columns) <- y_train, y_test,
          subject (10299 rows, 1 column),
          final_merge_set <- (0299 rows, 563 column)
          

- Step 3: Since the merged dataset contains all the variables, we have to perform a select operation to gain the most important variables for our use.
          They are mean and std columns.
         
          Function - `select(final_merge_set, contains("mean"), contains("std"), code)`
         
- Step 4: The data initially included the column names in a very short format. To make the dataset more readable, the next step was to edit all the
          column names using `gsub` function. 
          
          Dataset - `final_data`
      
- Step 5: Finally I grouped the dataset according to the subject and activities, so that we can get a clear understanding about each variables and how they
          vary accordingly.
          
          Function - `aggregate(final_data, by=final_data[c("activity","subject")], FUN =  mean)`
          Dataset - `tidy_data`
          
