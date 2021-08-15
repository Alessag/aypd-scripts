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

# Estimamos el numero de clusters
fviz_nbclust(dataHabermarn, kmeans, method = "silhouette")

# Como podemos observar en la grafica del numero optimo de clusters, Rstudio nos
# esta sugiriendo que debemos crear dos clusters

# resnumclust<-NbClust(dataHabermarn, distance = "euclidean", min.nc=2, max.nc=10, method = "kmeans", index = "alllong")
# fviz_nbclust(resnumclust)

# Calculamos los dos clousters
k2 <- kmeans(dataHabermarn, centers = 2, nstart = 25)
k2
str(k2)

# Graficamos los dos cluster con el tipo de elipse eclida y tambien le decimos 
# y que nos marque la distancia respecto a los centroides y marque el centroide 
fviz_cluster(k2, data = dataHabermarn, ellipse.type = "euclid",repel = TRUE,star.plot = TRUE) #ellipse.type= "t", "norm", "euclid"


# Pasaremos los cluster a mi dataHabermarn original para trabajar con ellos
as.data.frame(dataHabermarn) %>%
  mutate( Cluster = k2$cluster) %>%
  group_by(Cluster) %>%
  summarise_all("mean")

# Volvemos a llamar al dataset original y le decimos ponga el cluster como un factor dentro 
# del dataframe data_haberman y por ultimo graficamos 
data_haberman <- dataHabermarn
data_haberman
data_haberman$clus<-as.factor(k2$cluster)
data_haberman

data_haberman <- dataHabermarn
data_haberman <- scale(dataHabermarn)
data_haberman<- as.data.frame(dataHabermarn)
data_haberman$clus<-as.factor(k2$cluster)
data_haberman

data_haberman$clus<-factor(data_haberman$clus)
data_long <- gather(data_haberman, caracteristica, valor, age_of_operation:survival_status, factor_key=TRUE)
data_long

ggplot(data_long, aes(as.factor(x = caracteristica), y = valor,group=clus, colour = clus)) + 
  stat_summary(fun = mean, geom="pointrange", size = 1)+
  stat_summary(geom="line")
