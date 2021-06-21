##
BVTV=read.csv("D:/Desktop/Chapter7/2021_Jan_Quantitative New-3/9-Vessel/VTh-1.csv")

## 
par( mar=c(5, 5, 3, 0.5))
boxplot(BVTV[,1],BVTV[,2],BVTV[,3],BVTV[,4],BVTV[,5],BVTV[,6],BVTV[,7],BVTV[,8], ylab=expression(bold("V.Th(µm)")), main="Thickness of vessel", names=c("T1P","T1A","T1S","T1C","T2P","T2A","T2S","T2C"), xlab = expression(bold("Group")),cex.lab=2, cex.axis=1.5, cex.main=2,col=terrain.colors(8),boxlwd = 1.5, whisklty = 2, staplelwd = 1.5,outcex = 2, medlwd=1.5, medcol = "red", range=5)
box(lwd=2)
par(font.axis = 2)
stripchart(BVTV,vertical = TRUE, data = BVTV, method = "jitter", add = TRUE, pch = 20, col = 'blue')


BVTVnew1=na.exclude(BVTV[,1])
BVTVnew2=na.exclude(BVTV[,2])
BVTVnew3=na.exclude(BVTV[,3])
BVTVnew4=na.exclude(BVTV[,4])
BVTVnew5=na.exclude(BVTV[,5])
BVTVnew6=na.exclude(BVTV[,6])
BVTVnew7=na.exclude(BVTV[,7])
BVTVnew8=na.exclude(BVTV[,8])

### grubbs.test for outlier detection
install.packages("outliers")
library(outliers)

grubbs.test(BVTVnew1, type = 10, opposite = FALSE, two.sided = FALSE)
grubbs.test(BVTVnew1, type = 10, opposite = TRUE, two.sided = FALSE)

grubbs.test(BVTVnew2, type = 10, opposite = FALSE, two.sided = FALSE)
grubbs.test(BVTVnew2, type = 10, opposite = TRUE, two.sided = FALSE)

grubbs.test(BVTVnew3, type = 10, opposite = FALSE, two.sided = FALSE)
grubbs.test(BVTVnew3, type = 10, opposite = TRUE, two.sided = FALSE)

grubbs.test(BVTVnew4, type = 10, opposite = FALSE, two.sided = FALSE)
grubbs.test(BVTVnew4, type = 10, opposite = TRUE, two.sided = FALSE)

grubbs.test(BVTVnew5, type = 10, opposite = FALSE, two.sided = FALSE)
grubbs.test(BVTVnew5, type = 10, opposite = TRUE, two.sided = FALSE)

grubbs.test(BVTVnew6, type = 10, opposite = FALSE, two.sided = FALSE)
grubbs.test(BVTVnew6, type = 10, opposite = TRUE, two.sided = FALSE)

grubbs.test(BVTVnew7, type = 10, opposite = FALSE, two.sided = FALSE)
grubbs.test(BVTVnew7, type = 10, opposite = TRUE, two.sided = FALSE)

grubbs.test(BVTVnew8, type = 10, opposite = FALSE, two.sided = FALSE)
grubbs.test(BVTVnew8, type = 10, opposite = TRUE, two.sided = FALSE)

##################################################
### Test normality
### lillie.test
#Datas <- subset(BVTV, select=c("X.nan"))
library("nortest")
lillie.test(BVTVnew1)

library("nortest")
lillie.test(BVTVnew2)

library("nortest")
lillie.test(BVTVnew3)

library("nortest")
lillie.test(BVTVnew4)

library("nortest")
lillie.test(BVTVnew5)

library("nortest")
lillie.test(BVTVnew6)

library("nortest")
lillie.test(BVTVnew7)

library("nortest")
lillie.test(BVTVnew8)

##################################################
### Test homoscedasticity
### bartlett.test in normal distribution

#BVTVnew=c(BVTVnew1,BVTVnew2,BVTVnew3,BVTVnew4,BVTVnew5,BVTVnew6,BVTVnew7,BVTVnew8)
#A <- factor(c(rep("group1",10),rep("group2",14),rep("group3",10),rep("group4",11),rep("group5",7),rep("group6",7),rep("group7",7),rep("group8",7)))
#DATA <- data.frame(BVTVnew,A)
#bartlett.test(BVTVnew~A,data=DATA)

# T1
BVTVnew=c(BVTVnew1,BVTVnew2,BVTVnew3,BVTVnew4)
A <- factor(c(rep("group1",10),rep("group2",14),rep("group3",9),rep("group4",11)))
DATA <- data.frame(BVTVnew,A)
bartlett.test(BVTVnew~A,data=DATA)

# T2
BVTVnew=c(BVTVnew5,BVTVnew6,BVTVnew7,BVTVnew8)
A <- factor(c(rep("group5",7),rep("group6",7),rep("group7",7),rep("group8",7)))
DATA <- data.frame(BVTVnew,A)
bartlett.test(BVTVnew~A,data=DATA)

#####################################################
### ANOVA T1
BVTV1<-na.omit(BVTV[,1])
BVTV2<-na.omit(BVTV[,2])
BVTV3<-na.omit(BVTV[,3])
BVTV4<-na.omit(BVTV[,4])

BTH=c(BVTV1,BVTV2,BVTV3,BVTV4)
A <- factor(c(rep("T1P",10),rep("T1A",14),rep("T1S",9),rep("T1C",11)))
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
BVTV5<-na.omit(BVTV[,5])
BVTV6<-na.omit(BVTV[,6])
BVTV7<-na.omit(BVTV[,7])
BVTV8<-na.omit(BVTV[,8])

BTH=c(BVTV5,BVTV6,BVTV7,BVTV8)
A <- factor(c(rep("T2P",7),rep("T2A",7),rep("T2S",7),rep("T2C",7)))
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
