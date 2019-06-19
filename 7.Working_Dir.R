
#get current working directory
>getwd()

#set current working directory
>setwd("E:\\Courses\\R\\work_dir")

#Saves current work
save.image("FirstProject.Rdata")

#load the previous work
load("FirstProject.Rdata")

#File select dialog to load older work.
load(file.choose()) 


#Install Packages. Also can use menu option in R-Studio. Tools-> Install Package
install.packages("epiR")        #install epiR Package

#install.packages() will list all packages in dialog box.

help(package = epiR)

#remove packages
remove.packages("epiR")