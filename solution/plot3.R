# read the file from local location after downloading zip file
powerData <- read.table("/Users/dcosgrov/rstudio_work/Coursera/Data Exploration Course/household_power_consumption.txt",
                        col.names=c("sample_date","sample_time","global_active_power","global_reactive_power",
                                    "voltage","global_intensity","sub_metering_1",
                                    "sub_metering_2","sub_metering_3"),
                        sep=";",header=TRUE,skip=66636,nrows=2880,na.strings=c("?"))

powerData$sample_date_time <- strptime(paste(powerData$sample_date, powerData$sample_time),"%d/%m/%Y %H:%M:%S")

# Plot 3 - Energy sub metering by day of week
png(filename='plot3.png', width=480, height=480, units='px')
with(powerData, plot( sample_date_time, sub_metering_1, type="s", xlab="", ylab="Energy sub metering" ) )
with(powerData, lines( sample_date_time, sub_metering_2, col="red") )
with(powerData, lines( sample_date_time, sub_metering_3, col="blue" ) )
legend("topright",pch=NA,lty=1,lwd=1, col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))      
dev.off()