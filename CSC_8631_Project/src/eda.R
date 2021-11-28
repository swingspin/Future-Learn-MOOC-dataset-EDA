#Using library dplyr
library(dplyr)
#Using library ProjectTemplate
library('ProjectTemplate')
#Using library ProjectTemplate
library(ggplot2)
#setting up the working directory of The Project 
setwd("F:/data science/data exploratory module/New folder/CSC8631_PROJECT/CSC_8631_Project")
#loading the data of the project to work on it
#data named Cyber.security-video.stats
load.project()

#01-Finding the average drop in viewership from sept,2017 to sept,2018
#creating a data frame named drop_percentage
drop_percentage = as.data.frame(matrix(nrow = 0, ncol = 2));
#initializing loop for gaining data of data frame drop_percentage
for(i in 1:26){
  if(i %% 2 != 0){
    row <- c(Video_stats$step_position[i],
             ((Video_stats$total_views[i] - Video_stats$total_views[i + 1]) / Video_stats$total_views[i]
             ) * 100)
    drop_percentage <- rbind(drop_percentage,row)
    
   #print(((Video_stats$total_views[i]-Video_stats$total_views[i+1])/Video_stats$total_views[i])*100)
  }
}
colnames(drop_percentage) <- c("step_position", "percentage")
#print the drop_percentage matrix
drop_percentage


#drop_percentage %>% add_row(
 # step_position = Video_stats$step_position[i],
 # percentage = ((Video_stats$total_views[i]-Video_stats$total_views[i+1])/Video_stats$total_views[i])*100
#)

#average drop percentage 
average_drop = (sum(drop_percentage[,2])/13)
#hence the average_drop shows the average drop in viewership from sept,2017 to sept,2018 

#plotting the percentage_drop with respect to the step id of each part of the video lecture
barplot(drop_percentage$percentage ~ drop_percentage$step_position, xlab = "step_position", ylab = "percentage")

#cycle 02
#checking weather the yearly_drop from sept,2017 to sept,2018 has any correlation with mid_year_drop from sept,2017 to feb,2018
#01-Finding the average drop in viewership from sept,2017 to sept,2018
#creating a data frame named drop_percentage
drop_percentage_mid_yearly = as.data.frame(matrix(nrow = 0, ncol = 2));
#initializing loop for gaining data of data frame drop_percentage
for(i in 1:26){
  if(i %% 2 != 0){
    row <- c(Video_stats_Q1_Cycle02$step_position[i],
             ((Video_stats_Q1_Cycle02$total_views[i] - Video_stats_Q1_Cycle02$total_views[i + 1]) / Video_stats_Q1_Cycle02$total_views[i] ) * 100)
    drop_percentage_mid_yearly <- rbind(drop_percentage_mid_yearly,row)
    
    #print(((Video_stats$total_views[i]-Video_stats$total_views[i+1])/Video_stats$total_views[i])*100)
  }
}
colnames(drop_percentage_mid_yearly) <- c("step_position", "percentage")
#print the drop_percentage matrix
drop_percentage_mid_yearly


#drop_percentagee_mid_yearly %>% add_row(
# step_position = Video_stats$step_position[i],
# percentage = ((Video_stats$total_views[i]-Video_stats$total_views[i+1])/Video_stats$total_views[i])*100
#)

#average drop percentage 
average_drope_mid_yearly = (sum(drop_percentage_mid_yearly[,2])/13)
#hence the average_drop shows the average drop in viewership from sept,2017 to sept,2018 

#plotting the percentage_drop with respect to the step id of each part of the video lecture
barplot(drop_percentagee_mid_yearly$percentage ~ drop_percentage_mid_yearly$step_position, xlab = "step_position", ylab = "percentage")
