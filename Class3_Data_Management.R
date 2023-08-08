# COLON OPERATOR ###########################################

# Assigns number 0 through 10 to x1
x1 <- 0:10
x1

# Descending order
x2 <- 10:0
x2

# SEQ ######################################################

?seq  # R help on seq

# Ascending values (duplicates 1:10)
x3 <- seq(10)

# Specify change in values
x4 <- seq(30, 0, by = -3)
x4

# ENTER MULTIPLE VALUES WITH C #############################

# c = concatenate (or combine or collect)
?c  # R help on c

x5 <- c(5, 4, 1, 6, 7, 2, 2, 3, 2, 8, 'Mango')
x5

x6 <- c(12,23,56,'mango', 'true', 'jaman', 45, 89, 90, seq(100, 0, by = -20))
x6

# SCAN #####################################################

?scan  # R help on scan

x6 <- scan()  # After running this command, go to console
# Hit return after each number
# Hit return twice to stop
x6

# REP ######################################################

?rep  # R help on rep
x7 <- rep(TRUE, 5)
x7

# Repeats set
x8 <- rep(c(TRUE, FALSE), 5)
x8

# Repeats items in set
x9 <- rep(c(TRUE, FALSE), each = 5)
x9

#######################################################################################################################

# DATA TYPES 

# Numeric

n1 <- 15  # Double precision by default
n1
typeof(n1)

n2 <- 1.5
n2
typeof(n2)

# Character

c1 <- "c"
c1
typeof(c1)

c2 <- "a string of text"
c2
typeof(c2)

# Logical

l1 <- TRUE
l1
typeof(l1)

l2 <- F
l2
typeof(l2)

l1 <- F
l1
typeof(l1)

##################################################################################################################
# DATA STRUCTURES and Types ##########################################

## Vector: Magnitude and Direction ##################################################

v1 <- c(1, 2, 3, 4, 5)
v1
is.vector(v1)

v2 <- c("a", "b", "c")
v2
is.vector(v2)

v3 <- c(TRUE, TRUE, FALSE, FALSE, TRUE)
v3
is.vector(v3)

a <- c(1,2,5.3,6,-2,4) # numeric vector
b <- c("one","two","three") # character vector
c <- c(TRUE,TRUE,TRUE,FALSE,TRUE,FALSE) #logical vector

a[c(2,4)] # 2nd and 4th elements of vector

## Matrix ##################################################

m1 <- matrix(c(T, T, F, F, T, F), nrow = 2)
m1

m2 <- matrix(c("a", "b", 
               "c", "d"), 
             nrow = 2,
             byrow = T)
m2


# generates 5 x 4 numeric matrix
y<-matrix(1:20, nrow=5,ncol=4)

# another example
cells <- c(1,26,24,68)
rnames <- c("R1", "R2")
cnames <- c("C1", "C2")
mymatrix <- matrix(cells, nrow=2, ncol=2, byrow=TRUE,
                   dimnames=list(rnames, cnames))

mymatrix

## Identify rows, columns or elements using subscripts.
y[,4] # 4th column of matrix
y[3,] # 3rd row of matrix
y[2:4,1:3] # rows 2,3,4 of columns 1,2,3

## Array ###################################################

# Three dimension array
?array
help(array)
z=array(1:20, c(2,2,5))
z=array(sample(1:20), c(2,2,5))
z

# Give data, then dimemensions (rows, columns, tables)
a1 <- array(c( 1:24), c(4, 3, 1))
a1


d <- c(1:20)
e <- c("Red", "White", "Red", NA, "Red", "White", "Red", NA, "Red", "White", "Red", NA, "Red", "White", "Red", NA, "Red", "White", "Red", NA)
f <- c(TRUE,TRUE,TRUE,FALSE,TRUE,TRUE,TRUE,FALSE,TRUE,TRUE,TRUE,FALSE,TRUE,TRUE,TRUE,FALSE,TRUE,TRUE,TRUE,FALSE)

##### using repeat ####################

e <- rep(c("Red", "White", "Red", NA), 5)
f <- rep(c(TRUE,TRUE,TRUE,FALSE), 5)
mydata <- data.frame(d,e,f)
names(mydata) <- c("ID","Color","Passed") # variable names
mydata

#######
mydata[3] # columns 3,4,5 of data frame
mydata[c("Color","Passed")] # columns ID and Age from data frame
mydata$Passed # variable x1 in the data frame

mydata$Passed # columns 3,4,5 of data frame
mydata[3]
mydata[,3]
## Data frame ##############################################

# Can combine vectors of the same length

vNumeric   <- c(1, 2, 3)
vCharacter <- c("a", "b", "c")
vLogical   <- c(T, F, T)

dfa <- cbind(vNumeric, vCharacter, vLogical)
dfa  # Matrix of one data type

df <- as.data.frame(cbind(vNumeric, vCharacter, vLogical))
df  # Makes a data frame with three different data types

## List ####################################################

o1 <- c(1, 2, 3)
o2 <- c("a", "b", "c", "d")
o3 <- c(T, F, T, T, F)

list1 <- list(o1, o2, o3)
list1

list2 <- list(o1, o2, o3, list1)  # Lists within lists!
list2

# COERCING TYPES ###########################################

## Automatic coercion ######################################

# Goes to "least restrictive" data type

coerce1 <- c(1, "b", TRUE)
# coerce1  # Parenthese around command above make this moot
typeof(coerce1)

## Coerce numeric to integer ###############################

coerce2 <- 5
typeof(coerce2)

coerce3 <- as.integer(5)
typeof(coerce3)

## Coerce character to numeric #############################

coerce4 <- c("1", "2", "3")
typeof(coerce4)

coerce5 <- as.numeric(c("1", "2", "3"))
typeof(coerce5)

## Coerce matrix to data frame #############################

coerce6 <- matrix(1:9, nrow= 3)
is.matrix(coerce6)

coerce7 <- as.data.frame(matrix(1:9, nrow= 3))
is.data.frame(coerce7)

##########################################################################################################################################################
##### Factors ################

# variable gender with 20 "male" entries and
# 30 "female" entries
gender <- c(rep("male",20), rep("female", 30))
gender <- factor(gender)
# stores gender as 20 1s and 30 2s and associates
# 1=female, 2=male internally (alphabetically)
# R now treats gender as a nominal variable
summary(gender)

## An ordered factor is used to represent an ordinal variable.

# variable y is coded 1, 3 or 5
# we want to attach value labels 1=Low, 3=Medium, 5=High

mydata$v1<-rep(c(1,2,3,4), 5)
mydata$v2<-rep(c(1,2,3,4), 5)

mydata$v3 <- ordered(mydata$v2,
                     levels = c(1, 2, 3, 4),
                     labels = c("Low", "Medium", "High", "Trolly"))

mydata

############### Data Merging ################
# Upload all dataset
D1=read.table("HRSWURN2004.txt", header=TRUE, na.string="NA")
D2=read.table("HRSWURN2006.txt", header=TRUE, na.string="NA")
D3=read.table("HRSWURN2007.txt", header=TRUE, na.string="NA")

Data_all <- rbind(D1,D2,D3)
View(Data_all)
dim(Data_all)

Year=Data_all[,1]
Location=Data_all[,2]
State=Data_all[,3]
Entry=Data_all[,4]
Grainyield=Data_all[,5]
Testweight=Data_all[,6]
Plantheight=Data_all[,7]


## create a dataset of grain yield by removing column
GY <- Data_all[-c(7)]
View(GY)

GY <- Data_all[,c(1,2,3,4,5)]

yield=data.frame(Year, Location, State, Entry, Grainyield)
dim(yield)
yield[1:5,]

#######################################################################


####################### Data Sub-setting #########################
library(tidyverse)
my_data %>% slice(1:6)

## Extract rows based on logical criteria
Q <- Data_all%>% filter(Data_all$Grainyield > 40)
View(Q)

## Multiple-column based criteria: Extract rows where Sepal.Length > 6.7 and Sepal.Width = 3:
my_data %>% filter(Sepal.Length > 6.7, Sepal.Width <= 3)

### Test for equality (==): Extract rows where Sepal.Length > 6.5 and Species = ?versicolor?:
my_data %>% filter(Sepal.Length > 6.7, Species == "versicolor")

## Using OR operator (|): Extract rows where Sepal.Length > 6.5 and (Species = ?versicolor? or Species = ?virginica?):
my_data %>% filter(
  Sepal.Length > 6.7, 
  Species == "versicolor" | Species == "virginica"
  )
  
##### For more visit: https://www.datanovia.com/en/lessons/subset-data-frame-rows-in-r/

##########################################################################################

# USEFUL FUNCTIONS

length(D3) # number of elements or components
str(object)    # structure of an object
class(object)  # class or type of an object
names(object)  # names

c(object,object,...)       # combine objects into a vector
cbind(object, object, ...) # combine objects as columns
rbind(object, object, ...) # combine objects as rows

object     # prints the object

ls()       # list current objects
rm(object) # delete an object

newobject <- edit(object) # edit copy and save as newobject
fix(object)               # edit in place


###########################################



########### Merging data files #######################
########################################################################################################
NewD <- data.frame(cbind(D1$taxa, D2$V1, D3$V8))
colnames(NewD) = c("BA",	"BB",	"BC")

##Adding new column
library(tidyverse)
NewD <- NewD %>%add_column(Empty_Col1 = D3$V5, .before = "BA")

write.csv(NewD, file = "Out2.csv", row.names= F)
