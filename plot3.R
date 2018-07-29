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

#creating plot3
png("plot3.png", width=480, height=480)
plot(datetime, household$Sub_metering_1 , type="l", xlab="",ylab="Energy Sub metering")
lines(datetime, household$Sub_metering_2 , col="red")
lines(datetime, household$Sub_metering_3 , col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2, col=c("black", "red", "blue"))
dev.off()
