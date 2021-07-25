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

# Importar datos, los leemos y los guardamos
# en una variable llamada data
data <- read.csv(ruta_csv)

# Miramos los datos 
head(data)

### ----------------------------------------------------------------------------
### DESCOMPOSICIÓN DEL ARCHIVO DE DATOS EN SERIES DE TIEMPO UNIVARIANTES ---
### ----------------------------------------------------------------------------

frecuencia <- 12;
comienzo <- 2016;
fin <- 2016;
# Creamos la serie de tiempo
ocupancy_ts <- ts(data$Occupancy, start=1, end=646, frequency=24)
ocupancy_ts
# Validamos el objeto de la serie de tiempo
is.ts(ocupancy_ts)
plot(ocupancy_ts)

# descomposiscion? 
descompose_occupancy_ts <- decompose(ocupancy_ts, type = c("additive", "multiplicative"), filter = NULL)
plot(descompose_occupancy_ts)
