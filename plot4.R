getwd()
setwd("E:/Cursos/DS JHopkins/ExData_Plotting1")
df <- read.delim('Data/household_power_consumption.txt', header=TRUE, sep=';', stringsAsFactors = FALSE)
df <- df[df$Date=='1/2/2007' | df$Date=='2/2/2007',]

df$Global_active_power <- as.double(df$Global_active_power)
df$Global_reactive_power <- as.double(df$Global_reactive_power)
df$Voltage <- as.double(df$Voltage)
df$Sub_metering_1 <- as.double(df$Sub_metering_1)
df$Sub_metering_2 <- as.double(df$Sub_metering_2)
df$Sub_metering_3 <- as.double(df$Sub_metering_3)

df$datetime <- paste(df$Date, df$Time)
df$datetime <- strptime(df$datetime, "%d/%m/%Y %H:%M:%S")

png('plot4.png', width=480, height=480)
par(mfrow=c(2,2))
plot(df$datetime, df$Global_active_power, type="l", xlab="", ylab="Global Active Power")
plot(df$datetime, df$Voltage, type="l", xlab="datetime", ylab="Voltage")
plot(df$datetime, df$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(df$datetime, df$Sub_metering_2, col="red")
lines(df$datetime, df$Sub_metering_3, col="blue")
legend("topright", inset=0.01, c("Sub_metering_1","Sub_metering_2", "Sub_metering_3")
       , lty=c(1,1), lwd=2, col=c("black","red","blue"), box.lty=0)
with(df,plot(datetime, Global_reactive_power, type="l"))

dev.off()
