# Set the working directory
setwd("/Users/jessefish/Desktop/UCI HAR Dataset")

# 1. Read in and then merges the training and the test sets to create one data set
y_test <- read.table("test/y_test.txt", col.names="label")
subject_test <- read.table("test/subject_test.txt", col.names="subject")
X_test <- read.table("test/X_test.txt")
y_train <- read.table("train/y_train.txt", col.names="label")
subject_train <- read.table("train/subject_train.txt", col.names="subject")
X_train <- read.table("train/X_train.txt")

merged_data <- rbind(cbind(subject_test, y_test, X_test), cbind(subject_train, y_train, X_train))

# 2. Read in features data, extract only the measurements on the mean and standard deviation for each measurement
features <- read.table("features.txt", strip.white=TRUE, stringsAsFactors=FALSE)
features_mean_std <- features[grep("mean\\(\\)|std\\(\\)", features$V2), ]
merged_data_mean_std <- merged_data[, c(1, 2, features_mean_std$V1+2)]

# 3. Read the activity_labels and use only descriptive activity names 
labels <- read.table("activity_labels.txt", stringsAsFactors=FALSE)
merged_data_mean_std$label <- labels[merged_data_mean_std$label, 2]

# 4. Get a list of current column labels and then tidy
column_names <- c("subject", "label", features_mean_std$V2)
column_names <- tolower(gsub("[^[:alpha:]]", "",column_names))
colnames(merged_data_mean_std) <- column_names

# 5. Find the mean for each subject/label and then create the tidy data set (tidy_data_set.txt)
result_data <- aggregate(merged_data_mean_std[, 3:ncol(merged_data_mean_std)],by=list(subject = merged_data_mean_std$subject, 
                         label = merged_data_mean_std$label),mean)

# Write the data
write.table(format(result_data, scientific=T), "tidy_data.txt", row.names=F, col.names=F, quote=2)
