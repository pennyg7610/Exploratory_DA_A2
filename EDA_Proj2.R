# Assignemnt :
#The overall goal of this assignment is to explore the National Emissions Inventory database and see what it say about fine particulate matter pollution in the United states over the 10-year period 1999–2008. You may use any R package you want to support your analysis.

#set packages
library(data.table)
library(ggplot2)

#read in files
summarySCC_PM25 <- readRDS("~/Coursera/Exploratory_DA_A2/summarySCC_PM25.rds")
Source_Classification_Code <- readRDS("~/Coursera/Exploratory_DA_A2/Source_Classification_Code.rds")

#clean the file



#making the plot
#  Open png file
png("plot1.png", width = 480, height = 480)

# Create the plot
hist(power$Global_active_power, main="Global Active Power", xlab = "Global Active Power (kilowatts)", col="red")

# Close the file
dev.off()