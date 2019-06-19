#Bar Chart and Pie Chart in R
#Bar Chart
LungCapData = read.csv("E:/Courses/R/LungCapData.csv", header=TRUE)
attach(LungCapData)

#summary of data
summary(LungCapData)

#help for barplot
?barplot

#frequencies for variables can be produced using table
#dividing number of males and females by total count will give percentage of each gender
gCount = table(Gender)
gCount

gPercent = gCount/725 *100
gPercent  

#barplot of count
barplot(gCount)

#barplot of percentage
barplot(gPercent)
barplot(gPercent, main="Gender %", ylab = "%", xlab = "Gender")

#las param will change orientation of y-axis labels
barplot(gPercent, main="Gender %", ylab = "%", xlab = "Gender", las = 1)

#names.arg will set names on X-Axis
barplot(gPercent, main="Gender %", ylab = "%", xlab = "Gender", las = 1, names.arg = c("Female", "Male"))

#Horizontal bar chart
barplot(gPercent, main="Gender %", xlab = "%", ylab = "Gender", las = 1, names.arg = c("Female", "Male"), horiz = 1)


#PieCharts
pie(gPercent, main = "Gender %")

#add box around pie chart
box()
