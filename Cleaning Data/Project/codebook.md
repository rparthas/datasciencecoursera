# Codebook for Project - Getting And Cleaning Data
Author: Rajagopal Parthasarathi

##Variable Descriptions

##Dataset Structure

> ```str(tidy)```
>
>
> ```
>'data.frame':	2310 obs. of  9 variables:
 $ Person        : int  1 1 1 1 1 1 1 1 1 1 ...
 $ Activity      : Factor w/ 6 levels "LAYING","SITTING",..: 4 4 4 4 4 4 4 4 4 4 ...
 $ Axis          : chr  "X" "Y" "Z" "X" ...
 $ Domain        : chr  "Time" "Time" "Time" "Time" ...
 $ Feature       : chr  "Body" "Body" "Body" "Gravity" ...
 $ Jerk/Magnitude: chr  "NA" "NA" "NA" "NA" ...
 $ Device        : chr  "Accelerometer" "Accelerometer" "Accelerometer" "Accelerometer" ...
 $ Mean/Std      : chr  "Mean" "Mean" "Mean" "Mean" ...
 $ Average       : num  0.2657 -0.0183 -0.1078 0.7449 -0.0826 ...
> ``` 

> ```summary(tidy)```
>
>
> ```
> Person                    Activity       Axis              Domain            Feature          Jerk/Magnitude        Device         
 Min.   : 1.00   LAYING            :396   Length:2310        Length:2310        Length:2310        Length:2310        Length:2310       
 1st Qu.: 8.00   SITTING           :396   Class :character   Class :character   Class :character   Class :character   Class :character  
 Median :16.00   STANDING          :462   Mode  :character   Mode  :character   Mode  :character   Mode  :character   Mode  :character  
 Mean   :15.71   WALKING           :396                                                                                                 
 3rd Qu.:23.00   WALKING_DOWNSTAIRS:264                                                                                                 
 Max.   :30.00   WALKING_UPSTAIRS  :396                                                                                                 
   Mean/Std            Average       
 Length:2310        Min.   :-0.9953  
 Class :character   1st Qu.:-0.7348  
 Mode  :character   Median :-0.6271  
                    Mean   :-0.5090  
                    3rd Qu.:-0.3756  
                    Max.   : 0.9084 
> ```

##Sample Data
> ```head(tidy)```
> 
>
> ```
> Person Activity Axis Domain Feature Jerk/Magnitude        Device Mean/Std     Average
1        1  WALKING    X   Time    Body             NA Accelerometer     Mean  0.26569692
36       1  WALKING    Y   Time    Body             NA Accelerometer     Mean -0.01829817
71       1  WALKING    Z   Time    Body             NA Accelerometer     Mean -0.10784573
106      1  WALKING    X   Time Gravity             NA Accelerometer     Mean  0.74486741
141      1  WALKING    Y   Time Gravity             NA Accelerometer     Mean -0.08255626
176      1  WALKING    Z   Time Gravity             NA Accelerometer     Mean  0.07233987
> ```
