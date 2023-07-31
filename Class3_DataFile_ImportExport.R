# TEXT FILES
# Load a spreadsheet that has been saved as tab-delimited
# text file. Need to give complete address to file. This
# command gives an error on missing data but works on
# complete data

D1 <- read.table("TestData.txt", header = TRUE)
D1 <- read.table("TestData.txt", header = TRUE, na.string="NA")
D1 <- read.table("TestData.txt", header = TRUE, na.string="NA" )
Y1<-D1[,c(1,2)]
Y1<-D1[,c(1,2)]

D1 <- read.table(file.choose(), header = TRUE)

# READ.CSV FOR CSV FILES ###################################

D2 <-read.csv('TestData.csv', header = T, sep = ",", )
D2 <-read.csv('TestData.csv', header = T, sep = ",", row.names = 1)

# READ.xlsx FOR excel FILES ###################################

# read in the first worksheet from the workbook myexcel.xlsx
# first row contains variable names
library(xlsx)
D3 <- read.xlsx("TestData.xlsx", header = T, 1)
D3 <- read.xlsx("TestData.xlsx", header = T, 1, row.names = 1)

# read in the worksheet named mysheet
mydata <- read.xlsx("c:/myexcel.xlsx", sheetName = "mysheet")
########################################################################################################
NewD <- data.frame(cbind(D1$taxa, D2$V1, D3$V8))
colnames(NewD) = c("BA",	"BB",	"BC")

##Adding new column
library(tidyverse)
NewD <- NewD %>%add_column(Empty_Col1 = D3$V5, .before = "BA")

write.csv(NewD, file = "Out2.csv", row.names= F)



##################################################################################
## Data Writing ##############
write.csv (D2, file = "Out1.csv")
write.csv (D2, file = "Out1.csv", row.names= F)

##################################################################################################################

####################### Data Subsetting #########################
library(tidyverse)
my_data %>% slice(1:6)

## Extract rows based on logical criteria
my_data %>% filter(Sepal.Length > 7)

## Multiple-column based criteria: Extract rows where Sepal.Length > 6.7 and Sepal.Width = 3:
my_data %>% filter(Sepal.Length > 6.7, Sepal.Width <= 3)

### Test for equality (==): Extract rows where Sepal.Length > 6.5 and Species = “versicolor”:
my_data %>% filter(Sepal.Length > 6.7, Species == "versicolor")

## Using OR operator (|): Extract rows where Sepal.Length > 6.5 and (Species = “versicolor” or Species = “virginica”):
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
# Clear environment
rm(list = ls()) 

# Clear packages
p_unload(all)  # Remove all add-ons

# Clear console
cat("\014")  # ctrl+L

# Clear mind :)
