#### ---------------------------------------------------------------------------
#### TEMA Introduccion al procesamiento de datos univariantes y multivariantes
#### EXPLORACION, DESCRIPCION Y DESCOMPOSICION DE DATOS UNIVARIANTES

#### REALIZADO POR: Alessandra Amicarella Girardi, V-26.209.731

#### ---------------------------------------------------------------------------
#### ---------------------------------------------------------------------------

####                  CARGA DE PAQUETES
 
library(readr)
library(gapminder)

#### ---------------------------------------------------------------------------
#### ---------------------------------------------------------------------------

# Lectura de datos: Archivo dataset.csv
# La primera fila contiene los nombres de las columnas
# Los datos estan separados por columnas
# La primera columna identifica a la variable SystemCodeNumber
# El archivo contiene 35717 filas
# Las variables contienen informacion sobre la tasa de ocupacion de los aparcamientos
# de Birmingham entre las 8:00 a las 16:30 del 2016/10/04 al 2016/12/19
# Las variables registradas fueron: 
# Numero de codigo del sistema: ID del aparcamiento 
# Capacidad: Capacidad del aparcamiento
# Ocupacion: Grado de ocupacion del aparacamiento


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

