##############################################################
## Anlaysis
##############################################################
##
SMI=read.csv("D:/Desktop/Chapter7/2021_Jan_Quantitative New-3/6-Trabecular-ROI/5-ConnD/ROI-Trabecular_ConnD_analysis-2.csv")


## boxplots range=3
par( mar=c(5, 5, 3, 0.5))
boxplot(SMI[,1],SMI[,2],SMI[,3],SMI[,4],SMI[,5],SMI[,6],SMI[,7],SMI[,8], ylab=expression(bold("Conn.D(1/mm^3)")), main="Connectivity density of trabecular bone", names=c("T1P","T1A","T1S","T1C","T2P","T2A","T2S","T2C"), xlab = expression(bold("Group")),cex.lab=2, cex.axis=1.5, cex.main=2,col=terrain.colors(8),boxlwd = 1.5, whisklty = 2, staplelwd = 1.5,outcex = 2,medlwd=1.5,medcol = "red", range=3)
box(lwd=2)
par(font.axis = 2)
stripchart(SMI,vertical = TRUE, data = SMI, method = "jitter", add = TRUE, pch = 20, col = 'blue')


#
SMInew1=na.exclude(SMI[,1])
SMInew2=na.exclude(SMI[,2])
SMInew3=na.exclude(SMI[,3])
SMInew4=na.exclude(SMI[,4])
SMInew5=na.exclude(SMI[,5])
SMInew6=na.exclude(SMI[,6])
SMInew7=na.exclude(SMI[,7])
SMInew8=na.exclude(SMI[,8])

### grubbs.test for outlier detection
install.packages("outliers")
library(outliers)

grubbs.test(SMInew1, type = 10, opposite = FALSE, two.sided = FALSE)
grubbs.test(SMInew1, type = 10, opposite = TRUE, two.sided = FALSE)

grubbs.test(SMInew2, type = 10, opposite = FALSE, two.sided = FALSE)
grubbs.test(SMInew2, type = 10, opposite = TRUE, two.sided = FALSE)

grubbs.test(SMInew3, type = 10, opposite = FALSE, two.sided = FALSE)
grubbs.test(SMInew3, type = 10, opposite = TRUE, two.sided = FALSE)

grubbs.test(SMInew4, type = 10, opposite = FALSE, two.sided = FALSE)
grubbs.test(SMInew4, type = 10, opposite = TRUE, two.sided = FALSE)

grubbs.test(SMInew5, type = 10, opposite = FALSE, two.sided = FALSE)
grubbs.test(SMInew5, type = 10, opposite = TRUE, two.sided = FALSE)

grubbs.test(SMInew6, type = 10, opposite = FALSE, two.sided = FALSE)
grubbs.test(SMInew6, type = 10, opposite = TRUE, two.sided = FALSE)

grubbs.test(SMInew7, type = 10, opposite = FALSE, two.sided = FALSE)
grubbs.test(SMInew7, type = 10, opposite = TRUE, two.sided = FALSE)

grubbs.test(SMInew8, type = 10, opposite = FALSE, two.sided = FALSE)
grubbs.test(SMInew8, type = 10, opposite = TRUE, two.sided = FALSE)
##################################################
### Test normality
### lillie.test
#Datas <- subset(SMI, select=c("X.nan"))
library("nortest")
lillie.test(SMInew1)

library("nortest")
lillie.test(SMInew2)

library("nortest")
lillie.test(SMInew3)

library("nortest")
lillie.test(SMInew4)

library("nortest")
lillie.test(SMInew5)

library("nortest")
lillie.test(SMInew6)

library("nortest")
lillie.test(SMInew7)

library("nortest")
lillie.test(SMInew8)

##################################################
### Test homoscedasticity
### bartlett.test in normal distribution

#SMInew=c(SMInew1,SMInew2,SMInew3,SMInew4,SMInew5,SMInew6,SMInew7,SMInew8)
#A <- factor(c(rep("group1",10),rep("group2",14),rep("group3",10),rep("group4",11),rep("group5",7),rep("group6",7),rep("group7",7),rep("group8",7)))
#DATA <- data.frame(SMInew,A)
#bartlett.test(SMInew~A,data=DATA)

# T1
SMInew=c(SMInew1,SMInew2,SMInew3,SMInew4)
A <- factor(c(rep("group1",10),rep("group2",14),rep("group3",10),rep("group4",11)))
DATA <- data.frame(SMInew,A)
bartlett.test(SMInew~A,data=DATA)

# T2
SMInew=c(SMInew5,SMInew6,SMInew7,SMInew8)
A <- factor(c(rep("group5",6),rep("group6",7),rep("group7",7),rep("group8",7)))
DATA <- data.frame(SMInew,A)
bartlett.test(SMInew~A,data=DATA)

#####################################################
### ANOVA T1
SMI1<-na.omit(SMI[,1])
SMI2<-na.omit(SMI[,2])
SMI3<-na.omit(SMI[,3])
SMI4<-na.omit(SMI[,4])

BTH=c(SMI1,SMI2,SMI3,SMI4)
A <- factor(c(rep("T1P",10),rep("T1A",14),rep("T1S",10),rep("T1C",11)))
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
SMI5<-na.omit(SMI[,5])
SMI6<-na.omit(SMI[,6])
SMI7<-na.omit(SMI[,7])
SMI8<-na.omit(SMI[,8])

BTH=c(SMI5,SMI6,SMI7,SMI8)
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

