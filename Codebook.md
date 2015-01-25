## Cook book for the **long form** data set 

The data set contains **180** observations *(6 activities x 30 subjects)* of **81** variables.

### Variables

**activity**

  The activity performed by the subject during measurements. A string that can assume one of these 6 values:
  
    LAYING 
    SITTING 
    STANDING 
    WALKING 
    WALKING_DOWNSTAIRS 
    WALKING_UPSTAIRS
    
**subject**

  The unique identifier assigned to a subject. An integer (range 1-30).
  
**averages**

  The 79 variables provides the average of relevant variables for each activity and each subject.
  Selected variables includes 40 measures in the time domain (t*) and 49 measures in the frequency domain (f*).
  Angles between vectors has not been included in this data set.
  All features are numeric, normalized and bounded within [-1,1] (being the average of normalized features).
  
  The full list of variables is provided here:
  
  Legend:
  
   Pattern | Description 
   ------- | ----------- 
   t* | time domain 
   f* | frequency domain 
   \*Acc\* | Accelerometer 
   \*Gyro\* | Gyroscope 
   \*mean\* | mean 
   \*std\* | standard deviation 
   \*meanFreq\* | Weighted average of the frequency components 
  
  
    tBodyAcc.mean.X
    tBodyAcc.mean.Y
    tBodyAcc.mean.Z
    tBodyAcc.std.X
    tBodyAcc.std.Y
    tBodyAcc.std.Z
    tBodyAccJerk.mean.X
    tBodyAccJerk.mean.Y
    tBodyAccJerk.mean.Z
    tBodyAccJerk.std.X
    tBodyAccJerk.std.Y
    tBodyAccJerk.std.Z
    tBodyAccJerkMag.mean
    tBodyAccJerkMag.std
    tBodyAccMag.mean
    tBodyAccMag.std
    tGravityAcc.mean.X
    tGravityAcc.mean.Y
    tGravityAcc.mean.Z
    tGravityAcc.std.X
    tGravityAcc.std.Y
    tGravityAcc.std.Z
    tGravityAccMag.mean
    tGravityAccMag.std
    tBodyGyro.mean.X
    tBodyGyro.mean.Y
    tBodyGyro.mean.Z
    tBodyGyro.std.X
    tBodyGyro.std.Y
    tBodyGyro.std.Z
    tBodyGyroJerk.mean.X
    tBodyGyroJerk.mean.Y
    tBodyGyroJerk.mean.Z
    tBodyGyroJerk.std.X
    tBodyGyroJerk.std.Y
    tBodyGyroJerk.std.Z
    tBodyGyroJerkMag.mean
    tBodyGyroJerkMag.std
    tBodyGyroMag.mean
    tBodyGyroMag.std
    fBodyAcc.mean.X
    fBodyAcc.mean.Y
    fBodyAcc.mean.Z
    fBodyAcc.meanFreq.X
    fBodyAcc.meanFreq.Y
    fBodyAcc.meanFreq.Z
    fBodyAcc.std.X
    fBodyAcc.std.Y
    fBodyAcc.std.Z
    fBodyAccJerk.mean.X
    fBodyAccJerk.mean.Y
    fBodyAccJerk.mean.Z
    fBodyAccJerk.meanFreq.X
    fBodyAccJerk.meanFreq.Y
    fBodyAccJerk.meanFreq.Z
    fBodyAccJerk.std.X
    fBodyAccJerk.std.Y
    fBodyAccJerk.std.Z
    fBodyAccMag.mean
    fBodyAccMag.meanFreq
    fBodyAccMag.std
    fBodyBodyAccJerkMag.mean
    fBodyBodyAccJerkMag.meanFreq
    fBodyBodyAccJerkMag.std
    fBodyBodyGyroJerkMag.mean
    fBodyBodyGyroJerkMag.meanFreq
    fBodyBodyGyroJerkMag.std
    fBodyBodyGyroMag.mean
    fBodyBodyGyroMag.meanFreq
    fBodyBodyGyroMag.std
    fBodyGyro.mean.X
    fBodyGyro.mean.Y
    fBodyGyro.mean.Z
    fBodyGyro.meanFreq.X
    fBodyGyro.meanFreq.Y
    fBodyGyro.meanFreq.Z
    fBodyGyro.std.X
    fBodyGyro.std.Y
    fBodyGyro.std.Z


  
