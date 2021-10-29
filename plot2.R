# Assignment :
#The overall goal of this assignment is to explore the National Emissions Inventory database and see what it say about fine particulate matter pollution in the United states over the 10-year period 1999–2008. You may use any R package you want to support your analysis.

#Question 2
#Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 1999 to 2008? Use the base plotting system to make a plot answering this question.

#set packages
library(data.table)

#read in files
summarySCC_PM25 <- readRDS("~/Coursera/Exploratory_DA_A2/summarySCC_PM25.rds")
Source_Classification_Code <- readRDS("~/Coursera/Exploratory_DA_A2/Source_Classification_Code.rds")

#clean the file to reflect total emmisions by year
charmcity<- subset(summarySCC_PM25, summarySCC_PM25$fips == "24510")

Baltemiss<- aggregate(Emissions ~ year, data= charmcity, FUN = sum)

#making the plot
#  Open png file
png("plot2.png", width = 480, height = 480)

# Create the plot
plot(Baltemiss$year, Baltemiss$Emissions, type = "o", main = expression("Baltimore Emissions by Year"), ylab = expression("Baltimore Emissions"), xlab = "Year")

# Close the file
dev.off()
