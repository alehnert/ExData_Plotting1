## Exploratory Data Analysis, project #1
## Written by Adrienne Lehnert, July 8, 2015
## Create Plot 4

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
data$Voltage<-as.numeric(as.character(data$Voltage))                         # Change text in Voltage to numeric
data$Global_reactive_power<-as.numeric(as.character(data$Global_reactive_power)) # Change text in Global_reactive_power to numeric
data$Sub_metering_1<-as.numeric(as.character(data$Sub_metering_1)) # Change text in Sub_metering_1 to numeric
data$Sub_metering_2<-as.numeric(as.character(data$Sub_metering_2)) # Change text in Sub_metering_2 to numeric
data$Sub_metering_3<-as.numeric(as.character(data$Sub_metering_3)) # Change text in Sub_metering_3 to numeric
data$Timestamp<-strptime(paste(data$Date,data$Time),"%d/%m/%Y %H:%M:%S")     # Create column with combined Date/Time (timestamp)

png(file="plot4.png") # Create png file. note: plot4.R does not print to screen, only png file

# Initialize plot
par(mfrow=c(2,2))

# Create top left plot (same as plot2)
with(data,plot(Timestamp,Global_active_power,type="n",xlab="",ylab="Global Active Power (kilowatts)")) # Initialize plot
lines(data$Timestamp,data$Global_active_power) # Add data to plot

# Create top right plot
with(data,plot(Timestamp,Voltage,type="n",xlab="datetime",ylab="Voltage"))
lines(data$Timestamp,data$Voltage)

# Create bottom left plot (same as plot3)
with(data,plot(Timestamp,Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")) # Initialize plot
lines(data$Timestamp,data$Sub_metering_1) # Add sub_metering 1 data
lines(data$Timestamp,data$Sub_metering_2,col="red") # Add sub_metering 2 data
lines(data$Timestamp,data$Sub_metering_3,col="blue") # Add sub_metering 3 data
legend(x="topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"),lwd=1) # Create Legend

# Create bottom right plot
with(data,plot(Timestamp,Global_reactive_power,type="n",xlab="datetime"))
lines(data$Timestamp,data$Global_reactive_power)

dev.off() # close graphic device
