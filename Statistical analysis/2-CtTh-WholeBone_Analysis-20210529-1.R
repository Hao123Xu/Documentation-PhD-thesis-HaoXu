##############################################################
## Anlaysis
##############################################################
##
CtTh=read.csv("D:/Desktop/Chapter7/2021_Jan_Quantitative New-3/8-CtTh-whole bone/CtTh_WholeBone_Analysis-2.csv")

## boxplots range=3
par( mar=c(5, 5, 3, 0.5))
boxplot(CtTh[,1],CtTh[,2],CtTh[,3],CtTh[,4],CtTh[,5],CtTh[,6],CtTh[,7],CtTh[,8], ylab=expression(bold("Ct.Th(µm)")), main="Thickness of cortical bone", names=c("T1P","T1A","T1S","T1C","T2P","T2A","T2S","T2C"), xlab = expression(bold("Group")),cex.lab=2, cex.axis=1.5, cex.main=2,col=terrain.colors(8),boxlwd = 1.5, whisklty = 2, staplelwd = 1.5,outcex = 2, medlwd=1.5, medcol = "red", range=3)
box(lwd=2)
par(font.axis = 2)
stripchart(CtTh,vertical = TRUE, data = CtTh, method = "jitter", add = TRUE, pch = 20, col = 'blue')

#
CtThnew1=na.exclude(CtTh[,1])
CtThnew2=na.exclude(CtTh[,2])
CtThnew3=na.exclude(CtTh[,3])
CtThnew4=na.exclude(CtTh[,4])
CtThnew5=na.exclude(CtTh[,5])
CtThnew6=na.exclude(CtTh[,6])
CtThnew7=na.exclude(CtTh[,7])
CtThnew8=na.exclude(CtTh[,8])

### grubbs.test for outlier detection
install.packages("outliers")
library(outliers)

grubbs.test(CtThnew1, type = 10, opposite = FALSE, two.sided = FALSE)
grubbs.test(CtThnew1, type = 10, opposite = TRUE, two.sided = FALSE)

grubbs.test(CtThnew2, type = 10, opposite = FALSE, two.sided = FALSE)
grubbs.test(CtThnew2, type = 10, opposite = TRUE, two.sided = FALSE)

grubbs.test(CtThnew3, type = 10, opposite = FALSE, two.sided = FALSE)
grubbs.test(CtThnew3, type = 10, opposite = TRUE, two.sided = FALSE)

grubbs.test(CtThnew4, type = 10, opposite = FALSE, two.sided = FALSE)
grubbs.test(CtThnew4, type = 10, opposite = TRUE, two.sided = FALSE)

grubbs.test(CtThnew5, type = 10, opposite = FALSE, two.sided = FALSE)
grubbs.test(CtThnew5, type = 10, opposite = TRUE, two.sided = FALSE)

grubbs.test(CtThnew6, type = 10, opposite = FALSE, two.sided = FALSE)
grubbs.test(CtThnew6, type = 10, opposite = TRUE, two.sided = FALSE)

grubbs.test(CtThnew7, type = 10, opposite = FALSE, two.sided = FALSE)
grubbs.test(CtThnew7, type = 10, opposite = TRUE, two.sided = FALSE)

grubbs.test(CtThnew8, type = 10, opposite = FALSE, two.sided = FALSE)
grubbs.test(CtThnew8, type = 10, opposite = TRUE, two.sided = FALSE)

##################################################
### Test normality
### lillie.test
#Datas <- subset(CtTh, select=c("X.nan"))
library("nortest")
lillie.test(CtThnew1)

library("nortest")
lillie.test(CtThnew2)

library("nortest")
lillie.test(CtThnew3)

library("nortest")
lillie.test(CtThnew4)

library("nortest")
lillie.test(CtThnew5)

library("nortest")
lillie.test(CtThnew6)

library("nortest")
lillie.test(CtThnew7)

library("nortest")
lillie.test(CtThnew8)


##################################################
### Test homoscedasticity
### bartlett.test in normal distribution

#CtThnew=c(CtThnew1,CtThnew2,CtThnew3,CtThnew4,CtThnew5,CtThnew6,CtThnew7,CtThnew8)
#A <- factor(c(rep("group1",10),rep("group2",14),rep("group3",10),rep("group4",11),rep("group5",7),rep("group6",7),rep("group7",7),rep("group8",7)))
#DATA <- data.frame(CtThnew,A)
#bartlett.test(CtThnew~A,data=DATA)

# T1
CtThnew=c(CtThnew1,CtThnew2,CtThnew3,CtThnew4)
A <- factor(c(rep("group1",10),rep("group2",14),rep("group3",10),rep("group4",10)))
DATA <- data.frame(CtThnew,A)
bartlett.test(CtThnew~A,data=DATA)

# T2
CtThnew=c(CtThnew5,CtThnew6,CtThnew7,CtThnew8)
A <- factor(c(rep("group5",5),rep("group6",7),rep("group7",6),rep("group8",7)))
DATA <- data.frame(CtThnew,A)
bartlett.test(CtThnew~A,data=DATA)

#####################################################
### ANOVA T1
CtTh1<-na.omit(CtTh[,1])
CtTh2<-na.omit(CtTh[,2])
CtTh3<-na.omit(CtTh[,3])
CtTh4<-na.omit(CtTh[,4])

BTH=c(CtTh1,CtTh2,CtTh3,CtTh4)
A <- factor(c(rep("T1P",10),rep("T1A",14),rep("T1S",10),rep("T1C",10)))
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
CtTh5<-na.omit(CtTh[,5])
CtTh6<-na.omit(CtTh[,6])
CtTh7<-na.omit(CtTh[,7])
CtTh8<-na.omit(CtTh[,8])

BTH=c(CtTh5,CtTh6,CtTh7,CtTh8)
A <- factor(c(rep("T2P",5),rep("T2A",7),rep("T2S",6),rep("T2C",7)))
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

