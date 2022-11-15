#library things
library(tidyverse)
library(ggplot2)
library(dplyr)
library(stringr)

#1: time series, deaths vs victims 2016-2019

#read.csv data in
victimsdata <- read.csv("../data/childvictimstrend.csv")
deathsdata <- read.csv("../data/deathsdata.csv")
alldata <- merge(victimsdata, deathsdata, by = "Year")

# chart1 <- ggplot(victimsdata, aes(x = Year, y = National)) +
#   geom_line(data = victimsdata, aes(x = Year, y = National), col = "blue") +
#   geom_line(data = deathsdata, aes(x = Year, y = National * 450), col = "red") +
#   scale_y_continuous(sec.axis=sec_axis(~./450,name="Deaths")) +
#   labs(color = "Legend") +
#   scale_color_manual(values = colors)


chart1 <- ggplot(alldata, aes(x = Year)) +
  geom_bar(aes(y = National.x, fill = "Victims"), stat = "identity", position = "dodge") +
  geom_bar(aes(y= National.y * 200, fill = "Deaths"), stat = "identity", position = "dodge")+
  scale_y_continuous(sec.axis=sec_axis(~./200,name= "Deaths"), labs(x = "Victims"))

chart1
