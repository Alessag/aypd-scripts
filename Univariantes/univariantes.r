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

# Procesamiento de datos faltantes
# Hacemos una copia de la data original 
dataCaesarian2 <- dataCaesarian

# Vamos a reemplazar los valores perdidos de la columna age con la mediana
dataCaesarian2$age_new <- ifelse(is.na(dataCaesarian2$age), 
                                             median(dataCaesarian2$age, na.rm = TRUE),
                                             dataCaesarian2$age
)

# Miramos los datos 
head(dataCaesarian2)

# Podemos observar que hemos creado una nueva columna llamada 
# age_new y en esta los valores NA de la columna original han sido reemplazados
# por la media para cada uno de ellos


# Imputacion de datos

# Vamos a graficar la columna de numero de parto en un histograma
# para saber como estan distribuidos los valores
hist(dataCaesarian$delivery_number)

# Luego vamos a hacer un grafico de caja y bigotes para ver los outliers
boxplot(dataCaesarian$delivery_number, horizontal = TRUE)

# Obtenemos la lista de valores outliers
boxplot.stats(dataCaesarian$delivery_number)

# Revisando los resultados obtenidos podemos ver que el primer resultado 
# devuelto por la funcion($stats) nos esta diciendo que el bigote inferior
# el limitie inferior de la caja y la mediana del conjunto de 
# valores se encuentran en 1, la parte superior de la caja se encuentra en 2
# $n nos dice la cantidad de datos que hay, $conf nos muestra los intervalos de 
# confiaza a un 95% y $out nos muestra los valores de los outliers que se pueden ver en el grafico

# Prueba de homogeniedad de varianza 
# bartlett.test(dataCaesarian.age,data=dataCaesarian)



