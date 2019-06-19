>data = read.csv("E:/Courses/R/LungCapData.csv", header=TRUE)
>data
    LungCap Age Height Smoke Gender Caesarean
1     6.475   6   62.1    no   male        no
2    10.125  18   74.7   yes female        no
3     9.550  16   69.7    no female       yes
4    11.125  14   71.0    no   male        no
5     4.800   5   56.9    no   male        no
6     6.225  11   58.7    no female        no
7     4.950   8   63.3    no   male       yes
8     7.325  11   70.4    no   male        no
9     8.875  15   70.5    no   male        no
10    6.800  11   59.2    no   male        no
11   11.500  19   76.4    no   male       yes

>data = read.csv(file.choose(), header=TRUE)  #this will popup file selection dialog

>data = read.delim(file.choose(), header=TRUE)  #read tab-seperated file

>data = read.table(file.choose(), header=TRUE, sep="\t")  #read tab-seperated file. generic function