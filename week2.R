
#Question 2
library(sqldf)
url<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
download.file(url,"data.csv")
acs<-read.csv("data.csv")
sqldf("select pwgtp1 from acs where AGEP < 50")

#Question 3
library(sqldf)
url<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
download.file(url,"data.csv")
acs<-read.csv("data.csv")
sqldf("select distinct AGEP from acs")


#Question 4
hurl <- "http://biostat.jhsph.edu/~jleek/contact.html" 
con <- url(hurl)
htmlCode <- readLines(con)
nchar(htmlCode[c(10, 20, 30,100)])


#Qustion 5
url<-"https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for"
download.file(url,"data.for")
data<-read.fwf("data.for",widths=c(-1,9,-5,4,4,-5,4,4,-5,4,4,-5,4,4),skip=4)
sum(data[,4])

