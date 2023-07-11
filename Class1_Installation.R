# Installation

## For R: https://cran.r-project.org/bin/windows/base/

## For RStudio: https://posit.co/download/rstudio-desktop/

##########################################################################

# LOAD PACKAGES
install.packages("abind")

# Uninstall packages
remove.packages("abind")

# Package to use
library(pacman)

# Package not to use
detach("package:fastmap", unload = TRUE)

# Update package
update.packages("abind")


##########################################################

# UPDATING R Itself
# Install the installr package
install.packages("installr")

# Load installr
library(installr)

# Run the update function #### the important bit is to select "Yes" when it asked if you would like to copy your packages from the older version of R.
updateR()

###################################################################################################

getwd() # print the current working directory - cwd
ls()    # list the objects in the current workspace

## Directory setting
setwd("D:/Canola Reference Files")

setwd("C:/Users/ahasa/OneDrive/MS_GPB/MS_Advanced Plant Phenotyping")

##############################################################################

