x<-c(121,123,108,118,111,109,114,103,110,115)
y<-c(25,22,19,24,19,18,20,15,20,21)
reg<-lm(y~x) #regresion
anova(reg)  #anova
s.reg<-summary(reg) #resumen y significancia
s.reg
coef<-reg$coefficients #coeficientes de regresion
coef
res<-reg$resid #vector de residuales
linear<-coef[1]+coef[2]*x+res #modelo
par(mfrow=c(1,1))
plot(x,linear,main="Dispersion del Modelo Ajustado",)  #grafico de dispercion
visreg(reg, main="Regresi�n nuevos IVM") #grafico de regresion
par(mfrow=c(2,2))
plot(reg,main="Regresion nuevos IVM",col=4) #grafico de normalidad #del QQ plot vemos que es una distribuci�n de colas ligeras, se observa la normalidad de los errores
shapiro.test(res)  #test shapiro para residuales
par(mfrow=c(1,1))
plot(x,res)
plotCI(linear,res,.05,err="y",main="Bandas de Confianza del Error")
durbin.watson(reg)  #prueba durbin watson para probar el supuesto de los residuos no correlacionados
outlier.test(reg,cutoff=Inf,n.mx=Inf) 
hist(res)
#Interpretaci�n shapiro: Siendo la hip�tesis nula que la poblaci�n est� distribuida normalmente, si el p-valor es menor a alfa (nivel de confianza) entonces la hip�tesis nula es rechazada (se concluye que los datos no vienen de una distribuci�n normal). Si el p-valor es mayor a alfa, no se rechaza la hip�tesis y se concluye que los datos siguen una distribuci�n normal.

#analisis de residuales