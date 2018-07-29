#Reading The data
File <- "~/Desktop/household_power_consumption.txt"
data <- read.table(File, header=TRUE, sep=";",stringsAsFactors = FALSE, na.string=".")

#getting the data from February 1-2, 2007
household <- data[as.Date(data$Date, format = "%d/%m/%Y") >= "2007/02/01" & as.Date(data$Date, format = "%d/%m/%Y") <= "2007/02/02" ,]

#Converting date and time
datetime <-strptime(paste(household$Date,household$Time,sep=" "), "%d/%m/%Y %H:%M:%S")

#converting variables to numeric
household$Global_active_power <- as.numeric(household$Global_active_power)
household$Sub_metering_1 <- as.numeric(household$Sub_metering_1)
household$Sub_metering_2 <- as.numeric(household$Sub_metering_2)
household$Sub_metering_3 <- as.numeric(household$Sub_metering_3)
household$Global_reactive_power <- as.numeric(household$Global_reactive_power)
household$Voltage <- as.numeric(household$Voltage)

#creating plot4
png("plot4.png", width=480, height=480)
par(mfrow =c(2,2)) 

##plot 1 - Global active power
plot(datetime,household$Global_active_power, type="l", xlab=" ", ylab="Global Active Power")

##plot 2 - voltage
plot(datetime,household$Voltage, type="l", xlab="datetime", ylab="Voltage")

##plot 3 - Enery sub metering
plot(datetime, household$Sub_metering_1 , type="l", xlab="",ylab="Energy Sub metering")
lines(datetime, household$Sub_metering_2 , col="red")
lines(datetime, household$Sub_metering_3 , col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd=2, col=c("black", "red", "blue"))

##plot 4 - Global reactive power
plot(datetime,household$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()
