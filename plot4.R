# Assignment :
#The overall goal of this assignment is to explore the National Emissions Inventory database and see what it say about fine particulate matter pollution in the United states over the 10-year period 1999–2008. You may use any R package you want to support your analysis.

#Question 4
#Across the United States, how have emissions from coal combustion-related sources changed from 1999–2008?

#set packages
library(data.table)
library(ggplot2)
library(dplyr)

#read in files
summarySCC_PM25 <- readRDS("~/Coursera/Exploratory_DA_A2/summarySCC_PM25.rds")
Source_Classification_Code <- readRDS("~/Coursera/Exploratory_DA_A2/Source_Classification_Code.rds")

##clean the file 
unique(Source_Classification_Code$EI.Sector)
#filter out "Coal"
coal<- Source_Classification_Code[Source_Classification_Code$EI.Sector %like% "- Coal",]
#left Join DTs to get emission info
coalemiss<- left_join(coal, summarySCC_PM25, by= "SCC")


coalEY<-aggregate(Emissions ~ year , coalemiss, sum)

#making the plot
#  Open png file
png("plot4.png", width = 480, height = 480)

# Create the plot

plot(coalEY$year, coalEY$Emissions, type = "o", main = expression("Coal Emissions by Year"), ylab = expression("Total Coal Emissions"), xlab = "Year")

# Close the file
dev.off()
