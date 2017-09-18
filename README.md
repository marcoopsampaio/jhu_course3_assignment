This repository contains the following files:
* **r_analysis.R**: R analysis script
* **HumanActvRecogSmartPhones_averages_of_series.txt**: Data file produced by r_analysis.R
* **CodeBook.md**: Code book describing the original data sources that were used to produce the data in HumanActvRecogSmartPhones_averages_of_series.txt, together with a descritpion of the naming conventions and a list of all the variables.

In the remainder we explain how the script that generated the data works and the steps of the analysis. To generate the data again only "r_analysis.R" needs to be ran in R.

## Analysis steps

### Step 1: Data loading
First the original data (see CodeBook.md) is downloaded and unpacked to a local directory. The main task that the script performs are:
* First we get column names from the original "features.txt" file
* Then only the features corresponding to mean and standard deviation are selected by using regular expressions filtering.
* Then the variable names are modified by filtering with regular expressions so  to remove hyphens, parenthesis and convert abbreviations to full words. Note that the abbreviation Gyro was changed to Angular velocity because that is the description in the original documentation (see also CodeBook.md).
* Then the two original data sets (train and test) are loaded into data frames with the descriptive column names. Columns with Activity type and subject ID columns are also added by reading the corresponding information from the original data files (y_test.txt,  y_train.txt for activity label and subject_test.txt, subject_train.txt for subject IDs)

### Step 2: Data combination and averaging

In a second step the two data sets are combined in one data frame. Then the data is gouped by ("ActivityType","SubjectID") pairs, and the data for each feature is averaged whitin each group. The data is exported to the data file "HumanActvRecogSmartPhones_averages_of_series.txt" with new variable names with a prefix "Average".

For further details on the variable names and their origin please refer to CodeBook.md.
