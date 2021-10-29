# Assignment :
#The overall goal of this assignment is to explore the National Emissions Inventory database and see what it say about fine particulate matter pollution in the United states over the 10-year period 1999–2008. You may use any R package you want to support your analysis.

#Question 5
#How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?

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
veh<- baltfil[baltfil$EI.Sector %like% "Vehicles",]
#same result 
veh<- subset(veh, veh$type == "ON-ROAD")

balvehemiss<-aggregate(Emissions ~ year , veh, sum)

#making the plot
#  Open png file
png("plot5.png", width = 480, height = 480)

# Create the plot

plot(balvehemiss$year, balvehemiss$Emissions, type = "o", main = expression("Baltimore Vehicle Emissions by Year"), ylab = expression("Total Vehicle Emissions"), xlab = "Year")

# Close the file
dev.off()
