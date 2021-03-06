Code Book
-------------------------

## Data Set Information
The data set contains a tidied up version of the "Human Activity Recognition Using Smartphones Data Set" (http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

## Transformations from the original data set
We selected 68 features from each observations. We decided to ignore the data contained in the folders "Inertial Signals" for the training and test data, since we judged that that data was already contained and summarized in the other data files. We merged data from the files:

* train/X_train.txt, test/X_test.txt
  These data files contain observations from the 561 features listed in features.txt
* train/subject_train.txt, test/subject_test.txt
  These two files contain the subject data for the two data files above, describing which of the test subject performed the action which gave the observations.
* train/y_train.txt, test/y_test.txt
  These two data file give the action code for each of the actions performed by the subjects. There are 6 action codes, described in the file activity_labels.txt

To select which features to include in the tidy data set, we examined the features listed in features.txt. As requested in the assignment, we selected the mean and the standard deviation for each observation, which gave raise to 66 selected features.
Then we joined this data with the columns for the subjects and for the activity type, which was converted from the activity code to an activity name using the table contained in activity_levels.txt.

To create the averaged data file we aggregated the data by the subject code and the activity type and used the function "mean" to average the other columns and produce the CSV file averageData.csv.

## Description of the variables

The data set contained in the file tidyData.csv contains the following variables:
* "subject.code":   an integer [1:30] specifiying which of the test subjects 
                  performs the action giving rise to the observations
* "activity.name":  name of the activity that the subject is performing (Factor w/ 6 levels)

* "tbodyacc.mean.x" "tbodyacc.mean.y" "tbodyacc.mean.z"
	mean of the body acceleration in the 3 directions x,y,z


* "tbodyacc.std.x" "tbodyacc.std.y" "tbodyacc.std.z"
	standard deviations of the body acceleration in the 3 directions x,y,z


* "tgravityacc.mean.x" "tgravityacc.mean.y" "tgravityacc.mean.z"
	mean of the gravity acceleration in the 3 directions x,y,z

* "tgravityacc.std.x" "tgravityacc.std.y" "tgravityacc.std.z" 
	standard deviations of the gravity acceleration in the 3 directions x,y,z

* "tbodyaccjerk.mean.x" "tbodyaccjerk.mean.y" "tbodyaccjerk.mean.z"
	mean of the body jerk in the 3 directions x,y,z

* "tbodyaccjerk.std.x" "tbodyaccjerk.std.y" "tbodyaccjerk.std.z"
	standard deviation of the body jerk in the 3 directions x,y,z


* "tbodygyro.mean.x" "tbodygyro.mean.y" "tbodygyro.mean.z" 
	mean of the body angular momentum in the 3 directions x,y,z

* "tbodygyro.std.x" "tbodygyro.std.y" "tbodygyro.std.z" 
	standard deviation of the body angular momentum in the 3 directions x,y,z

* "tbodygyrojerk.mean.x" "tbodygyrojerk.mean.y" "tbodygyrojerk.mean.z" 
	mean of the body angular jerk in the 3 directions x,y,z

* "tbodygyrojerk.std.x" "tbodygyrojerk.std.y" "tbodygyrojerk.std.z"
	standard deviation of the body angular jerk in the 3 directions x,y,z

* "tbodyaccmag.mean": mean of the magnitude of the body acceleration
* "tbodyaccmag.std": standard deviation of the magnitude of the body acceleration

* "tgravityaccmag.mean": mean of the magnitude of the gravity acceleration
* "tgravityaccmag.std": standard deviation of the magnitude of the gravity acceleration

* "tbodyaccjerkmag.mean": mean of the magnitude of the body jerk
* "tbodyaccjerkmag.std": standard deviation of the magnitude of the body jerk

* "tbodygyromag.mean": mean of the magnitude of the angular momentum
* "tbodygyromag.std": standard deviation of the magnitude of the angular momentum

* "tbodygyrojerkmag.mean": mean of the magnitude of the angular jerk
* "tbodygyrojerkmag.std": standard deviation of the magnitude of the angular jerk 

* The remaining variables correspond to the previous ones, to which has been applied a Fast Fourier Transform:
"fbodyacc.mean.x" "fbodyacc.mean.y" "fbodyacc.mean.z" "fbodyacc.std.x"
"fbodyacc.std.y" "fbodyacc.std.z" "fbodyaccjerk.mean.x" "fbodyaccjerk.mean.y"
"fbodyaccjerk.mean.z" "fbodyaccjerk.std.x" "fbodyaccjerk.std.y" "fbodyaccjerk.std.z" 
"fbodygyro.mean.x" "fbodygyro.mean.y" "fbodygyro.mean.z" "fbodygyro.std.x"
"fbodygyro.std.y" "fbodygyro.std.z" "fbodyaccmag.mean" "fbodyaccmag.std"
"fbodybodyaccjerkmag.mean" "fbodybodyaccjerkmag.std" "fbodybodygyromag.mean"
"fbodybodygyromag.std" "fbodybodygyrojerkmag.mean" "fbodybodygyrojerkmag.std" 

Notes: 
======
- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.
