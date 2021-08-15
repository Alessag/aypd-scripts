#### ---------------------------------------------------------------------------
#### TEMA Introduccion al procesamiento de datos univariantes y multivariantes
#### IMPLEMENTAR UN MODELO AUTORREGRESIVO PARA SERIES DE TIEMPO

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
library(tseries)
library(readxl)

#### ---------------------------------------------------------------------------
#### ---------------------------------------------------------------------------
# Lectura de datos. Archivo AirQualityUCI.xlsx
# La primera fila contiene los nombres de las columnas
# Los datos estan separados por columnas
# La primera columna identifica las fechas de los datos
# El archivo contiene 9358 filas
# Las variables contienen informacion sobre la respuestas promediado por hora 
# de un conjunto de 5 sensores químicos de óxido metálico integrados en un 
# dispositivo multisensor químico de calidad del aire. 
# Las variables registradas fueron: 
# Date: Fecha (DD/MM/AAAA)
# Time: Hora (HH.MM.SS)
# CO(GT): Concentración media horaria real de CO en mg/m^3 (analizador de referencia)
# PT08.S1(CO): Respuesta media horaria del sensor PT08.S1 (óxido de estaño) (nominalmente orientado al CO)
# NMHC(GT): Promedio horario real de la concentración global de hidrocarburos no metánicos en microg/m^3 (analizador de referencia)
# C6H6(GT): Concentración de benceno de media horaria real en microg/m^3 (analizador de referencia)
# PT08.S2(NMHC):  Respuesta media horaria del sensor PT08.S2 (titanio) (objetivo nominal de NMHC)
# NOx(GT): Concentración de NOx de media horaria real en ppb (analizador de referencia)
# PT08.S3(NOx): PT08.S3 (óxido de tungsteno) respuesta media horaria del sensor (objetivo nominal de NOx)
# NO2(GT): Concentración de NO2 real media horaria en microg/m^3 (analizador de referencia)
# PT08.S4(NO2):  PT08.S4 (óxido de tungsteno) respuesta media horaria del sensor (objetivo nominal de NO2)
# PT08.S5(O3):  PT08.S5 (óxido de indio) respuesta media horaria del sensor (objetivo nominal de O3)
# T: Temperatura en Â°C
# AH: Humedad relativa (%)
# AH: Humedad absoluta
#### ---------------------------------------------------------------------------
#### ---------------------------------------------------------------------------

# Buscamos la ruta del archivo y la guardamos en una variable
ruta_csv <- file.choose()

# Importar datos, los leemos y los guardamos en una variable llamada data
dataset <- read_excel(ruta_csv)

# Miramos los datos 
head(dataset)
View(dataset)

# Vamos a corregir el formato de la fecha para poder usarlo
dataset$good_date <- as.Date(dataset$Date, format = "%Y-%m-%d")
head(dataset$good_date)
class(dataset$good_date)

### ----------------------------------------------------------------------------
### DESCOMPOSICIÓN DEL ARCHIVO DE DATOS EN SERIES DE TIEMPO UNIVARIANTES ---
### ----------------------------------------------------------------------------

# Visualizacion de los datos de la serie de tiempo
(time_plot <- ggplot(dataset, aes(x = good_date, y = `C6H6(GT)`)) +
   geom_line() +
   geom_smooth(formula = y ~ x, method = "loess", se = FALSE, span = 0.6) +
   theme_classic())


# Creamos el objeto de serie de tiempo y lo visualizamos
data_ts <- ts(dataset$`C6H6(GT)`, start=1, end= 12,  frequency=12)
data_ts
plot(data_ts, main="C6H5", col="blue")

# Descomponemos la serie haciendo uso de la funcion stl()
data_stl <- stl(data_ts, s.window = "period")

# Generamos las graficas de la serie de tiempo descompuesta
plot(data_stl) 
monthplot(data_stl)

# Modelo autoregresivo para predicciones
ajuste <- auto.arima(y = data_ts)
summary(ajuste)

# Graficamos las predicciones
predicciones <- forecast(ajuste)
p_predict <- autoplot(predicciones)
p_predict
# Como podemos observar en la grafica, tenemos una linea de color azul que 
# seria el valor promedio estimado para la concentración de benceno de media 
# horaria real en microg/m^3, aunque el valor real o con mayor probabilidad 
# es el que se encuentra entre los intervalos morados
