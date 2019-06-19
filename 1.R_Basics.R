#R Basics

#integer
i = 2L

#double
d = 2.5

#complex
cm = 1 + 2i

#use typeof command to check datatype of a variable

#character
a = "Hello"
b = "World"

#paste function concatenates vectors with default seperator as " ".
c = paste(a, b)

#negation operator !
res = !(4 < 5)

# OR operator |
b1 = TRUE
b2 = FALSE
b3 = b1 | b2

# AND operator
b4 = b1 & b2

# isTRUE operator
isTRUE(b4)

#while loop

count = 1
while(count < 5)
{
    print(count)
    count = count + 1
}

#for loop
for(i in 1:5)
{
  print("Hello R")
  print(i)
}

#mean Normal distribution of random numbers fall in -1 to 1
N = 10000
count = 0
for(i in rnorm(N))
{
  if(i > -1 & i < 1)
  {
    count= count + 1
  }
}
print(count / N)