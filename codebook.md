#codebook
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each subject was assigned a unique identifier from 1 to 30 and performed six activities (Walking, Walking Upstairs, Walking Downstairs, Sitting, Standing, Laying) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

From the original measurements, we extracted the ones on the mean and standard deviation for each measurement. Then we calculated the average per subject and per activity for each of the extracted measurements.

Subject is a number between 1 and 30,  representing 30 volunteers.

There are six activities for each volunteers.

WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING


The remaining 66 columns contaning character or string repsent different meaning as following: 
"t" -"time"

"f" - "frequency domain signal"

"BodyAcc" - body acceleration

"GravityAcc" - gravity acceleration

"Gyro" - angular velocity measured by the gyroscope

"Mag" - magnitude

"Jerk" -acceleration of the acceleration

 "Mean"  -average
 
 "StdDev" -standard deviation
 
 "X", "Y", or "Z" represents motion in those respective directions
