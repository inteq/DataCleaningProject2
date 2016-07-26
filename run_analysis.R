library(dplyr)

process_feature_names <- function(root_path='activity_data',
                                  feature_label_file_name='features.txt') {
  feature_labels <- read.table(file.path(root_path,feature_label_file_name))[,2]
  return(as.character(feature_labels))
}

process_activity_names <- function(root_path='activity_data',
                                   activity_label_file_name='activity_labels.txt') {
  activity_labels <- read.table(file.path(root_path,activity_label_file_name))[,2]
  names(activity_labels) <- c('Activity')
  return(activity_labels)
}

process_subject_identifiers <- function(root_path='activity_data',
                                        data_type='test') {
  subject_file_name <- paste('subject_',data_type,'.txt',sep="")
  full_path <- file.path(root_path,data_type,subject_file_name)
  subject_identifiers <- read.table(file.path(root_path,data_type,subject_file_name))
  names(subject_identifiers) <- c('Activity.Subject.ID')
  return(subject_identifiers)
}

process_activity_identifiers <- function(root_path='activity_data',
                                         data_type='test') {
  activity_file_name <- paste('y_',data_type,'.txt',sep="")
  activity_identifiers <- read.table(file.path(root_path,data_type,activity_file_name))
  names(activity_identifiers) <- c('Activity.ID')
  return(activity_identifiers)
}


process_activity_data <- function(root_path='activity_data',
                                  data_type='test') {
  
  activity_file_name <- paste('X_',data_type,'.txt',sep="")
  activity_data <- read.table(file.path(root_path,data_type,activity_file_name))
  return(activity_data)
}

filter_and_rename <- function(data_frame,
                              col_names) {
  ## Apply column names
  names(data_frame) <- c(col_names)
  
  ## Filter out all unwanted features - Those that do not contain the mean and std-dev (Also excludes angular calculations)
  features_to_keep <- col_names[grep('mean|std|subject|activity',col_names,ignore.case=TRUE)]
  features_to_keep <- features_to_keep[grep('^[^angle]',features_to_keep,ignore.case=TRUE)]
  features_to_modify <- features_to_keep
  ## Clean up feature labels using string substitution (I know this is not the best way, but I needed something quick and dirty)
  features_to_modify <- gsub('tGravityAcc','Time.Gravity.Acceleration',features_to_modify)
  features_to_modify <- gsub('tBodyAcc','Time.Body.Acceleration',features_to_modify)
  features_to_modify <- gsub('tBodyGyro','Time.Body.Gyro',features_to_modify)
  features_to_modify <- gsub('tBodyBody','Time.Body.Body',features_to_modify)
  features_to_modify <- gsub('fGravityAcc','Time.Gravity.Acceleration',features_to_modify)
  features_to_modify <- gsub('fBodyAcc','Frequency.Body.Acceleration',features_to_modify)
  features_to_modify <- gsub('fBodyGyro','Frequency.Body.Gyro',features_to_modify)
  features_to_modify <- gsub('fBodyBody','Frequency.Body.Body',features_to_modify)
  features_to_modify <- gsub('BodyAcc','.Body.Acceleration',features_to_modify)
  features_to_modify <- gsub('BodyGyro','.Body.Gyro',features_to_modify)
  features_to_modify <- gsub('Mag','.Mag',features_to_modify)
  features_to_modify <- gsub('Jerk','.Jerk',features_to_modify)
  features_to_modify <- gsub('\\.\\.','\\.',features_to_modify)
  features_to_modify <- gsub('-mean()','.Average',features_to_modify)
  features_to_modify <- gsub('-std()','.StdDeviation',features_to_modify)
  features_to_modify <- gsub('-meanFreq()','.AverageFrequency',features_to_modify)
  features_to_modify <- gsub('\\(\\)','',features_to_modify)
  
  data_frame <- data_frame[features_to_keep]
  names(data_frame) <- features_to_modify
  return(data_frame)
}

combine_activity_data <- function() {
  
  ## Retrieve activity labels
  activity_names <- process_activity_names()
  ## Retrieve feature labels
  feature_names <- process_feature_names()
  
  ## Retrieve test and training data
  activity_test_data <- process_activity_data(data_type='test')
  activity_training_data <- process_activity_data(data_type='train')
  
  ## Retrieve test and training activity identifiers
  activity_training_identifiers <- process_activity_identifiers(data_type='train')
  activity_test_identifiers <- process_activity_identifiers(data_type='test')
  
  ## Process test and training data
  activity_test_subject_identifiers <- process_subject_identifiers(data_type='test')
  activity_training_subject_identifiers <- process_subject_identifiers(data_type='train')
  
  
  ## Clean up test data and apply col names
  activity_test_data <- filter_and_rename(activity_test_data,
                                          feature_names)
  
  ## Enhance test and training data data frames with subject
  ## and acvitity data
  activity_test_data_table <- cbind(activity_test_subject_identifiers,
                                    activity_test_identifiers,
                                    activity_test_data)
  
  ## Clean up training data and apply col names
  
  activity_training_data <- filter_and_rename(activity_training_data,
                                              feature_names)
  
  activity_training_data_table <- cbind(activity_training_subject_identifiers,
                                        activity_training_identifiers,
                                        activity_training_data)
  
  ## Combine the testing and training data
  all_activity_records <- rbind(activity_training_data_table,activity_test_data_table)
  
  ## Add descriptive feature for activity monitored in observation row
  all_activity_records$Activity.Label <- activity_names[all_activity_records$Activity.ID]
  
  return(all_activity_records)
}


generate_tidy_data <- function(data_frame) {
  ## Export the subject , activity label, and averages for all activities and related measurements
  col_names <- names(data_frame)
  features_to_keep <- col_names[grep('average|subject|activity',col_names,ignore.case=TRUE)]
  tidy_data_frame <- data_frame[features_to_keep]
  ##  Uncomment if you want to view the prepared data in RStudio
  ##View(tidy_data_frame)
  write.table(tidy_data_frame,'./tidy_data.txt',row.names = FALSE)
}

print('Preparing activity data frame')
activity_data <- combine_activity_data()
## Uncomment if you want to view the prepared data in RStudio
## View(activity_data)
generate_tidy_data(activity_data)
