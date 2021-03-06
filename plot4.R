########################################################################################################################

# the following commented lines of code were used to create the dataset. GitHub would not let me upload the original 
# file due to its file size so I created a separate csv file and work with that.

## read in subset of data
#dset <- read.table(pipe('grep "^[1-2]/2/2007" "household_power_consumption.txt"'),sep=";",na.strings = "?")

## get variable names from data file
#varnames <- names(read.table("household_power_consumption.txt",header = TRUE, sep=";",nrow=1))

## name variables
#names(dset) <- varnames

## create new date time variable using strptime and as.Date
#dset$Date <- as.Date(dset$Date,"%d/%m/%Y")
#dset$datetime <- with(dset,strptime(paste(Date,Time), format="%Y-%m-%d %H:%M:%S"))
#write.csv(dset,file="dset.csv")

########################################################################################################################

# now read in the actual data set

dset <- read.csv("dset.csv")

# plot graphs
par(mfrow=c(2,2))
with(dset,plot(datetime,Global_active_power,ylab="Global Active Power (Kilowatts)",xlab="",type = "l"))
with(dset,plot(datetime,Voltage,ylab="Voltage",xlab="datetime",type="l"))
with(dset,plot(datetime,Sub_metering_1,type="l",col="black",xlab="",ylab="Energy sub metering"))
with(dset,points(datetime,Sub_metering_2,type="l",col="red"))
with(dset,points(datetime,Sub_metering_3,type="l",col="blue"))
plot(dset$datetime,dset$Global_reactive_power,type="l",ylab="Global_reactive_power",xlab="datetime")
dev.copy(png,file="plot4.png")
dev.off()
par(mfrow=c(1,1))
