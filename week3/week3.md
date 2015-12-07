# week3

##Question 1

```r
data1<-read.csv("data1.csv")
agricultureLogica<-(data1$ACR==3) & (data1$AGS==6)
head(which(agricultureLogica==TRUE),3)
```

```
## [1] 125 238 262
```


##Question 2

```r
#由于利用download.file下载图片有问题，所以利用本地下载进行处理图片
library(jpeg)
img<-readJPEG("jeff.jpg",native=T)
quantile(img,probs=c(0.3,0.8))
```

```
##       30%       80% 
## -15259150 -10575416
```


##Question 3

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
dim(data2)[1]
data3<-arrange(data2,desc(ranking))
data3[13,]$Long.Name.x
```


##Question 4

```r
#题目3中的得到的data2为最终合并结果，本题目以及下一个题目就是以此为基础进行的
tapply(data2$ranking,data2$Income.Group,mean)
```

```
##                      High income: nonOECD    High income: OECD 
##                   NA             91.91304             32.96667 
##           Low income  Lower middle income  Upper middle income 
##            133.72973            107.70370             92.13333
```

##Question 5

```r
data2$ranking1<-cut(data2$ranking,breaks=quantile(data2$ranking,probs=c(0,0.2,0.4,0.6,0.8,1),na.rm=T))
table(data2$Income.Group,data2$ranking1)
```

```
##                       
##                        (1,38.6] (38.6,76.2] (76.2,114] (114,152] (152,190]
##                               0           0          0         0         0
##   High income: nonOECD        4           5          8         4         2
##   High income: OECD          17          10          1         1         0
##   Low income                  0           1          9        16        11
##   Lower middle income         5          13         11         9        16
##   Upper middle income        11           9          8         8         9
```



