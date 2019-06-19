
> x = 11
> x1 = c(1,3,5,7,9)                 #vector definition. c means combine
> x1
[1] 1 3 5 7 9

#Named Vector
names(x1) = c("a", "b", "c", "d","e")
x1

#Accessing elements using names
x1["c"]

#clearing names
names(x1) = NULL

> gender = c("male", "female")
> gender
[1] "male"   "female"
> y = 2:7
> y
[1] 2 3 4 5 6 7
> z = seq(from=3, to=10, by=1)      #sequence with increment
> z
[1]  3  4  5  6  7  8  9 10
> z1 = seq(from=3, to=10, by=0.5)
> z1
 [1]  3.0  3.5  4.0  4.5  5.0  5.5  6.0  6.5  7.0  7.5  8.0  8.5  9.0  9.5 10.0
> rep(1, times=10)                  #repeat 1 10 times
 [1] 1 1 1 1 1 1 1 1 1 1
> rep("AU", times=5)
[1] "AU" "AU" "AU" "AU" "AU"

> rep(1:4, times=4)
 [1] 1 2 3 4 1 2 3 4 1 2 3 4 1 2 3 4

> rep(1:4, each=4)
 [1] 1 1 1 1 2 2 2 2 3 3 3 3 4 4 4 4
 
> rep(seq(from=2, to=6, by=0.5), times=3)   #repeat sequence 3 times
 [1] 2.0 2.5 3.0 3.5 4.0 4.5 5.0 5.5 6.0 2.0 2.5 3.0 3.5 4.0 4.5 5.0 5.5 6.0 2.0 2.5
[21] 3.0 3.5 4.0 4.5 5.0 5.5 6.0
> z = 3:8
> z + 10                    #add 10 to each element in vector
[1] 13 14 15 16 17 18
> z-5
[1] -2 -1  0  1  2  3
> z-8
[1] -5 -4 -3 -2 -1  0
> z*8
[1] 24 32 40 48 56 64
> z/05
[1] 0.6 0.8 1.0 1.2 1.4 1.6
> #if 2 vectors have same length, we can add/sub/mul/div corresponding elements
> a = 5:10
> a + z                 #addition of 2 vectors
[1]  8 10 12 14 16 18
> a - z
[1] 2 2 2 2 2 2
> a * z
[1] 15 24 35 48 63 80
> a/z
[1] 1.666667 1.500000 1.400000 1.333333 1.285714 1.250000
> a
[1]  5  6  7  8  9 10
> a[3]              #3rd element in vector. (indexing begins with 1)
[1] 7
> a[-3]             # exclude 3rd element in vector
[1]  5  6  8  9 10

> a[6]              #Index > size of vector
[1] NA
> a[-7]             # exclude index > size of vector
[1]  5  6  7  8  9 10


> a[1:3]            #1 to 3 elements in vector
[1] 5 6 7
> a[c(1,5)]         # 1st, 5th element in vector
[1] 5 9
> a[-c(1,5)]        # exclude 1st, 5th elements in vector
[1]  6  7  8 10
> a[a < 7]          # all elements <7 in vector
[1] 5 6
> matrix(c(1:9), nrow=3, byrow=TRUE)        #defining matrix
     [,1] [,2] [,3]
[1,]    1    2    3
[2,]    4    5    6
[3,]    7    8    9
> matrix(c(1:9), nrow=3, byrow=FALSE)
     [,1] [,2] [,3]
[1,]    1    4    7
[2,]    2    5    8
[3,]    3    6    9
> mat = matrix(c(1:9), nrow=3, byrow=TRUE)
> mat
     [,1] [,2] [,3]
[1,]    1    2    3
[2,]    4    5    6
[3,]    7    8    9
> mat[1,2]          #element in 1st row, 2nd column
[1] 2
> mat[c(1,3), 2]    #1st, 3rd elements in 2nd column
[1] 2 8
> mat[2,]           #All elements in 2nd row
[1] 4 5 6
> mat[,3]           #All elements in 3rd column
[1] 3 6 9

#can assign names to rows and columns in matrix and access using them
rownames(mat) = c("a", "b", "c")
colnames(mat) = c("x", "y","z")
mat["a","z"]
mat["b",]       #2nd row
mat[,'z']       #3rd column

> mat * 10          # *10 for each element in matrix
     [,1] [,2] [,3]
[1,]   10   20   30
[2,]   40   50   60
[3,]   70   80   90

#Transpose of matrix. i.e. converts rows into columns and vice-versa
 t(mat)
