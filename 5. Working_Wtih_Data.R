#Working With Data in R - 1
LungCapData = read.csv("E:/Courses/R/LungCapData.csv", header=TRUE)

#Dimensions of an object. Will give info about size, columns etc
dim(LungCapData)

nrow(LungCapData)   #gives number of rows
ncol(LungCapData)   #gives number of columns
str(LungCapData)    #gives structure of R object like data type, column names, sample data
summary(LungCapData) #gives more insights of R objects . mlike mean, min, max, 1st, 3rd quantile

#first few rows
head(LungCapData)
head(LungCapData, n=10)     #gives first 10 rows

#last few rows
tail(LungCapData)
tail(LungCapData, n=10)     #gives last 10 rows

#creating subset of data
LungCapData[c(5,6,7,8,9), ] #creates subset of LungCapData with 5-9 rows
LungCapData[5:9, ]

LungCapData[-(4:722),]      #creates subset of LungCapData with 1-3, 723-725 rows

is.data.frame(LungCapData[5:9, ])   #gives a rows subset of dataframe is a dataframe or not
#>true

is.data.frame(LungCapData[,1 ])   #gives a column subset of dataframe is a dataframe or not
#>false
is.data.frame(LungCapData[,1, drop=F ])   #gives a column subset of dataframe is a dataframe or not
#>true

#Adding a column to dataframe
LungCapData$MyCol = LungCapData$Age * LungCapData$Height

#Removing a column from dataframe
LungCapData$MyCol = NULL

#column names present in Data
names(LungCapData)

#gives mean value for column : Age
mean(LungCapData$Age)

#attaches set of R objects to Path. After attaching dataset, we can use column names directly
attach(LungCapData)
mean(Age)
Age
#detaches set of R objects from Path
#detach(LungCapData)

#gives data type
class(Age)      #integer
class(Height)   #numeric
class(Smoke)    #factor i.e. category

#gives categories present in column
levels(Smoke)   #yes, no
levels(Gender)  #male, female

#gives summary of data
summary(LungCapData)

 x = c(0,1,0,1,1,1,0,0,0,1,1,0,1)
> class(x)
[1] "numeric"
> typeof(x)
[1] "double"
> y = as.factor(x)  #if 0,1 values indicate some category, mark them as factor
> class(y)
[1] "factor"

