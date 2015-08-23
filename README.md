<p>run_analysis.R was written for a Windows 32-bit operating system, with R version 3.2.0 installed.</p>

<p>The data.table and reshape2 packages need to be installed to be able to run the script.</p>


<p>To run the script (run_analysis.R), run_analysis.R needs to be sourced and the run_analysis() function needs to be run (where no argument has to be specified). 
Here, it is assumed that the data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip has not yet been downloaded or unzipped.
If the data has already been downloaded and the UCI HAR Dataset folder is present in the working directory, lines 1 to 15 of the code can be skipped and the code can be run from line 16 and onwards.</p>


<p>To read the tidy_dataset.txt file (which is both the output of the script and the file submitted for the first part of the assignment), save the file to your working directory and subsequently use the following two lines of code in R:</p>
<ul> 
<li>data <- read.table("tidy_dataset.txt", header = TRUE)</li>
<li>View(data)</li>
</ul>

<p>Further comments on why specific functions were used can be found inside the run_analysis.R file (per clarity, as it will be less easy to follow inside this README file).</p>



