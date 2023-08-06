############### Source: https://indrajeetpatil.github.io/ggstatsplot/ ########################
# Correlations/covariances among numeric variables in
# data frame mtcars. Use listwise deletion of missing data.
data("mtcars")
cor(mtcars, use="complete.obs", method="kendall")
cor(mtcars, use="complete.obs", method="pearson")

cor(mtcars$mpg, mtcars$wt,  method = "kendall")
cor(mtcars$mpg, mtcars$wt,  method = "pearson")
cor(mtcars$mpg, mtcars$wt, method = "spearman")

## Covariance #########
cov(mtcars, use="complete.obs")


# Correlations with significance levels
library(Hmisc)
# type can be pearson or spearman
#mtcars is a data frame
rcorr(as.matrix(mtcars), type = "pearson")

# load package
library(ggstatsplot)

# correlogram
ggstatsplot::ggcorrmat(
  data = mtcars,
  type = "parametric", # parametric for Pearson, nonparametric for Spearman's correlation
  colors = c("darkred", "white", "steelblue"), # change default colors
  matrix.type  = "lower"
)



corrplot2(
  data = mtcars,
  method = "pearson",
  sig.level = 0.05,
  order = "original",
  diag = FALSE,
  type = "lower",
  tl.srt = 75
)

##########################################################################################
## Regression analysis ###
####### Source: https://www.tutorialspoint.com/r/r_linear_regression.htm#:~:text=Regression%20analysis%20is%20a%20very,derived%20from%20the%20predictor%20variable. ###############
# y = ax + b
# Following is the description of the parameters used −

# y is the response variable.

# x is the predictor variable.

# a and b are constants which are called the coefficients.

# Apply the lm() function.
# Apply the lm() function.
y <- mtcars$mpg
x <- mtcars$wt
relation <- lm(y~x)
print(relation)
print(summary(relation))



#### predict() Function
## Syntax The basic syntax for predict() in linear regression is −
predict(object, newdata)

# Find weight of a person with height 170.
a <- data.frame(x = 50)
result <-  predict(relation,a)
print(result)

############# Visualize the Regression Graphically ##
plot(y,x,col = "blue",main = "Height & Weight Regression",
     abline(lm(x~y)),cex = 1.3,pch = 16,xlab = "Weight",ylab = "MPG")


######### Multiple regression ##########

fit <-lm(mpg~am, data=mtcars)
summary(fit)


mfit <- lm(mpg~am + cyl + wt + hp, data = mtcars)
summary(mfit)
anova(fit, mfit)

### P-cal < P-tab (0.05) indicates significant, null hypothesis rejected. variations among models significant.
### adjusted R-square value greater is good


