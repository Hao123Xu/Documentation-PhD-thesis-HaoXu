
##############################################################
## Anlaysis
##############################################################
##
CtVTV=read.csv("D:/Desktop/Chapter7/2021_Jan_Quantitative New-3/3-TbV_MeCaV_ROI/ROI_TbV_MeCaV_analysis-2.csv")

## 
par( mar=c(5, 5, 3, 0.5))
boxplot(CtVTV[,1],CtVTV[,2],CtVTV[,3],CtVTV[,4],CtVTV[,5],CtVTV[,6],CtVTV[,7],CtVTV[,8], ylab=expression(bold("Tb.V/Me.Ca.V")), main="Trabecular bone volume fractions", names=c("T1P","T1A","T1S","T1C","T2P","T2A","T2S","T2C"), xlab = expression(bold("Group")),cex.lab=2, cex.axis=1.5, cex.main=2,col=terrain.colors(8),boxlwd = 1.5, whisklty = 2, staplelwd = 1.5, outcex = 2,medlwd=1.5, medcol = "red", range=1.1)
box(lwd=2)
par(font.axis = 2)
stripchart(CtVTV,vertical = TRUE, data = CtVTV, method = "jitter", add = TRUE, pch = 20, col = 'blue')

CtVTVnew1=na.exclude(CtVTV[,1])
CtVTVnew2=na.exclude(CtVTV[,2])
CtVTVnew3=na.exclude(CtVTV[,3])
CtVTVnew4=na.exclude(CtVTV[,4])
CtVTVnew5=na.exclude(CtVTV[,5])
CtVTVnew6=na.exclude(CtVTV[,6])
CtVTVnew7=na.exclude(CtVTV[,7])
CtVTVnew8=na.exclude(CtVTV[,8])

### grubbs.test for outlier detection
install.packages("outliers")
library(outliers)

grubbs.test(CtVTVnew1, type = 10, opposite = FALSE, two.sided = FALSE)
grubbs.test(CtVTVnew1, type = 10, opposite = TRUE, two.sided = FALSE)

grubbs.test(CtVTVnew2, type = 10, opposite = FALSE, two.sided = FALSE)
grubbs.test(CtVTVnew2, type = 10, opposite = TRUE, two.sided = FALSE)

grubbs.test(CtVTVnew3, type = 10, opposite = FALSE, two.sided = FALSE)
grubbs.test(CtVTVnew3, type = 10, opposite = TRUE, two.sided = FALSE)

grubbs.test(CtVTVnew4, type = 10, opposite = FALSE, two.sided = FALSE)
grubbs.test(CtVTVnew4, type = 10, opposite = TRUE, two.sided = FALSE)

grubbs.test(CtVTVnew5, type = 10, opposite = FALSE, two.sided = FALSE)
grubbs.test(CtVTVnew5, type = 10, opposite = TRUE, two.sided = FALSE)

grubbs.test(CtVTVnew6, type = 10, opposite = FALSE, two.sided = FALSE)
grubbs.test(CtVTVnew6, type = 10, opposite = TRUE, two.sided = FALSE)

grubbs.test(CtVTVnew7, type = 10, opposite = FALSE, two.sided = FALSE)
grubbs.test(CtVTVnew7, type = 10, opposite = TRUE, two.sided = FALSE)

grubbs.test(CtVTVnew8, type = 10, opposite = FALSE, two.sided = FALSE)
grubbs.test(CtVTVnew8, type = 10, opposite = TRUE, two.sided = FALSE)
##################################################
### Test normality
### lillie.test
#Datas <- subset(CtVTV, select=c("X.nan"))
library("nortest")
lillie.test(CtVTVnew1)

library("nortest")
lillie.test(CtVTVnew2)

library("nortest")
lillie.test(CtVTVnew3)

library("nortest")
lillie.test(CtVTVnew4)

library("nortest")
lillie.test(CtVTVnew5)

library("nortest")
lillie.test(CtVTVnew6)

library("nortest")
lillie.test(CtVTVnew7)

library("nortest")
lillie.test(CtVTVnew8)

##################################################
### Test homoscedasticity
### bartlett.test in normal distribution

#CtVTVnew=c(CtVTVnew1,CtVTVnew2,CtVTVnew3,CtVTVnew4,CtVTVnew5,CtVTVnew6,CtVTVnew7,CtVTVnew8)
#A <- factor(c(rep("group1",10),rep("group2",14),rep("group3",10),rep("group4",11),rep("group5",7),rep("group6",7),rep("group7",7),rep("group8",7)))
#DATA <- data.frame(CtVTVnew,A)
#bartlett.test(CtVTVnew~A,data=DATA)

# T1
CtVTVnew=c(CtVTVnew1,CtVTVnew2,CtVTVnew3,CtVTVnew4)
A <- factor(c(rep("group1",10),rep("group2",12),rep("group3",10),rep("group4",11)))
DATA <- data.frame(CtVTVnew,A)
bartlett.test(CtVTVnew~A,data=DATA)

# T2
CtVTVnew=c(CtVTVnew5,CtVTVnew6,CtVTVnew7,CtVTVnew8)
A <- factor(c(rep("group5",6),rep("group6",7),rep("group7",7),rep("group8",7)))
DATA <- data.frame(CtVTVnew,A)
bartlett.test(CtVTVnew~A,data=DATA)

#####################################################
### ANOVA T1
CtVTV1<-na.omit(CtVTV[,1])
CtVTV2<-na.omit(CtVTV[,2])
CtVTV3<-na.omit(CtVTV[,3])
CtVTV4<-na.omit(CtVTV[,4])

BTH=c(CtVTV1,CtVTV2,CtVTV3,CtVTV4)
A <- factor(c(rep("T1P",10),rep("T1A",12),rep("T1S",10),rep("T1C",11)))
DATA <- data.frame(BTH,A)
a.aov <- aov(BTH~A,data=DATA) 
summary(a.aov)

### Tukey HSD
TukeyHSD(a.aov)

### Welch ANOVA
rats.2=oneway.test(BTH~A,data=DATA)
rats.2

### Games-Howell post hoc test after welch ANOVA
### Games-howell test in R and implementing a function
### https://www.biostars.org/p/495976/
source("http://aoki2.si.gunma-u.ac.jp/R/src/tukey.R")
tukey(BTH,A,method="Games-Howell")

#####################################################
### ANOVA T2
CtVTV5<-na.omit(CtVTV[,5])
CtVTV6<-na.omit(CtVTV[,6])
CtVTV7<-na.omit(CtVTV[,7])
CtVTV8<-na.omit(CtVTV[,8])

BTH=c(CtVTV5,CtVTV6,CtVTV7,CtVTV8)
A <- factor(c(rep("T2P",6),rep("T2A",7),rep("T2S",7),rep("T2C",7)))
DATA <- data.frame(BTH,A)
a.aov <- aov(BTH~A,data=DATA) 
summary(a.aov)

### Tukey HSD
TukeyHSD(a.aov)

### Welch ANOVA
rats.2=oneway.test(BTH~A,data=DATA)
rats.2

### Games-Howell post hoc test after welch ANOVA
### Games-howell test in R and implementing a function
### https://www.biostars.org/p/495976/
source("http://aoki2.si.gunma-u.ac.jp/R/src/tukey.R")
tukey(BTH,A,method="Games-Howell")
