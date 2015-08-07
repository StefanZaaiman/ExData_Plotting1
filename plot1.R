# set the working directory
#setwd("C:/Users/Stefan/Desktop/ExData_Plotting1")
setwd("C:/Users/SZA/Desktop/ExData_Plotting1")

# read in the data
plotData = read.table("household_power_consumption.txt", sep=";", header = TRUE)

# convert Date field to actual dates
plotData$Date = as.Date(plotData$Date, format="%d/%m/%Y")

# Recode "?" to proper NA and make the Global Active Power field numeric
plotData$Global_active_power[plotData$Global_active_power=="?"] = NA
plotData$Global_active_power = as.numeric(as.character(plotData$Global_active_power))

# subset the dataset based on 2007-02-01 to 2007-02-02
plotData2=subset(plotData, Date == "2007-02-01" | Date == "2007-02-02")

## create plot1
# open the png file
png(filename = "plot1.png", width = 480, height = 480)

# do the plot
# the xlim and ylim commands forces the cutoff points of the axis
# the xaxp command forces the x axis tick marks to be only 0, 2, 4, and 6
# the cex command scales all the text to make it look closer to the example
hist(plotData2$Global_active_power, xlab=" Global active power (kilowatts)", 
									col="red", 
									main = "Global Active Power", 
									xlim=c(0,6), 
									ylim=c(0,1200), 
									xaxp = c(0,6,3),
									cex.lab=0.8, 
									cex.axis=0.8, 
									cex.main=0.9, 
									cex.sub=0.8)

# close the png file
dev.off()