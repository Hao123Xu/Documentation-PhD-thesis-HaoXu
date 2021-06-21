
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

eta_squared(a.aov, partial = FALSE)

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

eta_squared(a.aov, partial = FALSE)