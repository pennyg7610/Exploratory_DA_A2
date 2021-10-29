# Assignment :
#The overall goal of this assignment is to explore the National Emissions Inventory database and see what it say about fine particulate matter pollution in the United states over the 10-year period 1999–2008. You may use any R package you want to support your analysis.

#Question 3
#Of the four types of sources indicated by the "type" (point, nonpoint, onroad, nonroad) variable, which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City? Which have seen increases in emissions from 1999–2008? Use the ggplot2 plotting system to make a plot answer this question.

#set packages
library(data.table)
library(ggplot2)

#read in files
summarySCC_PM25 <- readRDS("~/Coursera/Exploratory_DA_A2/summarySCC_PM25.rds")
Source_Classification_Code <- readRDS("~/Coursera/Exploratory_DA_A2/Source_Classification_Code.rds")

#clean the file 
charmcity<- subset(summarySCC_PM25, summarySCC_PM25$fips == "24510")
charm_t_y<-aggregate(Emissions ~ year + type, charmcity, sum)

#making the plot
#  Open png file
png("plot3.png", width = 480, height = 480)

# Create the plot

baltimore<- ggplot(charm_t_y,aes(factor(year),Emissions,fill=type)) +
  geom_bar(stat="identity") +
  theme_bw() + guides(fill=FALSE)+
  facet_grid(.~type,scales = "free",space="free") + 
  labs(x="Year", y=expression("Total emissions")) + 
  labs(title=expression("Baltimore Emissions"))
print(baltimore)

# Close the file
dev.off()
