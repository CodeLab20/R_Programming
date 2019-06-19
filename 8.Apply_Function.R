#Apply function ins R
# Apply functions are set of loop functions in R and more efficient, faster than for loop

stockData = read.table(file="E:/Courses/R/StockExample.csv", header=TRUE, row.names=1, sep=",")

#get help on apply function
?apply

#MARGIN	
# a vector giving the subscripts which the function will be applied over. E.g., for a matrix 1 indicates rows, 2 indicates 
# columns, c(1, 2) indicates rows and columns. Where X has named dimnames, it can be a character vector selecting dimension 
# names.

#gives mean column wise. if na.rm is not set, for NA/missing values, mean will be NA
apply(stockData, MARGIN = 2, mean, na.rm = TRUE)

#gives mean column wise
colMeans(stockData, na.rm=TRUE)

#gives mean row wise
apply(stockData, MARGIN = 1, mean, na.rm = TRUE)

#gives mean row wise
rowMeans(stockData, na.rm = TRUE)

#gives max column wise
apply(stockData, MARGIN = 2, max, na.rm = TRUE)

#find 20th, 80th percentile, foreach stock
apply(stockData, MARGIN = 2, quantile, probs=c(0.2,0.8), na.rm=TRUE)

#create a plot for each stock
apply(stockData, MARGIN=2, plot, type='l')
apply(stockData, MARGIN=2, plot, type='l', main="Stock", ylab="Price", xlab="Day")

#calculate row wise sum
apply(stockData, MARGIN=1, sum, na.rm=TRUE)
rowSums(stockData, na.rm=TRUE)

#plot of sum of all stocks
plot(rowSums(stockData, na.rm=TRUE), type="l", main="Market Trend", ylab="Total Market Value", xlab="Day" )

#highlight plot with coloured points
points(rowSums(stockData, na.rm=TRUE),  pch=16, col="blue")