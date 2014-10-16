# load data
feature_label <- read.csv("HumanActivityRecognitionDataset//features.txt",
                         sep="", header=FALSE, as.is=TRUE,
                         col.names=c('index', 'label_name'))
load_rows <- -1
## load training set
train_data <- read.csv("HumanActivityRecognitionDataset//train/X_train.txt", 
                       sep="", header=FALSE, as.is=TRUE, 
                       col.names=feature_label$label_name,
                       nrows=load_rows)
label_data <- read.csv("HumanActivityRecognitionDataset//train/y_train.txt", 
                       sep="", header=FALSE, as.is=FALSE,
                       nrows=load_rows)
subject_data <- read.csv(
                   "HumanActivityRecognitionDataset//train/subject_train.txt", 
                   sep="", header=FALSE, as.is=FALSE,
                   nrows=load_rows)
label_names <- read.csv("HumanActivityRecognitionDataset/activity_labels.txt",
                        sep="", header=FALSE, as.is=FALSE)
train_data$activity_label <- as.factor(label_data$V1)
levels(train_data$activity_label) <- label_names$V2
train_data$subject_label <- as.factor(subject_data$V1)
train_data$set_label <- "train"

## load testing set
test_data <- read.csv("HumanActivityRecognitionDataset//test/X_test.txt", 
                       sep="", header=FALSE, as.is=TRUE, 
                       col.names=feature_label$label_name,
                       nrows=load_rows)
label_data <- read.csv("HumanActivityRecognitionDataset//test/y_test.txt", 
                       sep="", header=FALSE, as.is=FALSE,
                       nrows=load_rows)
subject_data <- read.csv(
                    "HumanActivityRecognitionDataset//test/subject_test.txt", 
                    sep="", header=FALSE, as.is=FALSE,
                    nrows=load_rows)
test_data$activity_label <- as.factor(label_data$V1)
levels(test_data$activity_label) <- label_names$V2
test_data$subject_label <- as.factor(subject_data$V1)
test_data$set_label <- "test"
## stack two data sets
data_set <- rbind(train_data, test_data)
## remove the helper variables
rm(label_data)
rm(subject_data)
rm(train_data)
rm(test_data)
rm(label_names)
rm(feature_label)

# extracts the measurements on the mean and standard deviation for each 
# measurement
selected_indices <- rbind(grep("mean", colnames(data_set)), 
                          grep("std", colnames(data_set)))
mean_and_std_data <- data_set[,selected_indices]
measure_variables <- colnames(mean_and_std_data)
mean_and_std_data$subject_label <- data_set$subject_label
mean_and_std_data$activity_label <- data_set$activity_label

# use descriptive activity names to name the activities in the data set
# calculate the averages
melt_data <- melt(mean_and_std_data, id = c("subject_label", "activity_label"), 
                  measure.vars = measure_variables)
average_for_each_subject <- dcast(melt_data, subject_label ~ variable, mean)
average_for_each_activity <- dcast(melt_data, activity_label ~ variable, mean)

# save the data
average_measure <- rbind(average_for_each_activity[,measure_variables],
                         average_for_each_subject[, measure_variables])
rownames(average_measure) <- c(as.character(
      average_for_each_activity$activity_label),
      as.character(average_for_each_subject$subject_label))
write.table(average_measure, file="average_measure.txt", row.name=FALSE)