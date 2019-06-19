countryStats = read.csv("E:/Courses/R/R-Programming/Datasets/P2-Demographic-Data.csv")
library(ggplot2)

#just x supplied = histogram
qplot(countryStats$Internet.users, data=countryStats)

# just y supplied = scatterplot, with x = seq_along(y)
qplot(y = countryStats$Birth.rate, data=countryStats)

# Income group wise birth rate
qplot(y = countryStats$Birth.rate, x=countryStats$Income.Group, data=countryStats)

#Adds legend for graph as size = 10
qplot(y = countryStats$Birth.rate, x=countryStats$Income.Group, data=countryStats, size=10)

#does not add legend for graph
qplot(y = countryStats$Birth.rate, x=countryStats$Income.Group, data=countryStats, size=I(3))

qplot(y = countryStats$Birth.rate, x=countryStats$Income.Group, data=countryStats, size=I(3), color=I("blue"))

#Boxplot is a chart which tells min value, 1st quartile, 2nd quartile(median), 3rd quartile, max value
#Box is made up of 1st,2nd,3rd quartile. while min and max values are called as whiskers
#Data is sorted to print boxplot.
qplot(y = countryStats$Birth.rate, x=countryStats$Income.Group, data=countryStats,
          size=I(3), color=I("blue"), geom = "boxplot") 


#Internet users wise birth rate
qplot(data=countryStats, x=countryStats$Internet.users, y=countryStats$Birth.rate,
        color=I("red"), size=I(4))

#Internet users wise birth rate with colours set as per income group
qplot(data=countryStats, x=Internet.users, y=Birth.rate,
      color=Income.Group, size=I(4))

########################################################################

#Use additional data in script: E:\Courses\R\R-Programming\5. Data Frames\CountryRegionVectors.R
#This data tells countrywise regions

#This functions creates a dataframe with columns renamed
regionsDF = data.frame(Country=Countries_2012_Dataset, Code=Codes_2012_Dataset, Region=Regions_2012_Dataset)
summary(regionsDF)
head(regionsDF)

#Merging countryStats and regionsDF dataframes
RegionCountryStats = merge(countryStats, regionsDF, by.x ="Country.Code", by.y="Code" )
str(RegionCountryStats)

#RegionCountryStats dataframe contains duplicate columns: Country and Country.Name
#So we remove Country column
RegionCountryStats$Country = NULL

#Internet users wise birth rate with colours set as per Country Region
qplot(data=RegionCountryStats, x=Internet.users, y=Birth.rate,
      color=Region, size=I(4))

#Different shapes. Refer Image: E:\Courses\R\GGPlot_Shapes.png
qplot(data=RegionCountryStats, x=Internet.users, y=Birth.rate,
      color=Region, size=I(4), shape=I(17))

#Transparency. So we can view overlapped points. 0= transparent 1 = opaque
qplot(data=RegionCountryStats, x=Internet.users, y=Birth.rate,
      color=Region, size=I(4), shape=I(20), alpha=I(0.5))

#Title for chart
qplot(data=RegionCountryStats, x=Internet.users, y=Birth.rate,
      color=Region, size=I(4), shape=I(20), alpha=I(0.5),
      main="Birth Rate vs Internet Users")



