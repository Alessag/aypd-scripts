#### ---------------------------------------------------------------------------
#### TEMA 1. Introducción al procesamiento de datos
#### EXPLORACION Y DESCRIPCION DE DATOS UNIVARIANTES

#### REALIZADO POR: Alessandra Amicarella Girardi, V-26.209.731

#### ---------------------------------------------------------------------------
#### ---------------------------------------------------------------------------

####                  CARGA DE PAQUETES
 
library(readr)
library(gapminder)

#### ---------------------------------------------------------------------------
#### ---------------------------------------------------------------------------

# Lectura de datos: Archivo caesarian.csv.arff
# La primera fila no contiene los nombres de las columnas
# Los datos estan separados por ,
# La primera columna identifica a las filas
# El archivo contiene 80 filas
# Las variables contienen informacion de sobre el parto de un bebe
# Las variables registradas fueron: 
# Edad:{ 22,26,28,27,32,36,33,23,20,29,25,37,24,18,30,40,31,19,21,35,17,38 }
# Numero de parto: { 1,2,3,4 }
# Hora de parto: { 0,1,2 } -> {0 = oportuna , 1 = prematura , 2 = tardia}
# Presion arterial: { 2,1,0 } -> {0 = bajo , 1 = normal , 2 = alto }
# Estado del corazon: { 1,0 } -> {0 = apto, 1 = inepto }
# Cesárea: { 0,1 } -> {0 = No, 1 = Si }


# Buscamos la ruta del archivo y la guardamos en una variable
ruta_csv <- file.choose()

# Importar datos, los leemos, le asignamos un titulo a cada columna y los guardamos
# en una variable llamada dataCaesarian
dataCaesarian <- read.csv(ruta_csv,
                        col.names = c('age',
                                      'delivery_number',
                                      'delivery_time',
                                      'blood_preassure',
                                      'heart_problem',
                                      'caesariam'))

# Miramos los datos 
head(dataCaesarian)

#Generamos la tabla agrupada para la variable: Inflados
table(dataCaesarian$inflated)

#Graficamos en un diagrama de barras basicas 
barplot(table(dataCaesarian$inflated))

# Lo que podemos observar en el grafico es que hay 
# mayor cantidad de globos desinflados que inflados

