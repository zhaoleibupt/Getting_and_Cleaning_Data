# week4

##Question 1

```r
data1<-read.csv("data1.csv")
a<-names(data1)
strsplit(a,"wgtp")[123]
```

```
## [[1]]
## [1] ""   "15"
```

##Question 2

```
## [1] 377652.4
```


##Question 3

```r
countryNames<-GDP$Long.Name
grep("^United",countryNames)
```

```
## [1]  1  6 32
```


##Question 4

```r
library(dplyr)
```

```
## 
## Attaching package: 'dplyr'
## 
## The following objects are masked from 'package:stats':
## 
##     filter, lag
## 
## The following objects are masked from 'package:base':
## 
##     intersect, setdiff, setequal, union
```

```r
GDP<-read.csv("GDP.csv",skip=5,header=F,nrow=190)
GDP<-GDP[,c(1,2,4,5)]
names(GDP)<-c("CountryCode","ranking","Long.Name","GDP")

edu<-read.csv("edu.csv")
data2<-inner_join(GDP,edu,by="CountryCode")
```

```
## Warning in inner_join_impl(x, y, by$x, by$y): joining factors with
## different levels, coercing to character vector
```

```r
isFiscalYearEnd <- grepl("fiscal year end", tolower(data2$Special.Notes))
isJune <- grepl("june", tolower(data2$Special.Notes))
table(isFiscalYearEnd,isJune)
```

```
##                isJune
## isFiscalYearEnd FALSE TRUE
##           FALSE   155    3
##           TRUE     18   13
```


##Question 5

```r
library(quantmod)
```

```
## Loading required package: xts
## Loading required package: zoo
## 
## Attaching package: 'zoo'
## 
## The following objects are masked from 'package:base':
## 
##     as.Date, as.Date.numeric
## 
## 
## Attaching package: 'xts'
## 
## The following objects are masked from 'package:dplyr':
## 
##     first, last
## 
## Loading required package: TTR
## Version 0.4-0 included new data defaults. See ?getSymbols.
```

```r
amzn = getSymbols("AMZN",auto.assign=FALSE)
```

```
##     As of 0.4-0, 'getSymbols' uses env=parent.frame() and
##  auto.assign=TRUE by default.
## 
##  This  behavior  will be  phased out in 0.5-0  when the call  will
##  default to use auto.assign=FALSE. getOption("getSymbols.env") and 
##  getOptions("getSymbols.auto.assign") are now checked for alternate defaults
## 
##  This message is shown once per session and may be disabled by setting 
##  options("getSymbols.warning4.0"=FALSE). See ?getSymbols for more details.
```

```
## Warning in download.file(paste(yahoo.URL, "s=", Symbols.name, "&a=",
## from.m, : downloaded length 156749 != reported length 200
```

```r
sampleTimes = index(amzn)
sample<- as.Date(sampleTimes, "%Y%m%d")
addmargins(table(substr(sampleTimes,1,4),weekdays(sample)))
```

```
##       
##        星期二 星期三 星期四 星期五 星期一  Sum
##   2007     50     51     51     51     48  251
##   2008     52     53     50     50     48  253
##   2009     52     52     51     49     48  252
##   2010     52     52     51     50     47  252
##   2011     52     52     51     51     46  252
##   2012     50     51     51     51     47  250
##   2013     52     51     50     51     48  252
##   2014     52     52     50     50     48  252
##   2015     48     48     47     47     44  234
##   Sum     460    462    452    450    424 2248
```

