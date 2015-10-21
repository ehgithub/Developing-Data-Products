Hospital Data Visualization
========================================================
author: Edgar Hamon
date: Oct / 2015
transition:rotate


Hospital Data Vislualization - Intro
========================================================
This application uses the data collected at "Hospital Comapare" website (http://hospitalcompare.hhs.gov) which contains information about quality care at over 4.000 certified hospitals in the USA.

The specific dataset used by this application is the "outcome-of-care-measures.csv" than can be found in the website above. It contains information about 30 days mortality and readmission rates for several health or medical conditions over 4.000 hospitals

The idea of this App is to offer a visual comparison of the outcome of care of the different hospitals allowing users to select one specific medical condition and one or many states. It will show data in table and graph views of the best and worst outcome hospitals based on user's selection.



Data facts and exploration 
========================================================
- Data contains 4.706 observations of 46 variables

```r
data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
dim (data)
```

```
[1] 4706   46
```

- For the purpose of this application, we are interested in mortality rates for Heart Attack, Heart Failure and Pneumonia. We remove unnecessary columns and keep some minimal basic Hospital information and the mortality rates mentioned before. Our final dataset contains 4.706 observations of 10 variables


```
[1] 4706   10
```



App Features
========================================================

This application offers the following features: 

- User can select the medical condition and the State (or States) of his interest in the left panel of the app. Also, there are action buttons that allow to "select all" or "clear all" states.

- Information is presented in tablular fashion based on user selections, using the "Dataset" tab in the app.

- Information can be viewed in graphical fashion based on user selection using the "Vislualize the data" tab. In this view users can see plots of lower and higher mortality rates, as well as summary staticstical information.



Plot Sample
========================================================
<small> This is a sample of one of the plots render by the application. This sample shows the top 10 hospitals with lower mortality rates in NJ for Heart Attack.

Note: Exact display might vary.
</small>

![plot of chunk unnamed-chunk-3](HospViz-figure/unnamed-chunk-3-1.png) 
