## Description: This script takes the original data set referred to in the files CodeBook.md and README.md and produces a new data set with summary variables. Please refer to the files CodeBook.md and README.md for further details

rm(list=ls())# Cleaning up workspace before starting

# Data Download: Here we are downloading the original data
## set the url 
data_url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
# Set local filename where to download the data
local_data_filename <-"UCI_HAR_Dataser.zip" 
# Check if file already exists (only download the first time)
if(!file.exists(local_data_filename)){
  download.file(data_url,local_data_filename) # Download file
  unzip(local_data_filename) # unzip files
}else{
  warning(paste("File ",local_data_filename," already exists. Skipping download and unzip."))
}

## Data Loading: Here we load the various pieces of data that are necessary to produce the new data frame

# First get column names from file key
varnames<-unlist(read.table("UCI HAR Dataset/features.txt", header = FALSE)[2], use.names = FALSE)
# Extract only some variable names (because the assignment only asks for mean and std)
mean_vars_pos<-grep("^.*mean[(].*",varnames) # find position of variables containing the keyword mean
std_vars_pos<-grep("^.*std[(].*",varnames)# find position of variables containing the keyword std
vars_pos<-sort(c(mean_vars_pos,std_vars_pos))# gather and sort so that the mean variables and std variables appear in the original orderig (which is already nicely paired in logical groups)

# Process variable names to make them descriptive
## First we make a function to remove hiphens, parenthesis and convert abbreviations to full words. Note that I also changed Gyro to Angular velocity because that is the description in the original documentation
make_descriptive_name<-function(x){
  simplified_x<-sub("-mean[(][)]","Mean",x)
  simplified_x<-sub("-std[(][)]","STDeviation",simplified_x)
  simplified_x<-sub("-","",simplified_x)
  simplified_x<-sub("BodyBody","Body",simplified_x)
  simplified_x<-sub("Acc","Acceleration",simplified_x)
  simplified_x<-sub("Mag","Magnitude",simplified_x)
  simplified_x<-sub("Gyro","AngularVelocity",simplified_x)
  simplified_x
}
# Put the descriptive names in a new vector
descriptive_names<-vector('character') 
for(i in 1:length(varnames[vars_pos])){
  descriptive_names<-c(descriptive_names,make_descriptive_name(varnames[vars_pos][i]))
}

# Now load the actual tables of features 
## Load test set and extract relevant variables only
data_set1 <-read.table("UCI HAR Dataset/test/X_test.txt", header = FALSE)[,vars_pos]
colnames(data_set1)<-descriptive_names

## Get activities labels
activ_labels1<-as.factor(unlist(read.table("UCI HAR Dataset/test/y_test.txt", header = FALSE)[1],use.names=FALSE))
## Rename levels nicely
levels(activ_labels1)<-c("walking","walking upstairs","walking downstairs","sitting","standing","laying")
## Adding new column to the data set to label the activity
data_set1["ActivityType"]<- activ_labels1
## Get subject id label from another data file
subject_id1<-unlist(read.table("UCI HAR Dataset/test/subject_test.txt", header = FALSE)[1],use.names=FALSE)
## Adding new column to the data set to label the subject
data_set1["SubjectID"]<- subject_id1

# Repeat the procedure for the train set
# Load test set and extract relevant variables only
data_set2 <-read.table("UCI HAR Dataset/train/X_train.txt", header = FALSE)[,vars_pos]
colnames(data_set2)<-descriptive_names

## Get activities label
activ_labels2<-as.factor(unlist(read.table("UCI HAR Dataset/train/y_train.txt", header = FALSE)[1],use.names=FALSE))
## Name levels appropriately
levels(activ_labels2)<-c("walking","walking upstairs","walking upstairs","sitting","standing","laying")
## Adding values to new column
data_set2["ActivityType"]<- activ_labels2
## Get subject id label
subject_id2<-unlist(read.table("UCI HAR Dataset/train/subject_train.txt", header = FALSE)[1],use.names=FALSE)
## Adding values to new column
data_set2["SubjectID"]<- subject_id2

# Finally combine the two data sets
library(dplyr)
full_data_set<-tbl_df(rbind(data_set2,data_set1))
# Then form groups for each pair ("ActivityType","SubjectID") and average over the time series for each group
final_data_set<-full_data_set %>% group_by_at(vars(one_of(c("ActivityType","SubjectID")))) %>% summarise_all(mean) %>% arrange(ActivityType,SubjectID)

# Rename variables so that it is clear that these are transformed variables and that an average was computed. 
colnames(final_data_set)[3:length(colnames(final_data_set))]<-paste("Average",descriptive_names,sep="")
# Output data to file
final_data_set %>% write.table(.,file = "HumanActvRecogSmartPhones_averages_of_series.txt",row.names=FALSE)


