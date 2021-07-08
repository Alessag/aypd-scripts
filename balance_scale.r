# Cargar paquetes 
library(readr)
library(gapminder)


# Buscar la ruta del archivo y guardarla en una variables
ruta_csv <- file.choose()

# Importar datos con gapminder y le asignamos un titulo a cada columna
dataBalance <- read.csv(ruta_csv,
                        col.names = c('color',
                                      'size',
                                      'act',
                                      'age',
                                      'inflated'))

# DESCRIPCIÓN Y EXPORACIÓN DE LOS DATOS
# VARIABLES: 
# Color: 
# Size 
# Act 
# Age 
# Inflated

# Mirar datos 
head(dataBalance)

#Generando la tabla agrupada
table(dataBalance$color)

#Graficar de barras basicas
barplot(table(dataBalance$size))

