
#pre-processing script.

#adding new column to the 1st data file
cyber.security.3_video.stats$run_month_year = "sept_2017"

#adding new column to the 2nd data file
cyber.security.7_video.stats$run_month_year = "sept_2018"

#combining the datafiles for data exploration purposes
#converting to a single data file
Video_stats = union_all(cyber.security.3_video.stats,cyber.security.7_video.stats)

#deleting the columns with no data entries
Video_stats = select(Video_stats, -antarctica_views_percentage)
Video_stats = select(Video_stats, -unknown_device_percentage)
#arranging the data 
Video_stats = arrange(Video_stats, step_position)

#adding new column to the data file of run 5 i.e. runned in feb_2018
cyber.security.5_video.stats$run_month_year = "feb_2018"

Video_stats_Q1_Cycle02= union_all(cyber.security.3_video.stats,cyber.security.5_video.stats)

#deleting the columns with no data entries
Video_stats_Q1_Cycle02 = select(Video_stats_Q1_Cycle02, -antarctica_views_percentage)
Video_stats_Q1_Cycle02 = select(Video_stats_Q1_Cycle02, -unknown_device_percentage)
#arranging the data 
Video_stats_Q1_Cycle02 = arrange(Video_stats_Q1_Cycle02, step_position)




