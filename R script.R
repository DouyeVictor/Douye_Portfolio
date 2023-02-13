#title: Cyclistic Bike Share
#author: Douye Victor Orumieyefa

#This project is for the cyclistic bike share project

#Install/loading Packages tidyverse,janitor,lubridate,ggplot2

install.packages("tidyverse")
install.packages("janitor")
install.packages("lubridate")
install.packages("skimr")
install.packages("ggplot2")
install.packages("scales")
library("scales")
library("tidyverse")
library("janitor")
library("lubridate")
library("skimr")
library("ggplot2")

#import previous 12 months data

df1 <- read.csv("01_bikeshare.csv")
df2 <- read.csv("02_bikeshare.csv")
df3 <- read.csv("03_bikeshare.csv")
df4 <- read.csv("04_bikeshare.csv")
df5 <- read.csv("05_bikeshare.csv")
df6 <- read.csv("06_bikeshare.csv")
df7 <- read.csv("07_bikeshare.csv")
df8 <- read.csv("08_bikeshare.csv")
df9 <- read.csv("09_bikeshare.csv")
df10 <- read.csv("10_bikeshare.csv")
df11 <- read.csv("11_bikeshare.csv")
df12 <- read.csv("12_bikeshare.csv")

# combine 12 data frames into 1 data frame

bike_rides <- rbind(df1, df2, df3, df3, df4, df5, df6, df7, df8, df9, df10, df11, df12)
bike_rides <- janitor::remove_empty(bike_rides, which = c("cols"))
bike_rides <- janitor::remove_empty(bike_rides, which = c("rows"))
bike_rides <- bike_rides %>%
  select(started_at, ended_at, start_station_name, member_casual, rideable_type) %>%
  na.omit(start_station_name)


#converting Data/Time stamp to Date/Time

bike_rides$Ymd <- as.Date(bike_rides$started_at)
bike_rides$started_at <- lubridate::ymd_hms(bike_rides$started_at)
bike_rides$ended_at <- lubridate::ymd_hms(bike_rides$ended_at)

bike_rides$start_hour <- lubridate::hour(bike_rides$ended_at)
bike_rides$end_hour <- lubridate::hour(bike_rides$ended_at)

bike_rides$duration <-bike_rides$ended_at %--%
  bike_rides$started_at/hours(1)
df <- bike_rides %>% filter(duration > 0)
dim(bike_rides)
 
#Summarizing the data set
head(bike_rides)# first 6 rows the data frame
nrow(bike_rides)# number of rows in the data frame
colnames(bike_rides)# list of column names
dim(bike_rides)# dimensions of the data frame
summary (bike_rides)# statistical summary of data

 