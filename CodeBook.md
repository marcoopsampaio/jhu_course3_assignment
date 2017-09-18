# Human Activity Recognition Using Smartphones -- Transformed Dataset CodeBook

## Summary
This code book describes a secondary dataset that was produced based on the dataset publicly available at

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The version of the dataset used was the one provided at the following link

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012


## Description of the original data

To produce this secondary dataset we used the signal data that was produced in the references quoted in the summary above. To understand the meaning of the variables it is simpler to quote the relevant parts of the original code book. The relevant parts of the procedure was the following (for further information see references above):

1. **Experimental conditions:** The experiment consisted of the measurement of a time series at a rate of 50 Hz. The original description is as follows:
> *The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (walking, walking upstairs, walking downstairs, sitting, standing, laying) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz.*
2. ** Original features estimated at each time step:** The experiment produced time series for the time-domain signal or the frequency-domain signal for various features. At each time step a signal is measured and its properties are estimated. The steps are:
	* **Raw signal measurement**: Here there is a raw accelerometer and gyroscope signal thaat are measured and then the raw features of interest are computed. To understand the meaning of each feature we quote the original text. 

    For the time domain signal:
	> *The features selected [...] come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ [...] time domain signals (prefix 't' to denote time) [...] the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) [...] the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). *
	
    For the frequency domain signal:
	> *Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). *
	* **Parameter estimation:**  For each raw signal measurement, at each time step, the signal mean and standard deviation are estimated (together with various other quantities that we will not use). In the next section we provide a list of the variables that we used to produced the new dataset.

## New Data Set Description and Key

Using the data provided for the mean and standard deviation of each of the original features, we  computed, for each ("ActivityType","SubjectID") pair, the average of each feature. This is provided as a new data set in the file "HumanActvRecogSmartPhones_averages_of_series.csv". The complete list of variables in the tabular data is as follows (all variables are numeric with values in the range [-1:1] except for the first two):
1. ActivityType
	* 6 Levels: (walking, walking upstairs, walking downstairs, sitting, standing, laying)
2. SubjectID
	* This is an integer ID to label the subject (1,2,..., 30) 
3. AveragetBodyAccelerationMeanX
4. AveragetBodyAccelerationMeanY
5. AveragetBodyAccelerationMeanZ
6. AveragetBodyAccelerationSTDeviationX
7. AveragetBodyAccelerationSTDeviationY
8. AveragetBodyAccelerationSTDeviationZ
9. AveragetGravityAccelerationMeanX
10. AveragetGravityAccelerationMeanY
11. AveragetGravityAccelerationMeanZ
12. AveragetGravityAccelerationSTDeviationX
13. AveragetGravityAccelerationSTDeviationY
14. AveragetGravityAccelerationSTDeviationZ
15. AveragetBodyAccelerationJerkMeanX
16. AveragetBodyAccelerationJerkMeanY
17. AveragetBodyAccelerationJerkMeanZ
18. AveragetBodyAccelerationJerkSTDeviationX
19. AveragetBodyAccelerationJerkSTDeviationY
20. AveragetBodyAccelerationJerkSTDeviationZ
21. AveragetBodyAngularVelocityMeanX
22. AveragetBodyAngularVelocityMeanY
23. AveragetBodyAngularVelocityMeanZ
24. AveragetBodyAngularVelocitySTDeviationX
25. AveragetBodyAngularVelocitySTDeviationY
26. AveragetBodyAngularVelocitySTDeviationZ
27. AveragetBodyAngularVelocityJerkMeanX
28. AveragetBodyAngularVelocityJerkMeanY
29. AveragetBodyAngularVelocityJerkMeanZ
30. AveragetBodyAngularVelocityJerkSTDeviationX
31. AveragetBodyAngularVelocityJerkSTDeviationY
32. AveragetBodyAngularVelocityJerkSTDeviationZ
33. AveragetBodyAccelerationMagnitudeMean
34. AveragetBodyAccelerationMagnitudeSTDeviation
35. AveragetGravityAccelerationMagnitudeMean
36. AveragetGravityAccelerationMagnitudeSTDeviation
37. AveragetBodyAccelerationJerkMagnitudeMean
38. AveragetBodyAccelerationJerkMagnitudeSTDeviation
39. AveragetBodyAngularVelocityMagnitudeMean
40. AveragetBodyAngularVelocityMagnitudeSTDeviation
41. AveragetBodyAngularVelocityJerkMagnitudeMean
42. AveragetBodyAngularVelocityJerkMagnitudeSTDeviation
43. AveragefBodyAccelerationMeanX
44. AveragefBodyAccelerationMeanY
45. AveragefBodyAccelerationMeanZ
46. AveragefBodyAccelerationSTDeviationX
47. AveragefBodyAccelerationSTDeviationY
48. AveragefBodyAccelerationSTDeviationZ
49. AveragefBodyAccelerationJerkMeanX
50. AveragefBodyAccelerationJerkMeanY
51. AveragefBodyAccelerationJerkMeanZ
52. AveragefBodyAccelerationJerkSTDeviationX
53. AveragefBodyAccelerationJerkSTDeviationY
54. AveragefBodyAccelerationJerkSTDeviationZ
55. AveragefBodyAngularVelocityMeanX
56. AveragefBodyAngularVelocityMeanY
57. AveragefBodyAngularVelocityMeanZ
58. AveragefBodyAngularVelocitySTDeviationX
59. AveragefBodyAngularVelocitySTDeviationY
60. AveragefBodyAngularVelocitySTDeviationZ
61. AveragefBodyAccelerationMagnitudeMean
62. AveragefBodyAccelerationMagnitudeSTDeviation
63. AveragefBodyAccelerationJerkMagnitudeMean
64. AveragefBodyAccelerationJerkMagnitudeSTDeviation
65. AveragefBodyAngularVelocityMagnitudeMean
66. AveragefBodyAngularVelocityMagnitudeSTDeviation
67. AveragefBodyAngularVelocityJerkMagnitudeMean
68. AveragefBodyAngularVelocityJerkMagnitudeSTDeviation

A full description of the script that was used to process the original data and produce this summary data (by averaging over the time series) is provided in the README.md file.
