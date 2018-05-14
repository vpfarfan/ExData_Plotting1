getwd()
setwd("E:/Cursos/DS JHopkins/ExData_Plotting1")
df <- read.delim('Data/household_power_consumption.txt', header=TRUE, sep=';', stringsAsFactors = FALSE)
df <- df[df$Date=='1/2/2007' | df$Date=='2/2/2007',]
df$DateTime <- paste(df$Date, df$Time)
df$DateTime <- strptime(df$DateTime, "%d/%m/%Y %H:%M:%S")

par(mfrow=c(1,1))
plot(df$DateTime, df$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")

dev.copy(png, 'plot2.png', width=480, height=480)
dev.off()
