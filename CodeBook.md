# Introduction
The script run_analysis.Rperforms the 5 steps described in the course project's definition.

1. All the similar data is merged using the rbind() function. By similar, we address those files having the same number of columns and referring to the same entities.
2. Only those columns with the mean and standard deviation measures are taken from the whole dataset. After extracting these columns, they are given the correct names, taken from features.txt.
3. As activity data is addressed with values 1:6, we take the activity names and IDs from activity_labels.txt and they are substituted in the dataset.
4. On the whole dataset, those columns with value column names are corrected.
5. we generate a new dataset with all the average measures for each subject and activity. 
6. The output file is called tidy_data.txt, and uploaded to this repository.

# Variables
* x_train, y_train, x_test, y_test, subject_train and subject_test contain the data from the downloaded files.
* x_dataset, y_dataset and subject_dataset merge the previous datasets to further analysis.
* features contains the correct names for the x_dataset dataset, which are applied to the column names stored in mean_std, a numeric vector used to extract the desired data.
* A similar approach is taken with activity names through the activities variable.
* all_singledatabase merges x_data, y_data and subject_data in a big dataset.
* Finally, The tidy_data.txt data file is a text file, containing space-separated values.

# Tidy Data
The tidy_data.txt data file is a text file, containing space-separated values.

The first row contains the names of the variables, which are listed and described in the Variables section, and the following rows contain the values of these variables.
