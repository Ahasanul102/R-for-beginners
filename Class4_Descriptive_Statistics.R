#### Descriptive  Statistics #####################
# get means for variables in data frame mydata
# excluding missing values

D1 <- read.table("TestData.txt", header = TRUE)


library(pastecs)
stat.desc(D1)
# nbr.val, nbr.null, nbr.na, min max, range, sum,
# median, mean, SE.mean, CI.mean, var, std.dev, coef.var

data(mtcars)
stat.desc(mtcars)
write.csv (mtcars, file = "mtcars.csv", row.names= F)
write.csv (mtcars, file = "mtcars.csv", row.names= T)


Y1<-mtcars[,c(1,2)]
Y1<-mtcars(1,2)

library(tidyverse)
Y2 <-mtcars %>% slice(1:6)

####### Data
# We use the data set iris throughout the article. This data set is imported by default in R, you only need to load it by running iris:
  
dat <- iris # load the iris dataset and renamed it dat
write.csv (dat, file = "iris.csv", row.names= F)

#Below a preview of this dataset and its structure:
  
head(dat) # first 6 observations
str(dat) # structure of dataset

# Minimum and maximum
# Minimum and maximum can be found thanks to the min() and max() functions:

min(dat$Sepal.Length)

## [1] 4.3
max(dat$Sepal.Length)

## [1] 7.9
# Alternatively the range() function:
  
rng <- range(dat$Sepal.Length)
rng
## [1] 4.3 7.9

# gives you the minimum and maximum directly. Note that the output of the range() function is actually an object containing the minimum and maximum (in that order). This means you can actually access the minimum with:
  
rng[1] # rng = name of the object specified above

## [1] 4.3
# and the maximum with:
rng[2]
## [1] 7.9

# This reminds us that, in R, there are often several ways to arrive at the same result. The method that uses the shortest piece of code is usually preferred as a shorter piece of code is less prone to coding errors and more readable.

# Range
# The range can then be easily computed, as you have guessed, by subtracting the minimum from the maximum:
  
max(dat$Sepal.Length) - min(dat$Sepal.Length)
## [1] 3.6

#To my knowledge, there is no default function to compute the range. However, if you are familiar with writing functions in R , you can create your own function to compute the range:
  
 
range2 <- function(x) {
  range <- max(x) - min(x)
  return(range)
}

range2(dat$Sepal.Length)
  
range2(dat$Sepal.Length)

## [1] 3.6

### Mean
# The mean can be computed with the mean() function:
  
mean(dat$Sepal.Length)

## [1] 5.843333
# Tips:if there is at least one missing value in your dataset, use mean(dat$Sepal.Length, na.rm = TRUE) to compute the mean with the NA excluded. This argument can be used for most functions presented in this article, not only the mean
# for a truncated mean, use mean(dat$Sepal.Length, trim = 0.10) and change the trim argument to your needs

## Median
#The median can be computed thanks to the median() function:
  
median(dat$Sepal.Length)

## [1] 5.8
# or with the quantile() function:
  
#quantile
#First and third quartile
#As the median, the first and third quartiles can be computed thanks to the quantile() function and by setting the second argument to 0.25 or 0.75:
  
quantile(dat$Sepal.Length, 0.25) # first quartile
## 25% 
## 5.1

quantile(dat$Sepal.Length, 0.75) # third quartile
## 75% 
## 6.4
#You may have seen that the results above are slightly different than the results you would have found if you compute the first and third quartiles by hand. It is normal, there are many methods to compute them (R actually has 7 methods to compute the quantiles!). However, the methods presented here and in the article “descriptive statistics by hand” are the easiest and most “standard” ones. Furthermore, results do not dramatically change between the two methods.

# Other quantiles
#As you have guessed, any quantile can also be computed with the quantile() function. For instance, the 

quantile(dat$Sepal.Length, 0.4) # 4th decile
quantile(dat$Sepal.Length, 0.98) # 98th percentile

#Interquartile range
#The interquartile range (i.e., the difference between the first and third quartile) can be computed with the IQR() function:
  
IQR(dat$Sepal.Length)

## [1] 1.3
#or alternatively with the quantile() function again:
  
quantile(dat$Sepal.Length, 0.75) - quantile(dat$Sepal.Length, 0.25)

## 75% 
## 1.3
# As mentioned earlier, when possible it is usually recommended to use the shortest piece of code to arrive at the result. For this reason, the IQR() function is preferred to compute the interquartile range.

# Standard deviation and variance
# The standard deviation and the variance is computed with the sd() and var() functions:
  
sd(dat$Sepal.Length) # standard deviation
## [1] 0.8280661
var(dat$Sepal.Length) # variance
## [1] 0.6856935

#Remember from the article descriptive statistics by hand that the standard deviation and the variance are different whether we compute it for a sample or a population (see the difference between sample and population). In R, the standard deviation and the variance are computed as if the data represent a sample (so the denominator is                                                                                                                                                                                                                                                                                                                    is the number of observations). To my knowledge, there is no function by default in R that computes the standard deviation or variance for a population.

#Tip: to compute the standard deviation (or variance) of multiple variables at the same time, use lapply() with the appropriate statistics as second argument:
  
lapply(dat[, 1:4], sd)

## $Sepal.Length
## [1] 0.8280661
## 
## $Sepal.Width
## [1] 0.4358663
## 
## $Petal.Length
## [1] 1.765298
## 
## $Petal.Width
## [1] 0.7622377

# The command dat[, 1:4] selects the variables 1 to 4 as the fifth variable is a qualitative variable and the standard deviation cannot be computed on such type of variable. See a recap of the different data types in R if needed.

# Summary
# You can compute the minimum, 1st quartile, median, mean, 3rd quartile and the maximum for all numeric variables of a dataset at once using summary()

summary(dat)
# if you need these descriptive statistics by group use the by() function:
by(dat, dat$Species, summary)

# If you need more descriptive statistics, use stat.desc() from the package {pastecs}:

library(pastecs)
stat.desc(dat)
Fahim <- stat.desc(dat)
write.csv (Fahim, file = "Descriptive Stattistics.csv", row.names= F)

write.csv (Fahim, file = "Descriptive Stattistics_1.csv", row.names= T)

# You can have even more statistics (i.e., skewness, kurtosis and normality test) by adding the argument norm = TRUE in the previous function. Note that the variable Species is not numeric, so descriptive statistics cannot be computed for this variable and NA are displayed.

### Coefficient of variation
# The coefficient of variation can be found with stat.desc() (see the line coef.var in the table above) or by computing manually (remember that the coefficient of variation is the standard deviation divided by the mean):
  
sd(dat$Sepal.Length) / mean(dat$Sepal.Length)
## [1] 0.1417113


###Mode
# To my knowledge there is no function to find the mode of a variable. However, we can easily find it thanks to the functions table() and sort():
  
tab <- table(dat$Sepal.Length) # number of occurrences for each unique value
sort(tab, decreasing = TRUE) # sort highest to lowest

# table() gives the number of occurrences for each unique value, then sort() with the argument decreasing = TRUE displays the number of occurrences from highest to lowest. The mode of the variable Sepal.Length is thus 5. This code to find the mode can also be applied to qualitative variables such as Species:
  
sort(table(dat$Species), decreasing = TRUE)
summary(dat$Species)


### Correlation

# The correlation measures the linear relationship between two variables, and it can be computed with the cor() function:
  
cor(dat$Sepal.Length, dat$Sepal.Width)
## [1] -0.1175698

# Computing correlation in R and interpreting the results deserve a detailed explanation, so I wrote an article covering correlation and correlation test.

##### Contingency table

#table() introduced above can also be used on two qualitative variables to create a contingency table. The dataset iris has only one qualitative variable so we create a new qualitative variable just for this example. We create the variable size which corresponds to small if the length of the petal is smaller than the median of all flowers, big otherwise:
  
dat$size <- ifelse(dat$Sepal.Length < median(dat$Sepal.Length),
                     "small", "big")

dat$size
# Here is a recap of the occurrences by size:
  
# We now create a contingency table of the two variables Species and size with the table() function:
  
table(dat$Species, dat$size)

# or with the xtabs() function:
  
xtabs(~ dat$Species + dat$size)


# The contingency table gives the number of cases in each subgroup. For instance, there is only one big setosa flower, while there are 49 small setosa flowers in the dataset.

# To go further, we can see from the table that setosa flowers seem to be larger in size than virginica flowers. In order to check whether size is significantly associated with species, we could perform a Chi-square test of independence since both variables are categorical variables. See how to do this test by hand and in R.

# Note that Species are in rows and size in column because we specified Species and then size in table(). Change the order if you want to switch the two variables.

# Instead of having the frequencies (i.e.. the number of cases) you can also have the relative frequencies (i.e., proportions) in each subgroup by adding the table() function inside the prop.table() function:
  
prop.table(table(dat$Species, dat$size))

# Note that you can also compute the percentages by row or by column by adding a second argument to the prop.table() function: 1 for row, or 2 for column:

### percentages by row:
round(prop.table(table(dat$Species, dat$size), 1), 2) # round to 2 digits with round()

# percentages by column:
round(prop.table(table(dat$Species, dat$size), 2), 2) # round to 2 digits with round()

### Mosaic plot
# A mosaic plot allows to visualize a contingency table of two qualitative variables:
  
mosaicplot(table(dat$Species, dat$size),
           color = TRUE,
           xlab = "Species", # label for x-axis
           ylab = "Size" # label for y-axis
)


# The mosaic plot shows that, for our sample, the proportion of big and small flowers is clearly different between the three species. In particular, the virginica species is the biggest, and the setosa species is the smallest of the three species (in terms of sepal length since the variable size is based on the variable Sepal.Length).

# For your information, a mosaic plot can also be done via the mosaic() function from the {vcd} package:
  
library(vcd)

mosaic(~ Species + size,
       data = dat,
       direction = c("v", "h")
)


####### Barplot
# Barplots can only be done on qualitative variables (see the difference with a quantitative variable here). A barplot is a tool to visualize the distribution of a qualitative variable. We draw a barplot of the qualitative variable size:
  
barplot(table(dat$size)) # table() is mandatory


# You can also draw a barplot of the relative frequencies instead of the frequencies by adding prop.table() as we did earlier:
  
barplot(prop.table(table(dat$size)))


# In {ggplot2}:
  
library(ggplot2) # needed each time you open RStudio

# The package ggplot2 must be installed first

ggplot(dat) +
  aes(x = size) +
  geom_bar()



#### Histogram
### A histogram gives an idea about the distribution of a quantitative variable. The idea is to break the range of values into intervals and count how many observations fall into each interval. Histograms are a bit similar to barplots, but histograms are used for quantitative variables whereas barplots are used for qualitative variables. To draw a histogram in R, use hist():
  
hist(dat$Sepal.Length)
hist(dat$Sepal.Length, col = "Red")
hist(dat$Sepal.Length, col = "Red", xlab = "Sepal length (cm)")


### Add the arguments breaks = inside the hist() function if you want to change the number of bins. A rule of thumb (known as Sturges’ law) is that the number of bins should be the rounded value of the square root of the number of observations. The dataset includes 150 observations so in this case the number of bins can be set to 12.

# In {ggplot2}:
  
  ggplot(dat) +
  aes(x = Sepal.Length) +
  geom_histogram()


## By default, the number of bins is 30. You can change this value with geom_histogram(bins = 12) for instance.

######### Boxplot
## Boxplots are really useful in descriptive statistics and are often underused (mostly because it is not well understood by the public). A boxplot graphically represents the distribution of a quantitative variable by visually displaying five common location summary (minimum, median, first/third quartiles and maximum) and any observation that was classified as a suspected outlier using the interquartile range (IQR) criterion.

boxplot(dat$Sepal.Length)
boxplot(dat$Sepal.Length ~ dat$Species, xlab = "Species", ylab = "Length (cm)", col= "red")

## In {ggplot2}:
  
  ggplot(dat) +
  aes(x = Species, y = Sepal.Length,) +
  geom_boxplot()  

## Plot significance
  
# Basic box plot
ggplot(dat, aes(x=Species, y=Sepal.Length)) + 
    geom_boxplot(fill="gray")+
    labs(title="Plot of length per species",x="Species", y = "Length")+
    theme_classic()

# Change  automatically color by groups
ggplot(dat, aes(x=Species, y=Sepal.Length, fill=Species)) + 
  geom_boxplot()+
  labs(title="Plot of length per species",x="Species", y = "Length")+
  theme_classic() + theme_classic()

## Adding significance level
library(ggpubr)
ggplot(dat, aes(x=Species, y=Sepal.Length, fill=Species)) + 
  geom_boxplot()+
  labs(title="Plot of length per species",x="Species", y = "Length")+
  theme_classic() + stat_compare_means(method = "anova")

## How to interpret a boxplot? Source: LFSAB1105


######### Dotplot
## A dotplot is more or less similar than a boxplot, except that:observations are represented as points it does not easily tell us about the median, first and third quartiles.

library(lattice)
dotplot(dat$Sepal.Length ~ dat$Species)


## In {ggplot2}:
  
  ggplot(dat) +
  aes(x = Species, y = Sepal.Length) +
  geom_dotplot(binaxis = "y", stackdir = "center")


# The advantage of using {ggplot2} over {lattice} for this plot is that we can easily see the mode.

# Note that a dotplot is particularly useful when there are a limited number of observations, whereas a boxplot is more appropriate with large datasets.

### Scatterplot
## Scatterplots allow to check whether there is a potential link between two quantitative variables. For this reason, scatterplots are often used to visualize a potential correlation between two variables. For instance, when drawing a scatterplot of the length of the sepal and the length of the petal:
  
plot(dat$Sepal.Length, dat$Petal.Length)

### There seems to be a positive association between the two variables.

## In {ggplot2}:
  
  ggplot(dat) +
  aes(x = Sepal.Length, y = Petal.Length) +
  geom_point()


## Like boxplots, scatterplots are even more informative when differentiating the points according to a factor, in this case the species:
  
  ggplot(dat) +
  aes(x = Sepal.Length, y = Petal.Length, colour = Species) +
  geom_point() +
  scale_color_hue()


## Line plot
# Line plots, particularly useful in time series or finance, can be created by adding the type = "l" argument in the plot() function:
  
  plot(dat$Sepal.Length,
       type = "l"
  ) # "l" for line


## QQ-plot
# For a single variable In order to check the normality assumption of a variable (normality means that the data follow a normal distribution, also known as a Gaussian distribution), we usually use histograms and/or QQ-plots.1 See an article discussing about the normal distribution and how to evaluate the normality assumption in R if you need a refresh on that subject.

## Histograms have been presented earlier, so here is how to draw a QQ-plot:
# Draw points on the qq-plot:
qqnorm(dat$Sepal.Length)

# Draw the reference line:
qqline(dat$Sepal.Length)


## Or a QQ-plot with confidence bands with the qqPlot() function from the {car} package:
  
library(car) # package must be installed first
qqPlot(dat$Sepal.Length)


## [1] 132 118
## If points are close to the reference line (sometimes referred as Henry’s line) and within the confidence bands, the normality assumption can be considered as met. The bigger the deviation between the points and the reference line and the more they lie outside the confidence bands, the less likely that the normality condition is met. The variable Sepal.Length does not seem to follow a normal distribution because several points lie outside the confidence bands. When facing a non-normal distribution, the first step is usually to apply the logarithm transformation on the data and recheck to see whether the log-transformed data are normally distributed. Applying the logarithm transformation can be done with the log() function.

# In {ggpubr}:
  
library(ggpubr)
ggqqplot(dat$Sepal.Length)


# By groups
# For some statistical tests, the normality assumption is required in all groups. One solution is to draw a QQ-plot for each group by manually splitting the dataset into different groups and then draw a QQ-plot for each subset of the data (with the methods shown above). Another (easier) solution is to draw a QQ-plot for each group automatically with the argument groups = in the function qqPlot() from the {car} package:
  
qqPlot(dat$Sepal.Length, groups = dat$size)


## In {ggplot2}:
  
  qplot(
    sample = Sepal.Length, data = dat,
    col = size, shape = size
  )


## It is also possible to differentiate groups by only shape or color. For this, remove one of the argument col or shape in the qplot() function above.

# Density plot
# Density plot is a smoothed version of the histogram and is used in the same concept, that is, to represent the distribution of a numeric variable. The functions plot() and density() are used together to draw a density plot:
  
plot(density(dat$Sepal.Length))


# In {ggplot2}:
  
  ggplot(dat) +
  aes(x = Sepal.Length) +
  geom_density()



## Advanced descriptive statistics
# We covered the main functions to compute the most common and basic descriptive statistics. There are, however, many more functions and packages to perform more advanced descriptive statistics in R. In this section, I present some of them with applications to our dataset.

## Descriptive statistics with descr()
library(summarytools)
library(descr)
descr(dat)
descr(dat,
      headings = FALSE, # remove headings
      stats = "common" # most common descriptive statistics
)

stby(
  data = dat,
  INDICES = dat$Species, # by Species
  FUN = descr, # descriptive statistics
  stats = "common" # most common descr. stats
)  



### Source: https://statsandr.com/blog/descriptive-statistics-in-r/
