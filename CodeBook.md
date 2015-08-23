<h1>Codebook for the "Getting and Cleaning Data" Course Project [1]:</h1>

<h2>1. Project Description</h1>

<p>The goal of this project was to clean up a dataset provided to us by the course instructors. As described on the course project page:</p>

<p>"One of the most exciting areas in all of data science right now is wearable computing...
Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. 
The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone."</p>

<p>The goal was to create a script called run_analysis.R that:</p>
<ul>
<li>Merges the training and the test sets to create one data set.</li>
<li>Extracts only the measurements on the mean and standard deviation for each measurement.</li>
<li>Uses descriptive activity names to name the activities in the data set.</li>
<li>Appropriately labels the data set with descriptive variable names.</li>
<li>From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.</li>
</ul>


<h2>2. Study design and data processing</h2>

<p>Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio and Luca Oneto from Smartlab - Non Linear Complex Systems Laboratory have performed the following experiments (information taken from the README.txt file present in the main UCI HAR Dataset directory):</p>
<p>"The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a Smartphone (Samsung Galaxy S II) on the waist.</p>

<p>Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually.</p> 

<p>The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers were selected for generating the training data and 30% the test data.</p>

<p>The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window).</p>

<p>The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity.</p>

<p>The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain."</p>

<p>There are 17 different variable groups (information taken from the features_info.txt file main UCI HAR Dataset directory):</p>

<ul>"tBodyAcc-XYZ</li>
<li>tGravityAcc-XYZ</li>
<li>tBodyAccJerk-XYZ</li>
<li>tBodyGyro-XYZ</li>
<li>tBodyGyroJerk-XYZ</li>
<li>tBodyAccMag</li>
<li>tGravityAccMag</li>
<li>tBodyAccJerkMag</li>
<li>tBodyGyroMag</li>
<li>tBodyGyroJerkMag</li>
<li>fBodyAcc-XYZ</li>
<li>fBodyAccJerk-XYZ</li>
<li>fBodyGyro-XYZ</li>
<li>fBodyAccMag</li>
<li>fBodyAccJerkMag</li>
<li>fBodyGyroMag</li>
<li>fBodyGyroJerkMag</li>
</ul>

<p>The set of variables that were estimated from these signals are:</p>

<ul>
<li>mean(): Mean value</li>
<li>std(): Standard deviation</li>
<li>mad(): Median absolute deviation</li> 
<li>max(): Largest value in array</li>
<li>min(): Smallest value in array</li>
<li>sma(): Signal magnitude area</li>
<li>energy(): Energy measure. Sum of the squares divided by the number of values.</li>
<li>iqr(): Interquartile range</li>
<li>entropy(): Signal entropy</li>
<li>arCoeff(): Autorregresion coefficients with Burg order equal to 4</li>
<li>correlation(): correlation coefficient between two signals</li>
<li>maxInds(): index of the frequency component with largest magnitude</li>
<li>meanFreq(): Weighted average of the frequency components to obtain a mean frequency</li>
<li>skewness(): skewness of the frequency domain signal </li>
<li>kurtosis(): kurtosis of the frequency domain signal </li>
<li>bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.</li>
<li>angle(): Angle between to vectors.</li>
</ul>

<p>Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:</p>

<ul>
<li>gravityMean</li>
<li>tBodyAccMean</li>
<li>tBodyAccJerkMean</li>
<li>tBodyGyroMean</li>
<li>tBodyGyroJerkMean"</li>
</ul>
 
<p>The complete list of variables of each feature vector is available in the features.txt file, present in the main UCI HAR Dataset directory.</p>

<p>The test data can be found in the “test” subdirectory of the UCI HAR Dataset. The training data can be found in the "training" subdirectory of the UCI HAR Dataset.</p>

<p>The "test" and "training" directories contain "Inertial Signals" folders. As put in the README.txt from the main UCI HAR Dataset directory:</p>

<p>"The following files are available for the train and test data. Their descriptions are equivalent.</p>

<p>- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis.</p>

<p>- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration.</p>

<p>- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second."</p>


<h2>3. Cleaning the data to obtain the tidy_dataset.txt file</h2>

<h3>The "train" subdirectory:</h3>

<p>X_train.txt contains the training data.</p>

<p>y_train.txt contains the activity labels (1 to 6).</p>

<p>subject_train.txt contains the subject IDs. It indicates which row corresponds to which subject. As each subject performed each activity multiple times, the number of rows of the training data exceeds the expected 180 (it now is 7352).</p>

<h3>The "test" subdirectory:</h3>

<p>X_test.txt contains the training data.</p>

<p>y_test.txt contains the activity labels (1 to 6).</p>

<p>subject_test.txt contains the subject IDs. It indicates which row corresponds to which subject. As each subject performed each activity multiple times, the number of rows of the training data exceeds the expected 180 (it now is 2947).</p>

<p>For both datasets, the activity labels and subject IDs are bound to the left of the dataset. The datasets are then merged together. We obtain a dataset of  563 columns (561 + Subject ID + Activity ID) by 10299 rows (7352 + 2947).</p>

<p>Here, it was opted not to include the "Inertial Signals" folders in the pre-analysis stage. These folders do not contain labels for the data present in these folders. Therefore, this data would be discarded in later stages, as we only want to extract data on std() and mean() [2].<p>

<p>The activity labels 1 to 6 are then mapped to the following terms: "WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING".</p>

<p>The variables are then renamed by the names present in the "features.txt" file present in the main UCI HAR Dataset directory. Only the variables included the word mean() or std() were subsequently included. Variables including the word "meanFreq" were excluded, as these concern a weighted average instead of a mean (see the features_info.txt file, present in the main UCI HAR Dataset directory). The new dataset contains 66 columns (33 for the mean, 33 for the std).</p>

<p>The names were subsequently cleaned. Here, abbreviations such as acc were replaced by their full names. It was opted to place dashes (-) between the different parts of a variable to provide for a more fluent reading.</p>

<p>Subsequently, the mean of then mean and the mean of the std was taken for each subject for each activity separately over the different measurements. We have obtained a dataframe of 180 rows (30 subjects, 6 activities per subject) and 68 columns (subject + activity + 66 variables for mean and std).</p>

<p>For more details on the code to perform the above cleaning, see the README.md file present in the github repository submitted to Coursera.</p>


<h2>4. Description of the variables in the tidy_dataset.txt file</h2>

<p>After cleaning, we have obtained a dataframe of 180 rows (each of the 30 subject has performed 30 different activities) by 68 columns ("subjectid" + "activity" + 66 variables for the mean and the std of measurements).</p>

<p>These 68 variables are the following:</p>	

<h3>Variable 1: "subjectid"</h3>

<p>This is the first column of the dataset. This variable is an identifier of the subject who carried out the experiment. As there are 30 different subjects, each performing 6 different activities (albeit multiple times) we obtain 180 rows. This is a factor variable with 30 levels (1 to 30), where each level is repeated 6 times.</p>

<h3>Variable 2: "activity"</h3>

<p>This is the second column of the dataset. This variable indicates which activity was performed by the subject. This is a factor variable with 6 levels ("WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING"), where each level is repeated 30 times.</p>

<h3>The rest of the 66 numeric variables can be divided into 17 separate groups.</h3>

<p>Data was either collected with an accelerometer (variable groups 1,2,3,6,7,8,11,12,14,15) or with a gyroscope (variable groups 4,5,9,10,13,16,17).</p>

<p>Time domain signals (variable groups 1 to 10) were captured at a constant rate of 50 Hz. They were then filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. A Fast Fourier Transform (FFT) was applied to some of these signals to obtain variable groups 11 to 17.</p>

<p>As the signals are 3-axial, 3 mean values are collected (mean-x, mean-y, mean-z) and 3 std values (std-x, std-y, std-z). This holds for variable groups 1 to 5 and 11 to 13. The magnitude of these three-dimensional signals was also calculated by using the Euclidean norm (variable groups 6 to 10 and 14 to 17). Thus, for these groups there are only two separate variables (mean and std) instead of 6.</p>

<p>For the accelerometer, the signal was separated into body (variable groups 1,3,6,8,11,12,14,15) and gravity (groups 2,7) acceleration signals. This was done by using another low pass Butterworth filter with a corner frequency of 0.3 Hz. For the gyroscope, only body signals were captured.</p>

<p>Finally, the body linear acceleration was derived in time to obtain Jerk signals (variable groups 3,5,8,10,12,15,17).</p>

<p>All signals are normalized and bounded within [-1,1]. They do not have a unit of measurement; they are absolute numbers.</p>

<h4>1. time-body-accelerometer</h4>
<ul>
<li>time-body-accelerometer-mean-x (variable 3)</li>
<li>time-body-accelerometer-mean-y (variable 4)</li>
<li>time-body-accelerometer-mean-z (variable 5)</li>
<li>time-body-accelerometer-std-x  (variable 36)</li>
<li>time-body-accelerometer-std-y  (variable 37)</li>
<li>time-body-accelerometer-std-z  (variable 38)</li>
</ul>

<h4>2. time-gravity-accelerometer</h4>
<ul>
<li>time-gravity-accelerometer-mean-x (variable 6)</li>
<li>time-gravity-accelerometer-mean-y (variable 7)</li>
<li>time-gravity-accelerometer-mean-z (variable 8)</li>
<li>time-gravity-accelerometer-std-x  (variable 39)</li>
<li>time-gravity-accelerometer-std-y  (variable 40)</li>
<li>time-gravity-accelerometer-std-z  (variable 41)</li>
</ul>

<h4>3. time-body-accelerometer-jerk</h4>
<ul>
<li>time-body-accelerometer-jerk-mean-x (variable 9)</li>
<li>time-body-accelerometer-jerk-mean-y (variable 10)</li>
<li>time-body-accelerometer-jerk-mean-z (variable 11)</li>
<li>time-body-accelerometer-jerk-std-x  (variable 42)</li>
<li>time-body-accelerometer-jerk-std-y  (variable 43)</li>
<li>ime-body-accelerometer-jerk-std-z  (variable 44)</li>
</ul>
	
<h4>4. time-body-gyroscope</h4>
<ul>
<li>time-body-gyroscope-mean-x (variable 12)</li>
<li>time-body-gyroscope-mean-y (variable 13)</li>
<li>time-body-gyroscope-mean-z (variable 14)</li>
<li>time-body-gyroscope-std-x  (variable 45)</li>
<li>time-body-gyroscope-std-y  (variable 46)</li>
<li>time-body-gyroscope-std-z  (variable 47)</li>
</ul>

<h4>5. time-body-gyroscope-jerk</h4>
<ul>
<li>time-body-gyroscope-jerk-mean-x (variable 15)</li>
<li>time-body-gyroscope-jerk-mean-y (variable 16)</li>
<li>time-body-gyroscope-jerk-mean-z (variable 17)</li>
<li>time-body-gyroscope-jerk-std-x  (variable 48)</li>
<li>time-body-gyroscope-jerk-std-y  (variable 49)</li>
<li>time-body-gyroscope-jerk-std-z  (variable 50)</li>
</ul>

<h4>6. time-body-accelerometer-magnitude</h4>
<ul>
<li>time-body-accelerometer-magnitude-mean (variable 18)</li>
<li>time-body-accelerometer-magnitude-std  (variable 51)</li>
</ul>

<h4>7. time-gravity-accelerometer-magnitude</h4>
<ul>
<li>time-gravity-accelerometer-magnitude-mean (variable 19)</li>
<li>time-gravity-accelerometer-magnitude-std  (variable 52)</li>
</ul>

<h4>8. time-body-accelerometer-jerk-magnitude</h4>
<ul> 
<li>time-body-accelerometer-jerk-magnitude-mean (variable 20)</li>
<li>time-body-accelerometer-jerk-magnitude-std  (variable 53)</li>
</ul> 

<h4>9. time-body-gyroscope-magnitude</h4>
<ul> 
<li>time-body-gyroscope-magnitude-mean (variable 21)</li>
<li>time-body-gyroscope-magnitude-std  (variable 54)</li>
</ul> 

<h4>10. time-body-gyroscope-jerk-magnitude</h4>
<ul> 
<li>time-body-gyroscope-jerk-magnitude-mean (variable 22)</li>
<li>time-body-gyroscope-jerk-magnitude-std  (variable 55)</li>
</ul> 

<h4>11. frequency-body-accelerometer</h4>
<ul>
<li>frequency-body-accelerometer-mean-x (variable 23)</li>
<li>frequency-body-accelerometer-mean-y (variable 24)</li>
<li>frequency-body-accelerometer-mean-z (variable 25)</li>
<li>frequency-body-accelerometer-std-x (variable 56)</li>
<li>frequency-body-accelerometer-std-y (variable 57)</li>
<li>frequency-body-accelerometer-std-z (variable 58)</li>
</ul>

<h4>12. frequency-body-accelerometer-jerk</h4>
<ul>
<li>frequency-body-accelerometer-jerk-mean-x (variable 26)</li>
<li>frequency-body-accelerometer-jerk-mean-y (variable 27)</li>
<li>frequency-body-accelerometer-jerk-mean-z (variable 28)</li>
<li>frequency-body-accelerometer-jerk-std-x  (variable 59)</li>
<li>frequency-body-accelerometer-jerk-std-y  (variable 60)</li>
<li>frequency-body-accelerometer-jerk-std-z  (variable 61)</li>
</ul>

<h4>13. frequency-body-gyroscope</h4> 
<ul>
<li>frequency-body-gyroscope-mean-x (variable 29)</li>
<li>frequency-body-gyroscope-mean-y (variable 30)</li>
<li>frequency-body-gyroscope-mean-z (variable 31)</li>
<li>frequency-body-gyroscope-std-x (variable 62)</li>
<li>frequency-body-gyroscope-std-y (variable 63)</li>
<li>frequency-body-gyroscope-std-z (variable 64)</li>
</ul>

<h4>14. frequency-body-accelerometer-magnitude</h4> 
<ul>
<li>frequency-body-accelerometer-magnitude-mean (variable 32)</li>
<li>frequency-body-accelerometer-magnitude-std  (variable 65)</li>
</ul>

<h4>15. frequency-body-accelerometer-jerk-magnitude</h4>
<ul>
<li>frequency-body-accelerometer-jerk-magnitude-mean (variable 33)</li>
<li>frequency-body-accelerometer-jerk-magnitude-std  (variable 66)</li>
</ul>

<h4>16. frequency-body-gyroscope-magnitude</h4>
<ul>
<li>frequency-body-gyroscope-magnitude-mean (variable 34)</li>
<li>frequency-body-gyroscope-magnitude-std  (variable 67)</li>
</ul>

<h4>17. frequency-body-gyroscope-jerk-magnitude</h4>
<ul>
<li>frequency-body-gyroscope-jerk-magnitude-mean (variable 35)</li>
<li>frequency-body-gyroscope-jerk-magnitude-std  (variable 68)</li>
</ul>

<h2>5. Sources</h2>

<p>[1] This codebook template was obtained from the DSS community site: https://gist.github.com/JorisSchut/dbc1fc0402f28cad9b41</p>

<p>[2] Why we should discard the Inertial Signals: https://class.coursera.org/getdata-031/forum/thread?thread_id=28</p>