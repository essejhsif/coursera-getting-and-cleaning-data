
###Data

The data included:

- README.txt
- features_info.txt : Shows information about the variables used on the feature vector
- features.txt : List of all features
- activity_labels.txt : Links the class labels with their activity names
- train/X_train.txt : Training set
- train/y_train.txt : Training labels
- test/X_test.txt : Test set
- test/y_test.txt : Test labels

Additionally, a number of files in the train directory are included. This is in the 'Inertial Signals' folder. 

###Variables

- Subject : The subject ID. This variable comes from subject_train.txt and subject_test.txt files.
- Activity : The activity as a factor. This variable comes from y_train.txt and y_test.txt files
- All mean measurements in the form ID-(mean|std)[-X|Y|Z], e.g fBodyAcc-mean-X, fBodyBodyGyroMag-std. The original measurements come from X_train.txt and X_test.txt.

###Raw Data Collection

The following description were taken from features.txt that accompanied the data set:
````
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals).

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation
mad(): Median absolute deviation 
max(): Largest value in array
min(): Smallest value in array
sma(): Signal magnitude area
energy(): Energy measure. Sum of the squares divided by the number of values. 
iqr(): Interquartile range 
entropy(): Signal entropy
arCoeff(): Autorregresion coefficients with Burg order equal to 4
correlation(): correlation coefficient between two signals
maxInds(): index of the frequency component with largest magnitude
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
skewness(): skewness of the frequency domain signal 
kurtosis(): kurtosis of the frequency domain signal 
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
angle(): Angle between to vectors.
````

###Steps

The following steps take place in run_analysis.R:

1. Read in and then merges the training and the test sets to create one data set
2. Read in features data, extract only the measurements on the mean and standard deviation for each measurement
3. Read the activity_labels and use only descriptive activity names 
4. Get a list of current column labels and then tidy
5. Find the mean for each subject/label and then create the tidy data set (tidy_data_set.txt)

###Detailed Steps

At a more detailed level, the following steps were applied for cleaning the data:

- The data is first read in and then merged
- Variables were labeled based on features.txt
- The mean and standard deviation were then found
- Intermediate data set including variables with labels that contain mean and standard deviation(std) in their names
- Activity names were then assigned
- Activity values were recoded with descriptive names according to activity_labels.txt
- Variable names had dashes and parantheses removed 
- The second tidy data set was created with the average of each subject included
- The final dataset is written to a file called tidy_data.txt 

