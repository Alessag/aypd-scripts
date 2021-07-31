#### ---------------------------------------------------------------------------
#### TEMA. Introducción al procesamiento de datos univariantes y multivariantes
#### Implementación de un algoritmo de clustering

#### REALIZADO POR: Alessandra Amicarella Girardi, V-26.209.731

#### ---------------------------------------------------------------------------
#### ---------------------------------------------------------------------------

####                  CARGA DE PAQUETES
 
library(readr)
library(gapminder)
library(tidyverse)
library(cluster)
library(factoextra)
library(NbClust)
library(tidyr)

#### ---------------------------------------------------------------------------
#### ---------------------------------------------------------------------------

# Lectura de datos: Archivo haberman.data
# La primera fila no contiene los nombres de las columnas
# Los datos estan separados por ,
# La primera columna identifica a las filas
# El archivo contiene 306 filas
# Las variables contienen informacion la supervivencia de pacientes con cancer 
# de mama que han sido operadas ente los anos 1958 y 1970
# Las variables registradas fueron: 
# Edad de la paciente al momento de la operacion (numerica)
# Año de la operacion de la paciente (año - 1900, numerica)
# Número de ganglios axilares positivos detectados (numerica)
# Status de supervivencia (Atributo de clase)
# -- 1 = La paciente sobrevivió 5 años o más
# -- 2 = La paciente falleció en un plazo de 5 años

# Buscar la ruta del archivo y la guardarmos en una variable
ruta_csv <- file.choose()

# Importamos y leemos los datos, le asignamos un titulo a cada columna
# y los guardamos en una variable llamada dataHabermarn
dataHabermarn <- read.csv(ruta_csv,
                          col.names = c('age_at_time_operation',
                                        'age_of_operation',
                                        'positive_axiliary_nodes',
                                        'survival_status')
)

# Miramos los datos 
head(dataHabermarn)

#Vamos a normalizar las puntuaciones
dataHabermarn <- scale(dataHabermarn)
head(dataHabermarn)

# Calcularemos la matriz de distacias(Metodo euclideano)
m.distancia <- get_dist(dataHabermarn, method = "euclidean") #el método aceptado también puede ser: "maximum", "manhattan", "canberra", "binary", "minkowski", "pearson", "spearman" o "kendall"
fviz_dist(m.distancia, gradient = list(low = "blue", mid = "white", high = "red"))

# Estimamos el número de clústers
# Elbow, silhouette o gap_stat  method
fviz_nbclust(df, kmeans, method = "wss")
fviz_nbclust(df, kmeans, method = "silhouette")
fviz_nbclust(df, kmeans, method = "gap_stat")

resnumclust<-NbClust(df, distance = "euclidean", min.nc=2, max.nc=10, method = "kmeans", index = "alllong")
fviz_nbclust(resnumclust)

#calculamos los dos clústers
k2 <- kmeans(df, centers = 2, nstart = 25)
k2
str(k2)

# Graficamos los cluster
fviz_cluster(k2, data = df)
fviz_cluster(k2, data = df, ellipse.type = "euclid",repel = TRUE,star.plot = TRUE) #ellipse.type= "t", "norm", "euclid"
fviz_cluster(k2, data = df, ellipse.type = "norm")
fviz_cluster(k2, data = df, ellipse.type = "norm",palette = "Set2", ggtheme = theme_minimal())

res2 <- hcut(df, k = 2, stand = TRUE)
fviz_dend(res2, rect = TRUE, cex = 0.5,
          k_colors = c("red","#2E9FDF"))

res4 <- hcut(df, k = 4, stand = TRUE)
fviz_dend(res4, rect = TRUE, cex = 0.5,
          k_colors = c("red","#2E9FDF","green","black"))

# Pasaremos los cluster a mi df inicial para trabajar con ellos

USArrests %>%
  mutate(Cluster = k2$cluster) %>%
  group_by(Cluster) %>%
  summarise_all("mean")

df <- USArrests
df
df$clus<-as.factor(k2$cluster)
df

df <- USArrests
df <- scale(df)
df<- as.data.frame(df)
df$clus<-as.factor(k2$cluster)
df

df$clus<-factor(df$clus)
data_long <- gather(df, caracteristica, valor, Murder:Rape, factor_key=TRUE)
data_long

# 

ggplot(data_long, aes(as.factor(x = caracteristica), y = valor,group=clus, colour = clus)) + 
  stat_summary(fun = mean, geom="pointrange", size = 1)+
  stat_summary(geom="line")
#geom_point(aes(shape=clus))
