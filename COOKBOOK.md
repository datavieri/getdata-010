## Cook book for the **long form** data set 

The data set contains **180** observations of 81 variables.

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

  The 79 variables provides the average of relevant measurements for each activity and each subject.
  Selected variables includes 40 measures in the time domain (t*) and 49 measures in the frequency domain (f*).
  Angles between vectors has not been included in this data set.
  All features are normalized and bounded within [-1,1], being the average of normalized features.
  
  The full list of variables is provided here:
  
  Legend:
  
  | Pattern | Description |
  | ------- | ----------- |
  | t* | time domain |
  | f* | frequency domain |
  | *Acc* | Accelerometer |
  | *Gyro* | Gyroscope |
  | *mean* | mean |
  | *std* | standard deviation |
  | *meanFreq* | Weighted average of the frequency components |
  
  
  
