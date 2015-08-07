# set the working directory
#setwd("C:/Users/Stefan/Desktop/ExData_Plotting1")
setwd("C:/Users/SZA/Desktop/ExData_Plotting1")

# read in the data
plotData = read.table("household_power_consumption.txt", sep=";", header = TRUE)

# combine date and time into one factor
plotData$datetime = with(plotData, interaction(Date, Time, sep = " "))

# convert datetime field to actual dates and times
plotData$datetime = strptime(plotData$datetime, "%d/%m/%Y %H:%M:%S")


# convert Date field to actual dates (used for subsetting)
plotData$Date = as.Date(plotData$Date, format="%d/%m/%Y")

# Recode "?" to proper NA and make the Global Active Power field numeric
plotData$Global_active_power[plotData$Global_active_power=="?"] = NA
plotData$Global_active_power = as.numeric(as.character(plotData$Global_active_power))

# subset the dataset based on 2007-02-01 to 2007-02-02
plotData2=subset(plotData, Date == "2007-02-01" | Date == "2007-02-02")

## create plot2
# open the png file
png(filename = "plot2.png", width = 480, height = 480)

# do the plot
# the cex command scales all the text to make it look closer to the example
plot(plotData2$datetime, plotData2$Global_active_power, ylab="Global Active Power (kilowatts)", 
														xlab = "", 
														typ = "l",
														cex.lab=0.8, 
														cex.axis=0.8, 
														cex.main=0.9, 
														cex.sub=0.8)

# close the png file
dev.off()