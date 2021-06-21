##############################################################
## Anlaysis
##############################################################
##
FD_Tb=read.csv("D:/Desktop/Chapter7/2021_Jan_Quantitative New-3/6-Trabecular-ROI/3-FD/ROI-Trabecular_FD-Analysis-3.csv")


## boxplots range=2
par( mar=c(5, 5, 3, 0.5))
boxplot(FD_Tb[,1],FD_Tb[,2],FD_Tb[,3],FD_Tb[,4],FD_Tb[,5],FD_Tb[,6],FD_Tb[,7],FD_Tb[,8], ylab=expression(bold("FD")), main="Fractal dimension of trabecular bone ", names=c("T1P","T1A","T1S","T1C","T2P","T2A","T2S","T2C"), xlab = expression(bold("Group")),cex.lab=2, cex.axis=1.5, cex.main=2,col=terrain.colors(8),boxlwd = 1.5, whisklty = 2, staplelwd = 1.5,outcex = 2,medlwd=1.5, medcol = "red", range=1.5)
box(lwd=2)
par(font.axis = 2)
stripchart(FD_Tb,vertical = TRUE, data = FD_Tb, method = "jitter", add = TRUE, pch = 20, col = 'blue')


#
FD_Tbnew1=na.exclude(FD_Tb[,1])
FD_Tbnew2=na.exclude(FD_Tb[,2])
FD_Tbnew3=na.exclude(FD_Tb[,3])
FD_Tbnew4=na.exclude(FD_Tb[,4])
FD_Tbnew5=na.exclude(FD_Tb[,5])
FD_Tbnew6=na.exclude(FD_Tb[,6])
FD_Tbnew7=na.exclude(FD_Tb[,7])
FD_Tbnew8=na.exclude(FD_Tb[,8])

#####################################################
### ANOVA T1
FD_Tb1<-na.omit(FD_Tb[,1])
FD_Tb2<-na.omit(FD_Tb[,2])
FD_Tb3<-na.omit(FD_Tb[,3])
FD_Tb4<-na.omit(FD_Tb[,4])

BTH=c(FD_Tb1,FD_Tb2,FD_Tb3,FD_Tb4)
A <- factor(c(rep("T1P",10),rep("T1A",14),rep("T1S",10),rep("T1C",11)))
DATA <- data.frame(BTH,A)
a.aov <- aov(BTH~A,data=DATA) 
summary(a.aov)

eta_squared(a.aov, partial = FALSE)

#####################################################
### ANOVA T2
FD_Tb5<-na.omit(FD_Tb[,5])
FD_Tb6<-na.omit(FD_Tb[,6])
FD_Tb7<-na.omit(FD_Tb[,7])
FD_Tb8<-na.omit(FD_Tb[,8])

BTH=c(FD_Tb5,FD_Tb6,FD_Tb7,FD_Tb8)
A <- factor(c(rep("T2P",6),rep("T2A",7),rep("T2S",5),rep("T2C",7)))
DATA <- data.frame(BTH,A)
a.aov <- aov(BTH~A,data=DATA) 
summary(a.aov)

eta_squared(a.aov, partial = FALSE)
