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



##################################################################################
## Data Writing ##############
write.csv (D2, file = "Out1.csv")
write.csv (D2, file = "Out1.csv", row.names= F)

##################################################################################################################

# Clear environment
rm(list = ls()) 

# Clear packages
p_unload(all)  # Remove all add-ons

# Clear console
cat("\014")  # ctrl+L

# Clear mind :)
