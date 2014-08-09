# read the file from local location after downloading zip file
powerData <- read.table("/Users/dcosgrov/rstudio_work/Coursera/Data Exploration Course/household_power_consumption.txt",
                        col.names=c("sample_date","sample_time","global_active_power","global_reactive_power",
                                    "voltage","global_intensity","sub_metering_1",
                                    "sub_metering_2","sub_metering_3"),
                        sep=";",header=TRUE,skip=66636,nrows=2880,na.strings=c("?"))

powerData$sample_date_time <- strptime(paste(powerData$sample_date, powerData$sample_time),"%d/%m/%Y %H:%M:%S")

# Plot 4 - Plot of 4 different charts
png(filename='plot4.png', width=480, height=480, units='px')
par(mfrow = c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(powerData, 
{
  #Chart1  Global Active Power over time
  with(powerData, plot( sample_date_time, global_active_power, type="s", ylab="Global Active Power", xlab="", 
                        cex.lab=.7,cex.axis=.7))
  
  #Chart2 Voltage over time
  with(powerData, plot( sample_date_time, voltage, type="s", ylab="Voltage", xlab="datetime",
                        cex.lab=.7,cex.axis=.7))
  
  #Chart3 Energy sub metering over time
  with(powerData, plot( sample_date_time, sub_metering_1, type="s", xlab="", ylab="Energy sub metering",
                        cex.lab=.7,cex.axis=.7))
  with(powerData, lines( sample_date_time, sub_metering_2, col="red") )
  with(powerData, lines( sample_date_time, sub_metering_3, col="blue" ) )
  legend("topright",cex=.7,pch=NA,lty=1,lwd=1, bty="n", col=c("black","red","blue"), 
         legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3")) 
  
  #Chart4 Global Reactive Power over time
  with(powerData, plot( sample_date_time, global_reactive_power, type="s", ylab="Global_reactive_power", 
                        xlab="datetime", cex.lab=.7,cex.axis=.7))
})

dev.off()