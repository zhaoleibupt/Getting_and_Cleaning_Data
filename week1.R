#Question 1
setwd("E:/")
url<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(url,"data.csv")
data<-read.csv("data.csv",header=TRUE)
str(data)
sum(data$VAL==24,na.rm=T)


#Question 3
url<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx"
download.file(url,"data.xlsx")
#将数据转化为csv(由于没有rjava的环境)
dat<-read.csv("data.csv",header=TRUE,skip=17,nrow=5)
sum(dat$Zip*dat$Ext,na.rm=T)


#Question 4
library(XML)
url <- "http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
doc <- xmlTreeParse(url, useInternal=TRUE)
rootNode <- xmlRoot(doc)
data<-xpathSApply(rootNode, "//zipcode", xmlValue)
table(data)


#Question 5
library(data.table)
url<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
download.file(url,"data.csv")
DT<-fread("data.csv")
DT[,mean(pwgtp15),by=SEX]

