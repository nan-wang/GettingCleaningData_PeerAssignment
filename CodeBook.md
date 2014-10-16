Getting and Cleaning Data Course Project
========================================

## Declaration of Variables
#### Helper variables
- **feature_label** : load the names of the features.
- **load_rows** : the number of rows to load. Set to 1 to 10299 for debugging; set to -1 for real running. 
- **train_data** : load the training set.
- **label_data** : load the activity labels for the training set, for details please refer to *./HumanActivityRecognitionDataset/README.txt*.
- **subject_data** : load the subject labels for the training set.
- **label_names** : load the names of the activity labels.
- **selected_indices** : the indicies of the columns that are either mean or standard deviation of the measurements.
- **measure_variables** : the names of the columns (features) that are either mean or standard deviation of the measurements.

#### Main variables
- **data_set** : the data.frame including all the features and labels.
- **mean_and_std_data** : the data.frame including only the the mean and standard deviation for each measurement and labels.

## Processing Pipline
1. We load the training and test data sets seperately. The **train_data** and the **test_data** are stacked into **data_set**. All the labels are converted to **factors**. Besides the 561 features in the training set, we add three helper columns:
	- **subject_label** : the label of different subjects.
	- **activity_label** : the label of different activity.
	- **set_label**: the label of either _train_ or _test_.

2. We extract the mean and standard deviation for each measurement by searching the related column names. The indices of the selected columns are storaged in **selected_indices**; the names of these columns are in **measure_variables**. The extracted data is storaged in **mean_and_std_data**.

3. The grouped average of the measurements are calculated and storaged in two variables:
	- **average_for_each_subject** : the average measurements for each subject.
	- **average_for_each_activity** : the average measurements for each activity.
