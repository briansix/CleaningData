# Data Cleaning Final Project **README**
Brian Burnham 
brian@brian6.com

## Description
The four files listed below were created to take the provided data files and process them according to the requirements listed below. Inline comments in run_analysis.R explain each step and indicate the line of code that accompishes the numbered requirements below. 

## Files
- ReadMe.md - this file
- Codebook.md - Code Book describing variables used
- final.txt - processed result containing tidy data set
- run_analysis.R - R script to process included data sets into final.txt

Data files provided:
- activity_labels.txt
- features_info.txt
- features.txt
- README.txt
- test (folder)
    - Intertal Signals (folder, *not used*)
    - subject_test.txt
    - X_test.txt
    - y_test.txt
- train (folder)
    - Intertal Signals (folder, *not used*)
    - subject_train.txt
    - X_train.txt
    -y_train.txt
    
## Requirements:
You should create one R script called run_analysis.R that does the following.
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Please upload the tidy data set created in step 5 of the instructions. Please upload your data set as a txt file created with write.table() using row.name=FALSE (do not cut and paste a dataset directly into the text box, as this may cause errors saving your submission).

Please submit a link to a Github repo with the code for performing your analysis. The code should have a file run_analysis.R in the main directory that can be run as long as the Samsung data is in your working directory. The output should be the tidy data set you submitted for part 1. You should include a README.md in the repo describing how the script works and the code book describing the variables.