#Export Data from R

#General Export
#This command will export LungCapData to csv file. This will also export row names/numbers.
> write.table(LungCapData, file="E:/Courses/R/expData.csv", sep=",")

#Remove row names/numbers using row.names = F 
> write.table(LungCapData, file="E:/Courses/R/expData2.csv", row.names=F, sep=",")

#CSV export (no need to specify seperator)
> write.csv(LungCapData, file="E:/Courses/R/expData3.csv", row.names=F)

#txt export using tab delimited 
write.table(LungCapData, file="E:/Courses/R/expData2.txt", row.names=F, sep="\t")