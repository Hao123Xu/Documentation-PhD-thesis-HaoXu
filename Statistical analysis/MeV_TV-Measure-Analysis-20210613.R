
##############################################################
## Anlaysis
##############################################################
##
CtVTV=read.csv("D:/Desktop/Chapter7/2021_Jan_Quantitative New-3/2-MeVTV/MeV_TV_analysis-1.csv")

## 
par( mar=c(5, 5, 3, 0.5))
boxplot(CtVTV[,1],CtVTV[,2],CtVTV[,3],CtVTV[,4], ylab=expression(bold("Me.V/TV")), main="Metastases volume fractions", names=c("T2P","T2A","T2S","T2C"), xlab = expression(bold("Group")),cex.lab=2, cex.axis=1.5, cex.main=2,col=terrain.colors(8),boxlwd = 1.5, whisklty = 2, staplelwd = 1.5,outcex = 2, medlwd=1.5, medcol = "red")
box(lwd=2)
par(font.axis = 2)
stripchart(CtVTV,vertical = TRUE, data = CtVTV, method = "jitter", add = TRUE, pch = 20, col = 'blue')

## 
par( mar=c(5, 5, 3, 0.5))
boxplot(CtVTV[,1],CtVTV[,2],CtVTV[,3],CtVTV[,4], ylab=expression(bold("Metas.V/TV")), main="Metastases volume fractions", names=c("T2P","T2A","T2S","T2C"), xlab = expression(bold("Group")),cex.lab=2, cex.axis=1.5, cex.main=2,col=terrain.colors(8),boxlwd = 1.5, whisklty = 2, staplelwd = 1.5,outcex = 2, medlwd=1.5, medcol = "red")
box(lwd=2)
par(font.axis = 2)
stripchart(CtVTV,vertical = TRUE, data = CtVTV, method = "jitter", add = TRUE, pch = 20, col = 'blue')


CtVTVnew1=na.exclude(CtVTV[,1])
CtVTVnew2=na.exclude(CtVTV[,2])
CtVTVnew3=na.exclude(CtVTV[,3])
CtVTVnew4=na.exclude(CtVTV[,4])

#####################################################
### ANOVA T1
CtVTV1<-na.omit(CtVTV[,1])
CtVTV2<-na.omit(CtVTV[,2])
CtVTV3<-na.omit(CtVTV[,3])
CtVTV4<-na.omit(CtVTV[,4])

BTH=c(CtVTV1,CtVTV2,CtVTV3,CtVTV4)
A <- factor(c(rep("T2P",7),rep("T2A",7),rep("T2S",7),rep("T2C",7)))
DATA <- data.frame(BTH,A)
a.aov <- aov(BTH~A,data=DATA) 
summary(a.aov)

eta_squared(a.aov, partial = FALSE)