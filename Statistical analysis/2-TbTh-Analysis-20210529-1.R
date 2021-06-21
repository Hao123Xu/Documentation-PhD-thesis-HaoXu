##############################################################
## Anlaysis
##############################################################
##
TbTh=read.csv("D:/Desktop/Chapter7/2021_Jan_Quantitative New-3/6-Trabecular-ROI/2-TbTh/ROI-Trabecular_TbTh-Analysis-4.csv")


## boxplots range=3
par( mar=c(5, 5, 3, 0.5))
boxplot(TbTh[,1],TbTh[,2],TbTh[,3],TbTh[,4],TbTh[,5],TbTh[,6],TbTh[,7],TbTh[,8], ylab=expression(bold("Tb.Th(µm)")), main="Thickness of trabecular bone", names=c("T1P","T1A","T1S","T1C","T2P","T2A","T2S","T2C"), xlab = expression(bold("Group")),cex.lab=2, cex.axis=1.5, cex.main=2,col=terrain.colors(8),boxlwd = 1.5, whisklty = 2, staplelwd = 1.5,outcex = 2, medlwd=1.5, medcol = "red", range=4)
box(lwd=2)
par(font.axis = 2)
stripchart(TbTh,vertical = TRUE, data = TbTh, method = "jitter", add = TRUE, pch = 20, col = 'blue')

#
TbThnew1=na.exclude(TbTh[,1])
TbThnew2=na.exclude(TbTh[,2])
TbThnew3=na.exclude(TbTh[,3])
TbThnew4=na.exclude(TbTh[,4])
TbThnew5=na.exclude(TbTh[,5])
TbThnew6=na.exclude(TbTh[,6])
TbThnew7=na.exclude(TbTh[,7])
TbThnew8=na.exclude(TbTh[,8])

### grubbs.test for outlier detection
install.packages("outliers")
library(outliers)

grubbs.test(TbThnew1, type = 10, opposite = FALSE, two.sided = FALSE)
grubbs.test(TbThnew1, type = 10, opposite = TRUE, two.sided = FALSE)

grubbs.test(TbThnew2, type = 10, opposite = FALSE, two.sided = FALSE)
grubbs.test(TbThnew2, type = 10, opposite = TRUE, two.sided = FALSE)

grubbs.test(TbThnew3, type = 10, opposite = FALSE, two.sided = FALSE)
grubbs.test(TbThnew3, type = 10, opposite = TRUE, two.sided = FALSE)

grubbs.test(TbThnew4, type = 10, opposite = FALSE, two.sided = FALSE)
grubbs.test(TbThnew4, type = 10, opposite = TRUE, two.sided = FALSE)

grubbs.test(TbThnew5, type = 10, opposite = FALSE, two.sided = FALSE)
grubbs.test(TbThnew5, type = 10, opposite = TRUE, two.sided = FALSE)

grubbs.test(TbThnew6, type = 10, opposite = FALSE, two.sided = FALSE)
grubbs.test(TbThnew6, type = 10, opposite = TRUE, two.sided = FALSE)

grubbs.test(TbThnew7, type = 10, opposite = FALSE, two.sided = FALSE)
grubbs.test(TbThnew7, type = 10, opposite = TRUE, two.sided = FALSE)

grubbs.test(TbThnew8, type = 10, opposite = FALSE, two.sided = FALSE)
grubbs.test(TbThnew8, type = 10, opposite = TRUE, two.sided = FALSE)

##################################################
### Test normality
### lillie.test
#Datas <- subset(TbTh, select=c("X.nan"))
library("nortest")
lillie.test(TbThnew1)

library("nortest")
lillie.test(TbThnew2)

library("nortest")
lillie.test(TbThnew3)

library("nortest")
lillie.test(TbThnew4)

library("nortest")
lillie.test(TbThnew5)

library("nortest")
lillie.test(TbThnew6)

library("nortest")
lillie.test(TbThnew7)

library("nortest")
lillie.test(TbThnew8)

##################################################
### Test homoscedasticity
### bartlett.test in normal distribution

#TbThnew=c(TbThnew1,TbThnew2,TbThnew3,TbThnew4,TbThnew5,TbThnew6,TbThnew7,TbThnew8)
#A <- factor(c(rep("group1",10),rep("group2",14),rep("group3",10),rep("group4",11),rep("group5",7),rep("group6",7),rep("group7",7),rep("group8",7)))
#DATA <- data.frame(TbThnew,A)
#bartlett.test(TbThnew~A,data=DATA)

# T1
TbThnew=c(TbThnew1,TbThnew2,TbThnew3,TbThnew4)
A <- factor(c(rep("group1",9),rep("group2",12),rep("group3",10),rep("group4",10)))
DATA <- data.frame(TbThnew,A)
bartlett.test(TbThnew~A,data=DATA)

# T2
TbThnew=c(TbThnew5,TbThnew6,TbThnew7,TbThnew8)
A <- factor(c(rep("group5",7),rep("group6",6),rep("group7",7),rep("group8",5)))
DATA <- data.frame(TbThnew,A)
bartlett.test(TbThnew~A,data=DATA)

#####################################################
### ANOVA T1
TbTh1<-na.omit(TbTh[,1])
TbTh2<-na.omit(TbTh[,2])
TbTh3<-na.omit(TbTh[,3])
TbTh4<-na.omit(TbTh[,4])

BTH=c(TbTh1,TbTh2,TbTh3,TbTh4)
A <- factor(c(rep("T1P",9),rep("T1A",12),rep("T1S",10),rep("T1C",10)))
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
TbTh5<-na.omit(TbTh[,5])
TbTh6<-na.omit(TbTh[,6])
TbTh7<-na.omit(TbTh[,7])
TbTh8<-na.omit(TbTh[,8])

BTH=c(TbTh5,TbTh6,TbTh7,TbTh8)
A <- factor(c(rep("T2P",7),rep("T2A",6),rep("T2S",7),rep("T2C",5)))
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
