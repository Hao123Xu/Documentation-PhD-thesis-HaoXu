##############################################################
## Anlaysis
##############################################################
##
TbTh=read.csv("D:/Desktop/Chapter7/2021_Jan_Quantitative New-3/6-Trabecular-ROI/2-TbTh/ROI-Trabecular_TbTh-Analysis-5.csv")


## boxplots range=3
par( mar=c(5, 5, 3, 0.5))
boxplot(TbTh[,1],TbTh[,2],TbTh[,3],TbTh[,4],TbTh[,5],TbTh[,6],TbTh[,7],TbTh[,8], ylab=expression(bold("Tb.Th(µm)")), main="Thickness of trabecular bone", names=c("T1P","T1A","T1S","T1C","T2P","T2A","T2S","T2C"), xlab = expression(bold("Group")),cex.lab=2, cex.axis=1.5, cex.main=2,col=terrain.colors(8),boxlwd = 1.5, whisklty = 2, staplelwd = 1.5,outcex = 2, medlwd=1.5, medcol = "red", range=4)
box(lwd=2)
par(font.axis = 2)
stripchart(TbTh,vertical = TRUE, data = TbTh, method = "jitter", add = TRUE, pch = 20, col = 'blue')

#####################################################
### ANOVA T1
TbTh1<-na.omit(TbTh[,1])
TbTh2<-na.omit(TbTh[,2])
TbTh3<-na.omit(TbTh[,3])
TbTh4<-na.omit(TbTh[,4])

BTH=c(TbTh1,TbTh2,TbTh3,TbTh4)
A <- factor(c(rep("T1P",10),rep("T1A",14),rep("T1S",10),rep("T1C",11)))
DATA <- data.frame(BTH,A)
a.aov <- aov(BTH~A,data=DATA) 
summary(a.aov)

eta_squared(a.aov, partial = FALSE)


#####################################################
### ANOVA T2
TbTh5<-na.omit(TbTh[,5])
TbTh6<-na.omit(TbTh[,6])
TbTh7<-na.omit(TbTh[,7])
TbTh8<-na.omit(TbTh[,8])

BTH=c(TbTh5,TbTh6,TbTh7,TbTh8)
A <- factor(c(rep("T2P",7),rep("T2A",7),rep("T2S",7),rep("T2C",6)))
DATA <- data.frame(BTH,A)
a.aov <- aov(BTH~A,data=DATA) 
summary(a.aov)

eta_squared(a.aov, partial = FALSE)
