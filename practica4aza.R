# ______________Gráficos____________
#  Se va a trabajar con la matriz penguins

#--------------------------------------------
# Importación de matriz 
#-------------------------------------------

# Import data / from excel /browse / seleccionar archivo / aceptar

#--------------------------------------
#    Exploracion
#-----------------------------------
#dimensión de la matriz
dim(penguins_A)
#nombre de las variables
colnames(penguins_A)
#indica el tipo de variable (str)
str(penguins_A)
anyNA(penguins_A)

# Estadistica descriptiva
summary(penguins_A)

#-----------------------------------------
# Configuración de la matriz
#------------------------------------------

#1.- Convertir las variables categóticas a factores
penguins_A$especie
penguins_A$especie<-factor(penguins_A$especie, 
                         levels=c("Adelie", "Gentoo", "Chinstrap"))

penguins$isla
penguins$isla<-factor(penguins$isla, 
                      levels=c("Torgersen", "Biscoe", "Dream"))


penguins$genero<-factor(penguins$genero, 
                        levels=c("male", "female"))

penguins$año<-factor(penguins$año, 
                     levels=c("2007", "2008", "2009"))

str(penguins)

summary(penguins)

View(penguins)

# ---Este paso no es opcional.---
# 2.- Creamos una nueva matriz de datos donde se seleccionan
# las columnas de la 2 a la 9.
BD1<-BD[,2:9]


#---------------------------------
#   Librerías
#----------------------------------
install.packages("ggplot2")

library(ggplot2)


# ------------------------------------------------
#         Boxplot(gráfica de exploración)
#--------------------------------------------------

# 1.- Creación de un vector de color
color=c("darkorchid1","darkseagreen1")

# 2.- Creacion del grafico

BX<-ggplot(penguins, aes(x=genero, y=largo_pico_mm))+
  geom_boxplot(fill=color)+
  ggtitle("Boxplot")+
  xlab("Género")+
  ylab("largo del pico (mm)")+
  theme_bw()

# 3.- Visualización del boxplot
BX

#--------------------------------------------------
#            Gráfico de barras (variables cualitativas)
#--------------------------------------------------

# 1.- Creación de un vector de color
color=c("aquamarine1", "cadetblue4", "chartreuse1")

# 2.- Creación del gráfico
GB1<-ggplot(penguins, aes(x=año))+
  geom_bar(colour= "darkblue", fill=color)+
  ggtitle("Gráfico de Barras")+
  xlab("Año")+
  ylab("Frecuencias")+
  theme_minimal()

# 3.- Visualizacion del grafico
GB1

# 4.- Barras verticales

GB2<-ggplot(penguins, aes(x=año))+
  geom_bar(colour= "darkblue", fill=color)+
  ggtitle("Gráfico de Barras")+
  xlab("Año")+
  ylab("Frecuencias")+
  coord_flip()+
  theme_minimal()

# 5. Visualizacion del objeto
GB2

#--------------------------------------------------
#           Histograma (variable cuantitativa)
#---------------------------------------------------

# 1.- Construccion del grafico

HG<-ggplot(penguins, aes(x=largo_aleta_mm))+
  geom_histogram(col="darkblue", fill="darkmagenta")+
  ggtitle("Histograma")+
  xlab("Largo de la aleta (mm)")+
  ylab("Frecuencias")+
  theme_classic()

# 2.- Visualizacion del grafico
HG

#----------------------------------
#   Grafico de dispersion (se visualizan hasta 3 variables juntas 2 cuantitativas y una cualitativagrupos)
#-----------------------------------

# 1.- Construccion del grafico


GD<-ggplot(penguins, aes(x=largo_pico_mm, y=grosor_pico_mm))+
  geom_point(aes(color=especie))+
  scale_color_manual(values = c("darkblue", "darkorchid","darkorange" ))+
  ggtitle("Gráfico de dispersión")+
  xlab("largo del pico (mm)")+
  ylab("grosor del pico (mm)")+
  theme_light()

# 2.- Visualizacion del objeto
GD

#-------------------------------
#  Organizacion de graficos
#-------------------------------

# 1.- Descargar el paquete gridExtra

install.packages("gridExtra")

# 2.- Abrir la libreria
library(gridExtra)
#row renglón y columna
# 3.- Organizacion 2 graficos en una fila y dos columnas 
grid.arrange(BX,GB1, nrow=1, ncol=2)

# 4.- Organizacion 3 graficos en dos filas y dos columnas 
grid.arrange(BX,GB1,HG, nrow=2, ncol=2)

# 5.- Organizacion 4 graficos en dos filas y dos columnas 
grid.arrange(BX,GB1,HG,GD, nrow=2, ncol=2)
