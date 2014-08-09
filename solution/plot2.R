# read the file from local location after downloading zip file
powerData <- read.table("/Users/dcosgrov/rstudio_work/Coursera/Data Exploration Course/household_power_consumption.txt",
                        col.names=c("sample_date","sample_time","global_active_power","global_reactive_power",
                                    "voltage","global_intensity","sub_metering_1",
                                    "sub_metering_2","sub_metering_3"),
                        sep=";",header=TRUE,skip=66636,nrows=2880,na.strings=c("?"))

powerData$sample_date_time <- strptime(paste(powerData$sample_date, powerData$sample_time),"%d/%m/%Y %H:%M:%S")

# Plot 2 - Global Active Power (kilowatts) by day of week
png(filename='plot2.png', width=480, height=480, units='px')
with(powerData, plot( sample_date_time, global_active_power, type="s", ylab="Global Active Power (kilowatts)", xlab="" ))
dev.off()
