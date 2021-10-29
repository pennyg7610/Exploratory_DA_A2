# Assignment :
#The overall goal of this assignment is to explore the National Emissions Inventory database and see what it say about fine particulate matter pollution in the United states over the 10-year period 1999–2008. You may use any R package you want to support your analysis.

#Question 6
#Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources in Los Angeles County, California (fips == "06037"). Which city has seen greater changes over time in motor vehicle emissions?

#set packages
library(data.table)
library(ggplot2)
library(dplyr)

#read in files
summarySCC_PM25 <- readRDS("~/Coursera/Exploratory_DA_A2/summarySCC_PM25.rds")
Source_Classification_Code <- readRDS("~/Coursera/Exploratory_DA_A2/Source_Classification_Code.rds")

##clean the file 
mveh<- inner_join(Source_Classification_Code, summarySCC_PM25, by="SCC")
baltfil<-subset(mveh, mveh$fips == "24510")
calfil<-subset(mveh, mveh$fips == "06037")
bcveh<-rbind(baltfil, calfil)
veh<- subset(bcveh, bcveh$type == "ON-ROAD")

vehemiss<-aggregate(Emissions ~ year + fips, veh, sum)

#making the plot
#  Open png file
png("plot6.png", width = 480, height = 480)

# Create the plot

ggplot(vehemiss, aes(year, Emissions, col = fips)) +
  geom_line() +
  geom_point() +
  ggtitle(expression("Vehicle Emissions by Year")) +
  labs(x = "Year", y = expression( "Vehicle Emissions") ) +
  scale_colour_discrete(name = "City", labels = c("Los Angeles", "Baltimore")) +
  theme(legend.title = element_text(face = "bold"))

# Close the file
dev.off()
