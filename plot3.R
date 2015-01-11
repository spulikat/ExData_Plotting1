# This R Script generates a histogram plot using the Household Power Consumption dataset.

# Read in data from text file
powerdata <- read.csv("household_power_consumption.txt",sep=";",dec=".",na.strings="?",colClasses=c(rep("character",2),rep("numeric",7)));

# Create subset of data for Feb 1-2, 2007
powersubset <- subset(powerdata, Date =="1/2/2007" | Date == "2/2/2007");

# Convert date and time fields into a single datetime formatted field
powerdatetime <-paste(powersubset$Date,powersubset$Time);
powerdatetime <- strptime(powerdatetime,format="%d/%m/%Y %H:%M:%S");
powersubset <- cbind(powerdatetime,powersubset);

# Generate PNG file, default is 480 x 480
png(filename="plot3.png",bg="transparent");
with(powersubset,plot(powerdatetime,Sub_metering_1,type="l",
                      xlab="",ylab="Energy sub metering",col="black"));
lines(powersubset$powerdatetime,powersubset$Sub_metering_2, col="red");
lines(powersubset$powerdatetime,powersubset$Sub_metering_3, col="blue");

# Create a legend in the top right corner
legend("topright",lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_1","Sub_metering_3"));
dev.off();