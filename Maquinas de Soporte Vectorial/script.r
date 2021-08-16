#### ---------------------------------------------------------------------------
#### TEMA 3. Introducción al aprendizaje automático
#### EXPLORACION Y DESCRIPCION DE DATOS CUANTITATIVOS

#### REALIZADO POR: Alessandra Amicarella Girardi, V-26.209.731

#### ---------------------------------------------------------------------------
#### ---------------------------------------------------------------------------

####                  CARGA DE PAQUETES
 
library(readr)
library(gapminder)
library(e1071)
library(ggplot2)

#### ---------------------------------------------------------------------------
#### ---------------------------------------------------------------------------

# Lectura de datos: Archivo adult+stretch.data
# La primera fila no contiene los nombres de las columnas
# Los datos estan separados por ,
# La primera columna identifica a las filas
# El archivo contiene 20 filas
# Las variables contienen informacion de globos estirados
# Las variables registradas fueron: 
# Color: Amaraillo, purpura
# Size: Grande, pequeño
# Act: Estirar, sumergir
# Age: Adulto, niño
# Inflated: Verdadero, falso


# Buscamos la ruta del archivo y la guardamos en una variable
ruta_csv <- file.choose()

# Importar datos, los leemos, le asignamos un titulo a cada columna y los guardamos
# en una variable llamada dataBalloons

# sepal length in cm
#2. sepal width in cm
#3. petal length in cm
#4. petal width in cm
#5. class:
#  -- Iris Setosa
#-- Iris Versicolour
#-- Iris Virginica

iris_data <- read.csv(ruta_csv,
                        col.names = c('sepal_length',
                                      'sepal_width',
                                      'petal_length',
                                      'petal_width',
                                      'species'))

# Miramos los datos 
head(iris_data)
# plot(iris_data)
# iris_data
# str(iris_data)
qplot(petal_length, petal_width, data=iris_data, color=species)
# este es de tipo character
class(iris_data$species)

# lo pasamos a tipo factor
iris_data$species <- as.factor(iris_data$species)
class(iris_data$species)

# SVM 
svm_model <- svm(species ~ . , data=iris_data)


# Lo que queremos clasificar va a ir en la "y" po rejemplo la calidad del vino 
# En "x" van las caracteristicas que nos van a permitir hacer esa clasificacion 

