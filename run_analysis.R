setwd("~/getdata-010//PA1/data/")

library("dplyr")

##### STEP 1 - Merge training and test data 
### Read training data
train.features <- read.table("train/X_train.txt", header = FALSE, as.is = TRUE)
train.activities <- read.table("train/y_train.txt", header = FALSE, as.is = TRUE)
train.subjects <- read.table("train/subject_train.txt", header = FALSE, as.is = TRUE)

# Rename columns
train.activities <- rename(train.activities, activity.id = V1)
train.subjects <- rename(train.subjects, subject = V1)

# Bind training data by columns: subject, activity, features
train.data <- cbind(train.subjects, train.activities, train.features)

### Read test data
test.features <- read.table("test/X_test.txt", header = FALSE, as.is = TRUE)
test.activities <- read.table("test/y_test.txt", header = FALSE, as.is = TRUE)
test.subjects <- read.table("test/subject_test.txt", header = FALSE, as.is = TRUE)

# Rename columns
test.activities <- rename(test.activities, activity.id = V1)
test.subjects <- rename(test.subjects, subject = V1)

# Bind test data by columns: subject, activity, features
test.data <- cbind(test.subjects, test.activities, test.features)

### Bind train and test data by rows: train, test
full.data <- rbind(train.data, test.data)

##### STEP 2 - Extract features that are measurements of mean and std dev

### Read feature labels
feature.labels <- read.table("features.txt", header = FALSE, as.is = TRUE)
### Normalise feature labels
feature.labels <- feature.labels %>% 
    rename(feature.id = V1, feature = V2 ) %>%
    mutate(feature = gsub(pattern = "[[:punct:]]", 
                          replacement = "\\.", feature)) %>%
    mutate(feature = gsub(pattern = "\\.+", 
                          replacement = "\\.", feature))  %>%
    mutate(feature = gsub(pattern = "\\.$", 
                      replacement = "", feature))
    
    
### Assign names to feature columns in full.data 
# Column 1 = subject.id
# Column 2 = activity.id
# Columns 3-563 = features
# Column indexes are added to avoid duplicate column names (and later removed)
names(full.data)[3:563] <- paste(feature.labels[[2]], "_C", feature.labels[[1]], sep = "")

### Subset data on mean and std columns (excluding angles between vectors)
working.data <- select(full.data, subject, activity.id, 
                     contains("mean"), contains("std"), -contains("angle"))

##### STEP 3 - Use descriptive activity names
### Read activity labels
activity.labels <- read.table("activity_labels.txt", header = FALSE, as.is = TRUE)
activity.labels <- rename(activity.labels, activity.id = V1, activity = V2 )

### Join activity.labels and working.data on activity.id
working.data <- inner_join(activity.labels, working.data, by = "activity.id")
# Drop activity.id and keep activity only
working.data$activity.id <- NULL
working.data$activity <- as.factor(working.data$activity)
working.data$subject <- as.factor(working.data$subject)

##### STEP 4 - Appropriately labels the data set
names(working.data) <- gsub("_C\\d+", "", names(working.data))

##### STEP 5 - Generate data set of average values grouped by activity and subject
### Provides a tidy data set in wide form
avg.data <- working.data %>% 
    group_by(activity, subject) %>% 
    summarise_each(funs(mean))

# Save tidy data set in wide form (the tidy data set submitted)
write.table(file = "dataset.wide.txt", x = avg.data, row.names = FALSE)

### Optionally, provide the same tidy data set in long form
avg.data.long <- avg.data %>%
    melt(id=c("activity", "subject")) %>%
    arrange(activity, subject, variable)

# Save tidy data set in long form
write.table(file = "dataset.long.txt", x = avg.data.long, row.names = FALSE)
