#Reading The data
File <- "~/Desktop/household_power_consumption.txt"
data <- read.table(File, header=TRUE, sep=";",stringsAsFactors = FALSE, na.string=".")

#getting the data from February 1-2, 2007
household <- data[as.Date(data$Date, format = "%d/%m/%Y") >= "2007/02/01" & as.Date(data$Date, format = "%d/%m/%Y") <= "2007/02/02" ,]

#Converting date and time
datetime <-strptime(paste(household$Date,household$Time,sep=" "), "%d/%m/%Y %H:%M:%S")

#converting global_active_power to numeric
household$Global_active_power <- as.numeric(household$Global_active_power)

#creating plot2
png("plot2.png", width=480, height=480)
plot(datetime,household$Global_active_power, type="l", xlab=" ", ylab="Global Active Power (kilowatts)")
dev.off()
