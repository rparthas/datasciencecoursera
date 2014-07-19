#quiz1
download.file('https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv','Fsso6hid.csv',method='curl')
data <-  data.table(read.csv('Fsso6hid.csv',header=T))
splits <- strsplit(colnames(data),'wgtp')
splits[123]

#quiz2
download.file('https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv','FGDP.csv',method='curl')
library(data.table)
gdp <- data.table(read.csv('FGDP.csv',skip=5,nrows=190,header=F))
mean(as.numeric(gsub(",","",gdp$V5)))

#quiz3
gdp <- data.table(read.csv('FGDP.csv',skip=5,nrows=190,header=F))
countryNames <- as.character(gdp$V4)
grep('^United',countryNames)

#quiz4
colnames(gdp) <- ('CountryCode','rank','V1','Country','USD','V2','V3','V4','V5','V6')
mergeddata <- merge(gdp,stats,by="CountryCode",all=T)
isFiscal <- grepl('^fiscal year end',tolower(mergeddata$Special.Notes))
isJune <- grepl('june',tolower(mergeddata$Special.Notes))
table(isFiscal,isJune)

#quiz5
library(quantmod)
amzn = getSymbols("AMZN",auto.assign=FALSE)
sampleTimes = index(amzn) 
summary(grepl('2012',sampleTimes))
addmargins(table(year(sampleTimes),weekdays(sampleTimes)))

