#### ---------------------------------------------------------------------------
#### TEMA Introduccion al procesamiento de datos univariantes y multivariantes
#### EXPLORACION, DESCRIPCION Y DESCOMPOSICION DE DATOS UNIVARIANTES

#### REALIZADO POR: Alessandra Amicarella Girardi, V-26.209.731

#### ---------------------------------------------------------------------------
#### ---------------------------------------------------------------------------

####                  CARGA DE PAQUETES
 
library(readr)
library(gapminder)
library(ggplot2)
library(forecast)
library(dplyr)
library(colortools)

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

# Vamos a corregir el formato de la fecha para poder usarlo
#data$month_date <- as.Date(data$dteday, format = "%Y-%m-%u")
#head(data$month_date)
#class(data$month_date)

data$good_date <- as.Date(data$dteday, format = "%Y-%m-%d")
head(data$good_date)
class(data$good_date)

### ----------------------------------------------------------------------------
### DESCOMPOSICIÓN DEL ARCHIVO DE DATOS EN SERIES DE TIEMPO UNIVARIANTES ---
### ----------------------------------------------------------------------------

# Creamos la serie de tiempo
data_ts <- ts(data$Occupancy, start=1, end=646, frequency=24)
data_ts
# Validamos el objeto de la serie de tiempo
is.ts(data_ts)
plot(data_ts)

# descomposiscion? 
descompose_data_ts <- decompose(data_ts, type = c("additive", "multiplicative"), filter = NULL)
plot(descompose_data_ts)
