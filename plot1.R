# Assignment :
#The overall goal of this assignment is to explore the National Emissions Inventory database and see what it say about fine particulate matter pollution in the United states over the 10-year period 1999–2008. You may use any R package you want to support your analysis.

#Question 1
#Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? Using the base plotting system, make a plot showing the total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008.

#set packages
library(data.table)

#read in files
summarySCC_PM25 <- readRDS("~/Coursera/Exploratory_DA_A2/summarySCC_PM25.rds")
Source_Classification_Code <- readRDS("~/Coursera/Exploratory_DA_A2/Source_Classification_Code.rds")

#clean the file to reflect total emmisions by year

totalemiss<- aggregate(Emissions ~ year, data= summarySCC_PM25, FUN = sum)

#making the plot
#  Open png file
png("plot1.png", width = 480, height = 480)

# Create the plot
plot(totalemiss$year, totalemiss$Emissions, type = "o", main = expression("Emissions by Year"), ylab = expression("Total US Emissions"), xlab = "Year")

# Close the file
dev.off()
