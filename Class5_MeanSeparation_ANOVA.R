## Source: http://www.sthda.com/english/wiki/comparing-means-in-r

######## Mean Separation #############
# One-sample t-test
res <- t.test(mtcars$mpg, mu = 25)
# Printing the results
res

ggboxplot(mtcars$mpg,
ylab = "Weight (g)", xlab = FALSE,
ggtheme = theme_minimal())

library(ggpubr)
ggboxplot(mtcars$mpg,
ylab = "Weight (g)", xlab = FALSE,
ggtheme = theme_minimal())
############ Compute unpaired samples t-test ######################
# Compute t-test
res <- t.test(mtcars$mpg, mtcars$wt, var.equal = TRUE)
res
############ Compute paired samples t-test ######################
# Compute t-test
res <- t.test(mtcars$mpg, mtcars$wt, paired = TRUE)
res
############ Comparing the means of more than two groups ################
### ONE_WAY ANOVA ################
# Compute the analysis of variance
res.aov <- aov(mtcars$wt ~ mtcars$cyl, data = mtcars)
# Summary of the analysis
summary(res.aov)
library("ggpubr")
ggboxplot(mtcars, x = "cyl", y = "weight",
color = "group", palette = c("#00AFBB", "#E7B800"),
order = c("Cyl1", "cyl2"),
ylab = "Weight", xlab = "cyl")
ggboxplot(mtcars, x = "cyl", y = "wt",
color = "group", palette = c("#00AFBB", "#E7B800"),
order = c("Cyl1", "cyl2"),
ylab = "Weight", xlab = "cyl")
ggboxplot(mtcars, x = "cyl", y = "wt",
color = "cyl", palette = c("#00AFBB", "#E7B800"),
order = c("Cyl1", "cyl2"),
ylab = "Weight", xlab = "cyl")
ggboxplot(mtcars, x = "cyl", y = "wt",
color = "cyl", palette = c("#00AFBB", "#E7B800"),
ylab = "Weight", xlab = "cyl")
ggboxplot(mtcars, x = "cyl", y = "wt",
color = "cyl", palette = c("#00AFBB", "#E7B800"),
order = c("Cyl1", "cyl2"),
ylab = "Weight", xlab = "cyl")
mtcars$cyl
ggboxplot(mtcars, x = "cyl", y = "wt",
color = "cyl", palette = c("#00AFBB", "#E7B800", "#FC4E07"),
order = c("Cyl1", "cyl2", "cyl3"),
ylab = "Weight", xlab = "cyl")
ggboxplot(mtcars, x = "cyl", y = "wt",
color = "cyl", palette = c("#00AFBB", "#E7B800", "#FC4E07"),
order = c("4", "6", "8"),
ylab = "Weight", xlab = "cyl")
########## Compute two-way ANOVA test
res.aov2 <- aov(mtcars$wt ~ mtcars$cyl + mtcars$am, data = mtcars)
summary(res.aov2)
############# MANOVA ###############
## In the situation where there multiple response variables you can test them simultaneously using a multivariate analysis of variance (MANOVA). This article describes how to compute manova in R.
# MANOVA test
res.man <- manova(cbind(mtcars$mpg, mtcars$wt) ~ mtcars$am, data = mtcars)
summary(res.man)
# Look to see which differ
summary.aov(res.man)
#####################

############### RCBD: One Factor ###################
data1<-read.csv (file.choose(),header=T)  
attach(data1)
rep<-factor(Replication)
trt<-factor(Variety)
Y<- cbind (DPI, DFF, DF,DFC,DTM,DTD,FLA,DTM,PH,	TN,PL,FG,UFG,Yield)
md<-aov(DPI~rep+trt)	
summary(md)

md<-aov(Y~rep+trt)	
summary(md)


Lettering
Y<- cbind (DPI)
md<-aov(UFG~rep+trt)
summary(md)
library(agricolae)
LSD.test(md,"trt", console=T) ## ................ Correct 
