#### ---------------------------------------------------------------------------
#### TEMA 1. Introducción al procesamiento de datos
#### EXPLORACION Y DESCRIPCION DE DATOS CUANTITATIVOS

#### REALIZADO POR: Alessandra Amicarella Girardi, V-26.209.731

#### ---------------------------------------------------------------------------
#### ---------------------------------------------------------------------------

####                  CARGA DE PAQUETES
 
library(readr)
library(gapminder)

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
dataBalloons <- read.csv(ruta_csv,
                        col.names = c('color',
                                      'size',
                                      'act',
                                      'age',
                                      'inflated'))

# Miramos los datos 
head(dataBalloons)

#Generamos la tabla agrupada para la variable: Inflados
table(dataBalloons$inflated)

#Graficamos en un diagrama de barras basicas 
barplot(table(dataBalloons$inflated))

# Lo que podemos observar en el grafico es que hay 
# mayor cantidad de globos desinflados que inflados

