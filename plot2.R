## Exploratory Data Analysis, project #1
## Written by Adrienne Lehnert, July 8, 2015
## Create Plot 2

## Data is in the form:
## Date: Date in format dd/mm/yyyy
## Time: time in format hh:mm:ss
## Global_active_power: household global minute-averaged active power (in kilowatt)
## Global_reactive_power: household global minute-averaged reactive power (in kilowatt)
## Voltage: minute-averaged voltage (in volt)
## Global_intensity: household global minute-averaged current intensity (in ampere)
## Sub_metering_1: energy sub-metering No. 1 (in watt-hour of active energy). It corresponds to the kitchen, containing mainly a dishwasher, an oven and a microwave (hot plates are not electric but gas powered).
## Sub_metering_2: energy sub-metering No. 2 (in watt-hour of active energy). It corresponds to the laundry room, containing a washing-machine, a tumble-drier, a refrigerator and a light.
## Sub_metering_3: energy sub-metering No. 3 (in watt-hour of active energy). It corresponds to an electric water-heater and an air-conditioner.

data<-read.table("household_power_consumption.txt",header=TRUE,sep=';')      # Read data
data<-subset(data,Date=="1/2/2007" | Date=="2/2/2007")                       # Subset data, keeping desired dates
data$Global_active_power<-as.numeric(as.character(data$Global_active_power)) # Change text in Global_active_power to numeric
data$Timestamp<-strptime(paste(data$Date,data$Time),"%d/%m/%Y %H:%M:%S")     # Create column with combined Date/Time (timestamp)

with(data,plot(Timestamp,Global_active_power,type="n",xlab="",ylab="Global Active Power (kilowatts)")) # Initialize plot
lines(data$Timestamp,data$Global_active_power) # Add data to plot

dev.copy(png,file="plot2.png") # Copy plot to png file
dev.off() # close graphic device