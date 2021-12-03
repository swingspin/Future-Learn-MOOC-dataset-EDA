
## Introduction

With the rise in specialization in the cyber security,there is an increase in interest of learning it for career growth in candidates. With the more day in and day out usage of Internet and due to unprecended times most of the Universities have decided to make the course available via online sessions.As the course is delivered via online mode, These online learnings are recorded in order to improve the course handling. The online activities of enrollments, survey response, leaving survey response, question response, step activity and statistics of viewing the videos are recorded and stored in the Future Learn MOOC dataset.

This report consists of a analysis that is made on the statistics of viewing of the videos. So, in this report we will try to answer questions like,Finding the average drop in viewership, Have more people left at less percentage because of the length of the VIDEO?,analysis is done on step_position and video_viewed_percentage wise for conclusions and graphical tool for analysis and conclusions.

## 2. Objectives or goals.

* 2(a). Business Understading
This step is primarily concerned with the business perspective and its needs. Following an assessment of the scenario, such as data availability, the study is concerened to questions like Finding the average drop in viewership,Have more people left at less percentage because of the length of the VIDEO?, generally in which type of videos people leave?,are downloaded are mostly as a transcript type in all the files etc and according to it prepare a report that will assist the institute in improving course content and overall involvement.

* 2(b)Data analyzing
The second step in the CRISP DM process is to understand the data. The primary purpose of this step is to discover, gather, and assess the data set provided by FutureLearn. The full data set was loaded into Project Template using R. To purify the data further, it was examined once it was loaded to determine the data type, number of records, and noise level. In this step, FutureLearn created visuals for learning metrics, which it can utilise to improve the course process.

* 2(C)Data Pre-processing
The third step following is data Pre-processing . It's also known as data munging. In this stage, the final data set for the visualisation challenge was created. The entire data set was cleansed of unnecessary information. The selected data was cleaned and compiled in accordance with the requirements. The data was consolidated after it was separated into multiple files, and joins were used in some circumstances. For mathematical calculations, the data was additionally formatted, with string numbers being converted to numeric values.

* 2(d)Modelling and Evaluation
This level mostly involves machine learning and statistics. The initial step in the modelling process is to identify techniques, which could include algorithms like correlation and use of graphical tool like ggplot. Evaluation can be used to determine whether these models meet the business criteria. However, evaluation process is not included in this study because the focus is on data analysis.

* 2(e)Deployement
During the deployment phase, the report is created, which includes the data analysis and the final presentation for the outcome following CRISP-DM methodology.

## 3. Steps to execute this Project.
1. Download/fork/clone the project by clicking [here](https://github.com/swingspin/CSC8631_PROJECT) and place all the data files in ./data/ directory or simply unzip the project folder provided(it already has all the data).
2. Open RStudio
3. Set the working directory with the command setwd("path/where/you/downloaded/the/project/file") or go to the sessions tab in the top menu bar, go to set working directory, and then select directory (Session > Set Working Directory > Choose directory).
5. Open this project and navigate to ./reports/210468180_Report.Rmd.
6. Click on Knit which will perform all the data munging and data analysis and provide the output report in pdf format.