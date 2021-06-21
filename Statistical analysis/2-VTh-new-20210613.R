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

eta_squared(a.aov, partial = FALSE)

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

eta_squared(a.aov, partial = FALSE)