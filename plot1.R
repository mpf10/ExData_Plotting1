#Reading The data
File <- "~/Desktop/household_power_consumption.txt"
data <- read.table(File, header=TRUE, sep=";",stringsAsFactors = FALSE, na.string=".")

#changing the format of the variables
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data$Global_active_power <- as.numeric(data$Global_active_power)

#getting the data from February 1-2, 2007
household <- data[data$Date >= "2007/02/01" & data$Date <= "2007/02/02" ,]

#creating plot1
png("plot1.png", width=480, height=480)
hist(household$Global_active_power, border="black", col="red", main ="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency")
dev.off()

