run_analysis <- function(){                                                                             ## run_analysis.R was written for a Windows 32-bit operating system, with R version 3.2.0 installed.

        ## download the files:                                                                          ## Lines 5 to 12 can be skipped if the data has already been downloaded and unzipped in the working directory.
        
if(!file.exists(".\\data"))
        {dir.create(".\\data")}                                                                         ## If a directory called "data" is not yet present in the working directory, create it.                                                                                                               
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"     ## Store the URL from which the data needs to be downloaded in fileURL.
download.file(fileURL, "./data/samsung.zip", method = "libcurl")                                        ## Download the zipped data into the "data" directory.
dateDownloaded <- date()                                                                                
print(dateDownloaded)                                                                                   ## Print the date at which the data was downloaded.
setwd(".\\data")                                                                                        ## Set the working directory to the "data" directory.
unzip("samsung.zip")                                                                                    ## Unzip the downloaded .zip file.

        ## load the data.table package

library(data.table)

        ## training set:

setwd("~\\data\\UCI Har Dataset\\train")        
training_set <- read.table("X_train.txt", header = FALSE, stringsAsFactors = FALSE)                     ## Read in the training data. The variables take on values from -1 to 1. The dimensions are 7352 rows by 561 columns.
training_labels <- read.table("y_train.txt", header = FALSE, stringsAsFactors = FALSE)                  ## Read in the activity labels for the training data. Its range is from 1 to 6. The dimensions are 7352 rows by 1 column.     
training_subjects <- read.table("subject_train.txt", header = FALSE, stringsAsFactors = FALSE)          ## Each row of this file identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. The dimensions are 7352 rows by 1 column.

training_step1 <- cbind(training_labels[1], training_set)                                               ## Bind the activity labels to the left of the training data set.
training_set_final <- cbind(training_subjects, training_step1)                                          ## Bind the subject labels to the left of the training_step1 data set.
names(training_set_final)[1:2] <- c("subjectid", "activity")                                            ## Give the first two variables identifiable names (to be able to merge properly).

        ## test set:

setwd("~\\data\\UCI Har Dataset\\test")
test_set <- read.table("X_test.txt", header = FALSE, stringsAsFactors = FALSE)                          ## Read in the test data. The variables take on values from -1 to 1. The dimensions are 2947 rows by 561 columns.
test_labels <- read.table("y_test.txt", header = FALSE, stringsAsFactors = FALSE)                       ## Read in the training label. Its range is from 1 to 6. The dimensions are 2947 rows by 1 column.
test_subjects <- read.table("subject_test.txt", header = FALSE, stringsAsFactors = FALSE)               ## Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. The dimensions are 2947 rows by 1 column.                                                                            ## 
                                                              
test_step1 <- cbind(test_labels[1], test_set)                                                           ## Bind the appropriate activity labels to the left of the test data set.
test_set_final <- cbind(test_subjects, test_step1)                                                      ## Bind the appropriate subject labels to the left of the test_step1 data set.
names(test_set_final)[1:2] <- c("subjectid", "activity")                                                ## Give the first two variables identifiable names (to be able to merge properly).

        ## merging the two data sets:

total_data <- merge(training_set_final, test_set_final, all = TRUE)                                     ## The total dimensions are 563 columns (561 + subjectid + activity) by 10299 rows (7352 + 2947).
                             
        ## renaming the activities (second column):

activity_names <- c("WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING")       
total_data[,2] <- activity_names[total_data[,2]]                                                                                        ## 1-6 is mapped to "WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING".

        ## Renaming the variables by the names present in the "features.txt" file present in the main UCI HAR Dataset directory:

setwd("~\\data\\UCI Har Dataset")
features <- read.table("features.txt", header = FALSE, stringsAsFactors = FALSE)  
names(total_data) <- c("subjectid", "activity", features[,2])

        ## Extracts only the columns which contain the string "mean()" or the string "std()", using the grep function:

correct_column_numbers <- c(1, 2, grep("mean\\(\\)", names(total_data)), grep("std\\(\\)", names(total_data)))                          ## \\(\\) was used as regular expression for (); this might differ for a Mac OS.
smaller_data <- total_data[,correct_column_numbers]

        ## Cleaning up the names:

names(smaller_data) <- tolower(names(smaller_data))                                                     ## Make the names lower case
names(smaller_data) <- gsub("\\(\\)", "", names(smaller_data))                                          ## Removing ()
names(smaller_data) <- gsub("-", "", names(smaller_data))                                               ## Removing -
names(smaller_data) <- gsub("mean", "mean-", names(smaller_data))                                       ## Replace mean by mean-
names(smaller_data) <- gsub("std", "std-", names(smaller_data))                                         ## Replace std by std-
names(smaller_data) <- gsub("acc", "accelerometer-", names(smaller_data))                               ## Replace acc by accelerometer-     
names(smaller_data) <- gsub("jerk", "jerk-", names(smaller_data))                                       ## Replace jerk by jerk-
names(smaller_data) <- gsub("gravity", "gravity-", names(smaller_data))                                 ## Replace gravity by gravity-
names(smaller_data) <- gsub("gyro", "gyroscope-", names(smaller_data))                                  ## Replace gyro by gyroscope-
names(smaller_data) <- gsub("mag", "magnitude-", names(smaller_data))                                   ## Replace mag by magnitude-
names(smaller_data) <- gsub("bodybody", "body", names(smaller_data))                                    ## Replace bodybody by body
names(smaller_data) <- gsub("body", "body-", names(smaller_data))                                       ## Replace body by body-
names(smaller_data) <- gsub("^t", "time-", names(smaller_data))                                         ## Replace the t at the beginning of a name by time-
names(smaller_data) <- gsub("^f", "frequency-", names(smaller_data))                                    ## Replace the f at the beginning of a name by frequency-

        ## Create a second, independent tidy data set with the average of each variable for each activity and each subject:

library(reshape2)                                                                                       ## Using the melt + dcast combination,
melted_data <- melt(smaller_data, id = 1:2, measure.vars = 3:68)        
casted <- dcast(melted_data, subjectid + activity ~ variable, mean)                                     ## we have obtained a dataframe of 180 rows (30 subjects, 6 activities per subject) and 68 columns (subjectid + activity + 66 variables for mean and std). 

        ## The first two columns were made into factor variables, such that subsequent analyses can be performed more easily.
casted[,1] <- as.factor(casted[,1])   
casted[,2] <- as.factor(casted[,2])                                                                      

        ## Finally, write the tidy dataset to the UCI HAR Dataset main directory:
write.table(casted, file = "tidy_dataset.txt", row.names = FALSE)
}