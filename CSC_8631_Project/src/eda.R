#Using library dplyr
library(dplyr)
#Using library ProjectTemplate
library('ProjectTemplate')
#Using library ProjectTemplate
library(ggplot2)
#setting up the working directory of The Project 
#setwd("F:/data science/data exploratory module/New folder/CSC8631_PROJECT/CSC_8631_Project")
#loading the data of the project to work on it
#data named Cyber.security-video.stats
load.project()

#01-Finding the average drop in viewership from sept,2017 to sept,2018

#Graphical representation of total views based on courses for 2 different months with a gap of a year
plot_j1 = ggplot(Video_stats, aes(as.character(step_position), total_views, fill = run_month_year, size=100))+
 geom_col(position = 'dodge') +
  ggtitle("Analysis of Total views of the courses between surveyed-months")
#Save the plot_j1 in the graphs directory
plot_j1
ggsave(file.path('graphs','plot_j1.png'))


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

#average_drop percentage 
average_drop = (sum(drop_percentage[,2])/13)
#hence the average_drop shows the average drop in viewership from sept,2017 to sept,2018 

#plotting the percentage_drop with respect to the step id of each part of the video lecture
png("graphs/dropplot_1.png", width=799, height = 600)
barplot(drop_percentage$percentage ~ drop_percentage$step_position, xlab = "step_position", ylab = "percentage")
dev.off()

#cycle 02
#checking whether the yearly_drop from september,2017 to september,2018 has any correlation with mid_year_drop from september,2017 to february,2018
#01-cycle 2 -Finding the average drop in viewership from sept,2017 to feb,2018

#Graphical representation of total views based on courses for 2 different months with a gap of a year
plot_j2 = ggplot(Video_stats_Q1_Cycle02, aes(as.character(step_position), total_views, fill = run_month_year))+geom_col(position = 'dodge') + 
  ggtitle("Analysis of Total views of the courses between months,half year apart")
#Save the plot_j2 in the graphs directory
plot_j2
ggsave(file.path('graphs','plot_j2.png'))

#creating a data frame named drop_percentage_mid_yearly
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



#average drop percentage 
average_drope_mid_yearly = (sum(drop_percentage_mid_yearly[,2])/13)
average_drope_mid_yearly
#hence the average_drop shows the average drop in viewership from sept,2017 to feb,2018 

#plotting the percentage_drop with respect to the step id of each part of the video lecture

png("graphs/dropplot_2.png", width=799, height = 600)
barplot(drop_percentage_mid_yearly$percentage ~ drop_percentage_mid_yearly$step_position, xlab = "step_position", ylab = "percentage")
dev.off()


#USE OF CORRELATION TO EXPLORE THE DATA and TO FIND CONCLUSIONS-------------------------------

#Q2_CYCLE-01 
#Have more people left at less percentage because of the length of the VIDEO
#Summary of VIEWED LENGTH OF EACH Video by Percentage Data
summary(Video_stats[,09:15])
#Using Correlation method to check about the relation between the length of the Videos and VIEWED LENGTH OF EACH Video by Percentage Data
#Using correlation across each pre_loaded different months runned file
cor(cyber.security.3_video.stats[,3], cyber.security.3_video.stats[,9:15])
cor(cyber.security.5_video.stats[,3], cyber.security.5_video.stats[,9:15])
cor(cyber.security.7_video.stats[,3], cyber.security.7_video.stats[,9:15])
#checking weather is there any major change in correlation data in the time difference of 1 year apart runned data collectively
cor(Video_stats_Q2_Cycle01[,3], Video_stats_Q2_Cycle01[,9:15])
#OR
#cor(Video_stats[,3], Video_stats[,9:15])

#checking whether is there any major change in correlation data in the time difference of 5months i.e. approx half year apart runned data collectively
cor(Video_stats_Q1_Cycle02[,3], Video_stats_Q1_Cycle02[,9:15])

#Q2_CYCLE-02

#Using Correlation on step_position and video_viewed_percentage for analysis and conclusions

#Using correlation across each pre_loaded different months runned file
cor(cyber.security.3_video.stats[,1], cyber.security.3_video.stats[,9:15])
cor(cyber.security.5_video.stats[,1], cyber.security.5_video.stats[,9:15])
cor(cyber.security.7_video.stats[,1], cyber.security.7_video.stats[,9:15])
#checking whether is there any major change in correlation data in the time difference of 1 year apart runned data collectively

cor(Video_stats[,1], Video_stats[,9:15])

#checking weather is there any major change in correlation data in the time difference of 5months i.e. approx half year apart runned data collectively
cor(Video_stats_Q1_Cycle02[,1], Video_stats_Q1_Cycle02[,9:15])

 

#More Analysis using Correlation 

#Analysis of total downloads made as transcripts,in the time difference of 1 year apart runned data collectively

cor(Video_stats[,5], Video_stats[,7])
#Using ggplot for visualization of this correlatoion
plot_A = ggplot(Video_stats, aes(total_downloads, total_transcript_views, color = run_month_year)) + geom_line() + 
  ggtitle("Analysis of total downloads made as transcripts")
plot_A
#Save the plot_A in the graphs directory
ggsave(file.path('graphs','plot_A.png'))

#Using Correlation for Analysis of total downloads made as transcripts,in the time difference of half year apart runned data collectively
cor(Video_stats_Q1_Cycle02[,5], Video_stats_Q1_Cycle02[,7])
#Using ggplot for visualization of this correlatoion
plot_B = ggplot(Video_stats_Q1_Cycle02, aes(total_downloads, total_transcript_views, color = run_month_year)) + geom_line() + 
  ggtitle("Analysis of total downloads made as transcripts")
plot_B
#Save the plot_B in the graphs directory
ggsave(file.path('graphs','plot_B.png'))

#EDA using graphical tool for analysis and TO FIND some conclusions------------------------------

#cycle_01
#Analysis of the courses based on views percentage from major regions using graphical tool for summary-taking data_files of one year apart for exploration

#Plot_G1 Europe view percentage for each courses on different months
plot_G1 = ggplot(Video_stats, aes(as.character(step_position), europe_views_percentage, color = run_month_year, size = 50)) + geom_point() +
  ggtitle("Analysis of the courses based on views percentage from Europe region",)
plot_G1
#Save the plot_G1 in the graphs directory
ggsave(file.path('graphs','plot_G1.png'))

#Plot_G1 Europe view percentage for each courses on different months
plot_G2 = ggplot(Video_stats, aes(as.character(step_position), asia_views_percentage, fill = viewed_onehundred_percent))+geom_col(position = 'dodge') + scale_fill_continuous(high = "#132B43", low = "#56B1F7") + labs(fill = "Viewed 100%") +
  ggtitle("Analysis of the courses based on views percentage from Asia region")
plot_G2
#Save the plot_G2 in the graphs directory
ggsave(file.path('graphs','plot_G2.png'))

#Plot_G1 Europe view percentage for each courses on different months
plot_G3 = ggplot(Video_stats, aes(as.character(step_position), north_america_views_percentage, color = run_month_year, size = 50)) + geom_point() +
  ggtitle("Analysis of the courses based on views percentage from North America region",)
plot_G3
#Save the plot_G3 in the graphs directory
ggsave(file.path('graphs','plot_G3.png'))


#cycle_02
#Analysis of the courses based on views percentage from major devices used using graphical tool for summary-taking data_files of one year apart for exploration

#Plot dv 1
plot_dv1 = ggplot(Video_stats, aes(total_views, desktop_device_percentage, color = run_month_year, size = total_views)) + geom_point() +
  ggtitle("Analysis of desktop users based on total views of the modules")
plot_dv1
#Save the plot_dv1 in the graphs directory
ggsave(file.path('graphs','plot_dv1.png'))

#Plot dv 2
plot_dv2 = ggplot(Video_stats, aes(total_views, mobile_device_percentage, color = run_month_year, size = total_views)) + geom_point() +
  ggtitle("Analysis of mobile users based on total views of the modules")
#Save the plot_dv2 in the graphs directory
ggsave(file.path('graphs','plot_dv2.png'))


#some more graphical analysis,to explore and understand data more by business perspective
#plot_x
plot_x = ggplot(Video_stats) + geom_col(aes( run_month_year, total_downloads, fill=factor(step_position)), position="dodge") + labs(fill = "Course modules") +
  ggtitle("Analysis of modules downloaded in different months")
plot_x
#Save the plot_x in the graphs directory
ggsave(file.path('graphs','plot_x.png'))

#plot_y
plot_y = ggplot(Video_stats_Q1_Cycle02) + geom_col(aes( run_month_year, total_downloads, fill=factor(step_position)), position="dodge") + labs(fill = "Course modules") +
  ggtitle("Analysis of modules downloaded in different months")
plot_y
#Save the plot_y in the graphs directory
ggsave(file.path('graphs','plot_y.png'))


#----------------x-----------------------------x------------------------x------------------------------x---------------------------------

