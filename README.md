# DataCleaningProject2
Data-cleaning peer-reviewed project that cleans Samsung mobile phone data.

## Instructions

Running the analysis code from within this repository requires that the following
prerequisites have been met:

* R is installed
* RStudio is installed
* The working directory has been set to this repository's root from within either R
or RStudio.

After the previous steps have been completed, execution of the script can be performed 
by sourcing the 'run_analysis.R' script file.

e.g.

> source('./run_analysis.R')

The analysis script cleans, combines and filters the activity data , with the end result being
the cleaned activity data as well as a tidy data file being written into the root of this repository.


## Code Book

The variable names that have been provided for each observation center around the 
original feature labels, with cleanup performed by adding '.' and attempting to 
delineate time-domain versus frequency-domain measurements. 

Custom feature labels that were added include the subject's identifier, 
the identifier of the activity that was measured and a descriptive label
for each observed action (e.g. Walking, Standing, Sitting, etc..).

Any other details about the original data set can be found in the README.md in the activity_data folder.

###Variable Names Used         

* Activity.Subject.ID
* Activity.ID
* Time.Body.Acceleration.Average-X
* Time.Body.Acceleration.Average-Y
* Time.Body.Acceleration.Average-Z
* Time.Body.Acceleration.StdDeviation-X
* Time.Body.Acceleration.StdDeviation-Y
* Time.Body.Acceleration.StdDeviation-Z
* Time.Gravity.Acceleration.Average-X
* Time.Gravity.Acceleration.Average-Y
* Time.Gravity.Acceleration.Average-Z
* Time.Gravity.Acceleration.StdDeviation-X
* Time.Gravity.Acceleration.StdDeviation-Y
* Time.Gravity.Acceleration.StdDeviation-Z
* Time.Body.Acceleration.Jerk.Average-X
* Time.Body.Acceleration.Jerk.Average-Y
* Time.Body.Acceleration.Jerk.Average-Z
* Time.Body.Acceleration.Jerk.StdDeviation-X
* Time.Body.Acceleration.Jerk.StdDeviation-Y
* Time.Body.Acceleration.Jerk.StdDeviation-Z
* Time.Body.Gyro.Average-X
* Time.Body.Gyro.Average-Y
* Time.Body.Gyro.Average-Z
* Time.Body.Gyro.StdDeviation-X
* Time.Body.Gyro.StdDeviation-Y
* Time.Body.Gyro.StdDeviation-Z
* Time.Body.Gyro.Jerk.Average-X
* Time.Body.Gyro.Jerk.Average-Y
* Time.Body.Gyro.Jerk.Average-Z
* Time.Body.Gyro.Jerk.StdDeviation-X
* Time.Body.Gyro.Jerk.StdDeviation-Y
* Time.Body.Gyro.Jerk.StdDeviation-Z
* Time.Body.Acceleration.Mag.Average
* Time.Body.Acceleration.Mag.StdDeviation
* Time.Gravity.Acceleration.Mag.Average
* Time.Gravity.Acceleration.Mag.StdDeviation
* Time.Body.Acceleration.Jerk.Mag.Average
* Time.Body.Acceleration.Jerk.Mag.StdDeviation
* Time.Body.Gyro.Mag.Average
* Time.Body.Gyro.Mag.StdDeviation
* Time.Body.Gyro.Jerk.Mag.Average
* Time.Body.Gyro.Jerk.Mag.StdDeviation
* Frequency.Body.Acceleration.Average-X
* Frequency.Body.Acceleration.Average-Y
* Frequency.Body.Acceleration.Average-Z
* Frequency.Body.Acceleration.StdDeviation-X
* Frequency.Body.Acceleration.StdDeviation-Y
* Frequency.Body.Acceleration.StdDeviation-Z
* Frequency.Body.Acceleration.AverageFreq-X
* Frequency.Body.Acceleration.AverageFreq-Y
* Frequency.Body.Acceleration.AverageFreq-Z
* Frequency.Body.Acceleration.Jerk.Average-X
* Frequency.Body.Acceleration.Jerk.Average-Y
* Frequency.Body.Acceleration.Jerk.Average-Z
* Frequency.Body.Acceleration.Jerk.StdDeviation-X
* Frequency.Body.Acceleration.Jerk.StdDeviation-Y
* Frequency.Body.Acceleration.Jerk.StdDeviation-Z
* Frequency.Body.Acceleration.Jerk.AverageFreq-X
* Frequency.Body.Acceleration.Jerk.AverageFreq-Y
* Frequency.Body.Acceleration.Jerk.AverageFreq-Z
* Frequency.Body.Gyro.Average-X
* Frequency.Body.Gyro.Average-Y
* Frequency.Body.Gyro.Average-Z
* Frequency.Body.Gyro.StdDeviation-X
* Frequency.Body.Gyro.StdDeviation-Y
* Frequency.Body.Gyro.StdDeviation-Z
* Frequency.Body.Gyro.AverageFreq-X
* Frequency.Body.Gyro.AverageFreq-Y
* Frequency.Body.Gyro.AverageFreq-Z
* Frequency.Body.Acceleration.Mag.Average
* Frequency.Body.Acceleration.Mag.StdDeviation
* Frequency.Body.Acceleration.Mag.AverageFreq
* Frequency.Body.Body.Acceleration.Jerk.Mag.Average
* Frequency.Body.Body.Acceleration.Jerk.Mag.StdDeviation
* Frequency.Body.Body.Acceleration.Jerk.Mag.AverageFreq  
* Frequency.Body.Body.Gyro.Mag.Average                  
* Frequency.Body.Body.Gyro.Mag.StdDeviation              
* Frequency.Body.Body.Gyro.Mag.AverageFreq              
* Frequency.Body.Body.Gyro.Jerk.Mag.Average              
* Frequency.Body.Body.Gyro.Jerk.Mag.StdDeviation        
* Frequency.Body.Body.Gyro.Jerk.Mag.AverageFreq          
* Activity.Label    
