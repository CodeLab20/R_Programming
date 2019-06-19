
LungCapData = read.csv("E:/Courses/R/LungCapData.csv", header=TRUE)
attach(LungCapData)

#subset of data with 11-14 rows and all columns
LungCapData[11:14,]

#mean Age of women
mean(Age[Gender == 'female'])

#mean Age of men
mean(Age[Gender == "male"])

#subset of all data for women
femData = LungCapData[Gender == "female",]

#subset of all data for male
maleData = LungCapData[Gender == "male",]

#subset of all data for male with age > 15
maleOver15 = LungCapData[Gender == 'male' & Age > 15, ]

#Subset of Age in LungCapData with Age > 15
temp = Age > 15
temp[1:5]

temp2 = as.numeric(Age > 15)
temp2[1:5]

#Data for smoking women
femSmoke = Gender == "female" & Smoke == "yes"

#Adding column: femSmoke to LungCapData
newData = cbind(LungCapData, femSmoke )
names(newData)

#Removing all objects in workspace
rm(list=ls())