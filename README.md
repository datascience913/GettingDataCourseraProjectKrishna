GettingDataCourseraProject-2014
===============================

Getting Data Coursera Project Description


Description of run_analysis.R

1. **Reading the data:** First step, the script reads the training data(X_train.txt), test data(X_test.txt), corresponding labels (y_train.txt, y_test.txt), subject ID (subject_train.txt, subject_test.txt), feature names (features.txt), and activity labels (activity_labels.txt).

2. **Merging the data:** The training and test data are merged to create a single dataset using rbind(). The corresponding labels and subjects are also merged. This results in a dataset of 10299 rows and 561 columns.
 
3. **Feature extraction:**  From the 561 features, only the features that correspond to the mean and std. deviation of signal measurements are extracted. According to the information in features_info.txt, these are the features that contain "mean()" and "std()" in their names. This is done using grep() with fixed=TRUE to get an exact match. Note that I am not including features like meanFreq() as that is a weighted average. This step reduces the feature dimensions to 66.     

4. **Renaming activities:** The numeric activity labels are mapped to corresponding descriptive names using the information in "activity_labels.txt" and the resulting column is called activityNames.

5. **Renaming features:** The 66 extracted features are assigned descriptive, syntactically valid, unique  names by removing special characters, such "(", ")", and "-" from their original names listed in features.txt. This is done using make.names(), followed by gsub to remove ".". Also, names like "BodyBody" are replaced with "Body".

6. **Creating a tidy dataset:** Now that we have all the elements, the final step is to create the tidy data set. First, I added a new column called "subject" to the dataset resulting from Step 5 above. This column consists of the subject IDs in the combined training and test dataset (from step 2 above) and forms the first column. Then I add the activity names (from step 4 above) as an additional column. So we now have a dataset with 10299 rows and 68 columns: "subject", "acitivityName", and the 66 features corresponding to mean and std .dev (from Step 5 above). Lastly, the average of each of the 66 extracted variables is computed, grouped by "subject" and "activityName". This results in  the final tidy dataset with 180 rows and 68 columns. Each row corresponds to the average measurements for a distinct subject-activityName combination. 

7. **Output:** The tidy dataset resulting from Step 6 above is output to the file "tidy.txt" using write.table(). The dataset has a header with the column names and the column separator is a tab. The row names are not part of the output. The tidy dataset has been uploaded to the Coursera web page.  

 



~     
