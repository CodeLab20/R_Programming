movieRatings = read.csv("E:/Courses/Datasets/P2-Movie-Ratings.csv", header=TRUE)
colnames(movieRatings) = c("Film", "Genre", "CriticRating", "AudienceRating", "Budget", "Year")
str(movieRatings)

#here Film, Genre are identified as Factors by R. but year is not.
#to make year as factor
movieRatings$Year = factor(movieRatings$Year)

# This can work too
#movieRatings$Year = as.factor(movieRatings$Year)

str(movieRatings)


library(ggplot2)
#Chart for Audiesnce Rating vs Critic Rating for movies. should include budget too

#this will print empty chart
ggplot(data=movieRatings, aes(x=CriticRating, y=AudienceRating))

#this will draw points on chart
ggplot(data=movieRatings, aes(x=CriticRating, y=AudienceRating)) + geom_point()

#this will draw coloured points on chart
ggplot(data=movieRatings, aes(x=CriticRating, y=AudienceRating, colour=Genre)) +
  geom_point()

#this will draw coloured points with size depends on budget on chart
ggplot(data=movieRatings, aes(x=CriticRating, y=AudienceRating, colour=Genre,
                              size=Budget)) + geom_point()

#-------------------------------------------------------------------------------
#Plotting with layers

#This function return is assigned to a variable. Note that complete dataframe gets
#duplicated by this operation.
p = ggplot(data=movieRatings, aes(x=CriticRating, y=AudienceRating, colour=Genre,
                                  size=Budget))

#Plotting point layer
p + geom_point()

#plotting Lines Layer
p + geom_line()

#plotting point and lines layers
#for plotting multiple layers, order of plotting is important. This plotes points before
#Lines. so points are not visible in some extent
p + geom_point() + geom_line()
p + geom_line() + geom_point()

#-------------------------------------------------------------------------------
#Overriding aesthetics
q = ggplot(data=movieRatings, aes(x=CriticRating, y=AudienceRating, colour=Genre,
           size=Budget))

#Overriding size
q + geom_point(aes(size=CriticRating))

#Overriding colours
q + geom_point(aes(size=Budget))

#overriding X-Axis
q + geom_point(aes(x=Budget))

#Above line changes x-axis data. But label remains same.
#Overriding x label
q + geom_point(aes(x=Budget)) + xlab("Budget In Millions")

#Changing line size. Changing size is called as setting size while if aes function
#is used, it is called as mapping size.
#i.e. for Mapping use aes function.i.e. color is mapped to genres.
#for setting, use varible assignment.
p + geom_line(size = 1) + geom_point()

#-------------------------------------------------------------------------------

#Mapping vs Setting
r = ggplot(data=movieRatings, aes(x=CriticRating, y=AudienceRating, colour=Genre))
#Mapping
r + geom_point(aes(size=Budget))
#setting
r + geom_point(colour="DarkGreen")
#Error
r + geom_point(aes(size=10))

#-------------------------------------------------------------------------------

#Histograms and Density Charts
s = ggplot(data=movieRatings, aes(x=Budget))
s + geom_histogram(binwidth = 10)

#Map colour to genres
s + geom_histogram(binwidth = 10, aes(fill=Genre))

#as some colours look similar, set a border
s + geom_histogram(binwidth = 10, aes(fill=Genre), colour = "Black")


#Density Charts
s + geom_density(aes(fill=Genre))
#this will mix up all charts. so stack them on one another
s + geom_density(aes(fill=Genre), position = "stack" )


#-------------------------------------------------------------------------------
#Starting Layer Tips
t = ggplot(data=movieRatings, aes(x=AudienceRating) )
t + geom_histogram(binwidth = 10, fill="white", color = "blue")

#Another way
t = ggplot(data=movieRatings)
t + geom_histogram(aes(x=AudienceRating), binwidth = 10,
                   fill="white", color = "blue")

#Setting x-axis as critic rating
t + geom_histogram(aes(x=CriticRating), binwidth = 10,
                   fill="white", color = "blue")
#-------------------------------------------------------------------------------

#Statistical Transformations
u = ggplot(data=movieRatings, aes(x=CriticRating, y=AudienceRating, colour=Genre))

u + geom_point() + geom_smooth(fill=NA)
#Analysis: For Romantic movies, for less critic ratings, audience gave more rating.
#Action movies have more ratings than other movies

#-------------------------------------------------------------------------------
#Boxplots
v = ggplot(data=movieRatings, aes(x=Genre, y=AudienceRating, colour=Genre))
v + geom_boxplot()
v + geom_boxplot(size=1.2)

v + geom_boxplot(size=1.2)+ geom_point()

#instead of points, use jitters
#jitter places points randomly on plot

v + geom_boxplot(size=1.2)+ geom_jitter()
v + geom_jitter() + geom_boxplot(size=1.2, alpha=0.5)
#analysis: Thriller movies got highest ratings, as their box is smaller
#Horror movies got lowest ratings
                                 

#Boxplot using critic rating
w = ggplot(data=movieRatings, aes(x=Genre, y=CriticRating, colour=Genre))
w + geom_jitter() + geom_boxplot(size=1.2, alpha=0.5)

#-------------------------------------------------------------------------------

#Facets
a = ggplot(data=movieRatings, aes(x=Budget))
a + geom_histogram(aes(fill=Genre), binwidth = 10, colour="black")

#this will plot multiple plots per genre sharing a common X-axis and seperate y-axis
a + geom_histogram(aes(fill=Genre), binwidth = 10, colour="black") +
   facet_grid(Genre~.,scale="free")


#Scatter plot with facets
b = ggplot(data=movieRatings, aes(x=CriticRating, y=AudienceRating, colour=Genre))
b + geom_point(size=3)
b + geom_point(size=3) + facet_grid(Genre~., scale="free")

#Year-wise  Facet
#year horizontal
b + geom_point(size=3) + facet_grid(Year~., scale="free")
#Year vertical
b + geom_point(size=3) + facet_grid(.~Year, scale="free")
#Genre Horizontal, Year vertical
b + geom_point(size=3) + facet_grid(Genre~Year, scale="free")

b + geom_point(size=3) + geom_smooth() +facet_grid(Genre~Year, scale="free")
b + geom_point(size=3) + geom_smooth(fill=NA) +facet_grid(Genre~Year, scale="free")

b + geom_point(aes(size=Budget)) + geom_smooth(fill=NA) +facet_grid(Genre~Year, scale="free")
#-------------------------------------------------------------------------------

#co ordinates
#Limits
c = ggplot(data=movieRatings, aes(x=CriticRating, y=AudienceRating, 
                                      colour=Genre, size=Budget))
c + geom_point()
#this will zoom into data but removes other rows
c + geom_point() + xlim(50,100) + ylim(50,100)

#setting x and y limits wont work always.
d = ggplot(data=movieRatings, aes(x=Budget))
d + geom_histogram(binwidth = 10, aes(fill = Genre), colour = "black")
d + geom_histogram(binwidth = 10, aes(fill = Genre), colour = "black") + ylim(0, 50)

#Zoom : this wont remove rows
d + geom_histogram(binwidth = 10, aes(fill = Genre), colour = "black") + 
  coord_cartesian(ylim=c(0,50))
  

b + geom_point(aes(size=Budget)) + geom_smooth(fill=NA) +
  facet_grid(Genre~Year, scale="free") + coord_cartesian(ylim=c(0,100))
#-------------------------------------------------------------------------------

#Themes
e = ggplot(data=movieRatings, aes(x=Budget))
f = e + geom_histogram(binwidth = 10, aes(fill = Genre), colour = "black")

#Axis Labels
f + xlab("Budget in Millions") + ylab("No.Of Movies")

#Label Formatting
f + xlab("Budget in Millions") + ylab("No.Of Movies") +
   theme(axis.title.x = element_text(colour = "DarkGreen", size = 25),
         axis.title.y = element_text(color = "Red", size=25))

#Tick mark formatting(x, y axis points text)
f + xlab("Budget in Millions") + ylab("No.Of Movies") +
  theme(axis.title.x = element_text(colour = "DarkGreen", size = 25),
        axis.title.y = element_text(color = "Red", size=25),
        axis.text.x = element_text(size=12),
        axis.text.y = element_text(size = 12))

#Legend Formatting
f + xlab("Budget in Millions") + ylab("No.Of Movies") +
  theme(axis.title.x = element_text(colour = "DarkGreen", size = 25),
        axis.title.y = element_text(color = "Red", size=25),
        axis.text.x = element_text(size=12),
        axis.text.y = element_text(size = 12),
        
        legend.title = element_text(size = 15),
        legend.text = element_text(size=10),
        
        legend.position = c(1,1),
        legend.justification = c(1,1))

#Chart title formatting
f + xlab("Budget in Millions") + ylab("No.Of Movies") +
  ggtitle("Movie Budget Distribution") +
  theme(axis.title.x = element_text(colour = "DarkGreen", size = 25),
        axis.title.y = element_text(color = "Red", size=25),
        axis.text.x = element_text(size=12),
        axis.text.y = element_text(size = 12),
        
        legend.title = element_text(size = 15),
        legend.text = element_text(size=10),
        
        legend.position = c(1,1),
        legend.justification = c(1,1),
        
        plot.title = element_text(colour = "Blue",
                                  size = 30,
                                  family = "Courier"))