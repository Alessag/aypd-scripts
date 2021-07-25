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

# Lectura de datos: Archivo day.csv
# La primera fila contiene los nombres de las columnas
# Los datos estan separados por columnas
# La primera columna identifica el indice de los registros
# El archivo contiene 17389 filas
# Las variables contienen informacion sobre el alquiler de bicicletas
# instant: índice de registros
# dteday : fecha
# season : estación (1:invierno, 2:primavera, 3:verano, 4:otoño)
# yr : año (0: 2011, 1:2012)
# mnth : mes ( 1 a 12)
# hr : hora (0 a 23)
# holiday : si el día es festivo o no (extraído de [Web Link])
# weekday : día de la semana
# workingday : si el día no es ni fin de semana ni festivo es 1, en caso contrario es 0.
# weathersit :
#   1: Despejado, Pocas nubes, Parcialmente nublado, Parcialmente nublado
#   2: Niebla + Nublado, Niebla + Nubes dispersas, Niebla + Pocas nubes, Niebla
#   3: Nieve ligera, Lluvia ligera + Tormenta + Nubes dispersas, Lluvia ligera + Nubes dispersas
#   4: Lluvia intensa + Paletas de hielo + Tormenta eléctrica + Nieve, Nieve + Niebla
# temp : Temperatura normalizada en Celsius. Los valores se obtienen mediante (t-t_min)/(t_max-t_min), t_min=-8, t_max=+39 (sólo en escala horaria)
# atemp: Temperatura de sensación normalizada en Celsius. Los valores se obtienen mediante (t-t_min)/(t_max-t_min), t_min=-16, t_max=+50 (sólo en escala horaria)
# hum: Humedad normalizada. Los valores se dividen entre 100 (máximo)
# windspeed: Velocidad del viento normalizada. Los valores se dividen entre 67 (máx.)
# casual: recuento de usuarios ocasionales
# registered: recuento de usuarios registrados
# cnt: recuento del total de bicicletas de alquiler, incluyendo las casuales y las registradas


# Buscamos la ruta del archivo y la guardamos en una variable
ruta_csv <- file.choose()

# Importar datos, los leemos y los guardamos en una variable llamada data
data <- read.csv(ruta_csv)

# Miramos los datos 
head(data)

# Vamos a corregir el formato de la fecha para poder usarlo
data$good_date <- as.Date(data$dteday, format = "%Y-%m-%d")
head(data$good_date)
class(data$good_date)

### ----------------------------------------------------------------------------
### DESCOMPOSICIÓN DEL ARCHIVO DE DATOS EN SERIES DE TIEMPO UNIVARIANTES ---
### ----------------------------------------------------------------------------

# Visualizacion de los datos de la serie de tiempo
(time_plot <- ggplot(data, aes(x = good_date, y = registered)) +
   geom_line() +
   geom_smooth(formula = y ~ x, method = "loess", se = FALSE, span = 0.6) +
   theme_classic())

# Creamos el objeto de serie de tiempo y lo visualizamos
data_ts <- ts(data$registered, start=2011, end=2013, frequency=12)
data_ts

# Descomponemos la serie haciendo uso de la funcion stl()
data_stl <- stl(data_ts, s.window = "period")

# Generamos las graficas
plot(data_stl)  # top=original data, second=estimated seasonal, third=estimated smooth trend, bottom=estimated irregular element i.e. unaccounted for variation
monthplot(data_stl)  # variation in milk production for each month
#seasonplot(data_stl)




