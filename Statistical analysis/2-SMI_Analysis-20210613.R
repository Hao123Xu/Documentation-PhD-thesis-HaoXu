##############################################################
## Anlaysis
##############################################################
##
SMI=read.csv("D:/Desktop/Chapter7/2021_Jan_Quantitative New-3/6-Trabecular-ROI/4-SMI/ROI-Trabecular_SMI-Analysis-3.csv")


## boxplots range=3
par( mar=c(5, 5, 3, 0.5))
boxplot(SMI[,1],SMI[,2],SMI[,3],SMI[,4],SMI[,5],SMI[,6],SMI[,7],SMI[,8], ylab=expression(bold("SMI")), main="Structure model index of trabecular bone", names=c("T1P","T1A","T1S","T1C","T2P","T2A","T2S","T2C"), xlab = expression(bold("Group")),cex.lab=2, cex.axis=1.5, cex.main=2,col=terrain.colors(8),boxlwd = 1.5, whisklty = 2, staplelwd = 1.5,outcex = 2, medlwd=1.5, medcol = "red", range=4)
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

eta_squared(a.aov, partial = FALSE)

#####################################################
### ANOVA T2
SMI5<-na.omit(SMI[,5])
SMI6<-na.omit(SMI[,6])
SMI7<-na.omit(SMI[,7])
SMI8<-na.omit(SMI[,8])

BTH=c(SMI5,SMI6,SMI7,SMI8)
A <- factor(c(rep("T2P",5),rep("T2A",7),rep("T2S",7),rep("T2C",7)))
DATA <- data.frame(BTH,A)
a.aov <- aov(BTH~A,data=DATA) 
summary(a.aov)

eta_squared(a.aov, partial = FALSE)