This file is used with reference to the `run_analysis.R` script.
I have in general used 5 steps to process the data. The final result is a tidy dataset with all the variables grouped by certain features.

- Step 1: After loading the required libraries, the first step is to download and read the data. I used `read.csv` to read all the csv files. 

- Step 2: As all the files were sepereate this step was to merge all relevant data from the dataframes.

- Step 3: Since the merged dataset contains all the variables, we have to perform a select operation to gain the most important variables for our use.
         They are mean and std columns.
         
- Step 4: The data initially included the column names in a very short format. To make the dataset more readable, the next step was to edit all the
          column names using `gsub` function. 
      
- Step 5: Finally I gruoped the dataset according to the subject and activities, so that we can get a clear understanding about each variables and how they
          vary accordingly.
