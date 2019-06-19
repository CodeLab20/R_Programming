#tapply function.
#tapply function can be used to apply a function on subset of variable or vector
LungCapData = read.csv("E:/Courses/R/LungCapData.csv", header=TRUE)
attach(LungCapData)

#summary of data
summary(LungCapData)

#help for tapply
?tapply

#calculate mean age of smokers and non-smokers
tapply(X=Age, INDEX=Smoke, FUN=mean, na.rm=TRUE)
tapply(Age, Smoke, mean, na.rm=TRUE)

#simplify = TRUE is default. if we set it to false, it will return a vector
#if FALSE, tapply always returns an array of mode "list"; in other words, a list with a dim attribute.
tapply(Age, Smoke, mean, simplify = FALSE)

#without using tapply function, alternate less-efficient way
mean(Age[Smoke=="yes"])
mean(Age[Smoke=="no"])

#summary command with tapply
tapply(Age, Smoke, summary)

#quantile function with tapply
tapply(Age, Smoke, quantile, probs=c(0.2,0.8))

#subset based on multiple variables/vectors
#calculate mean age for smoker/non-smoker and male/female
tapply(Age, list(Smoke, Gender), mean, na.rm=TRUE)

#altername less efficient way
mean(Age[Smoke == 'no' & Gender=='male'])
mean(Age[Smoke == 'no' & Gender=='female'])
mean(Age[Smoke == 'yes' & Gender=='male'])
mean(Age[Smoke == 'yes' & Gender=='female'])

#by function is similar to tapply except it returns results in vector format
v = by(Age, list(Smoke, Gender), mean, na.rm=TRUE)
v
type(v)
