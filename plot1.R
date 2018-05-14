getwd()
setwd("E:/Cursos/DS JHopkins/ExData_Plotting1")
df <- read.delim('Data/household_power_consumption.txt', header=TRUE, sep=';', stringsAsFactors = FALSE)
df <- df[df$Date=='1/2/2007' | df$Date=='2/2/2007',]
df$Global_active_power <- as.double(df$Global_active_power)

par(mfrow=c(1,1))
hist(df$Global_active_power, col="red", main="Global Active Power"
     , xlab = "Global Active Power(kilowatts)")

dev.copy(png, 'plot1.png', width=480, height=480)
dev.off()
