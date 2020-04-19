#Download, unzip and read in file.
download.file(url = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile="power_consumption.zip",method = "curl")
unzip("power_consumption.zip")
Household_Power_Consumption <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

#Format date and time columns.
Household_Power_Consumption$Date<-as.Date(Household_Power_Consumption$Date, format = "%d/%m/%Y")
Household_Power_Consumption$Time<-strptime(paste(Household_Power_Consumption$Date,Household_Power_Consumption$Time),"%F %T")

#Subset data between 2007-02-01 and 2007-02-02
Household_Power_Consumption<-subset(Household_Power_Consumption,Household_Power_Consumption$Date %in% as.Date(c("2007-02-01","2007-02-02")))

#Plot histogram of global active power consumption
plot1 <- hist(Household_Power_Consumption$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")

#Export as PNG (480px by 480px)
png("plot1.png", width = 480, height = 480, units = "px")
hist(Household_Power_Consumption$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")
dev.off()