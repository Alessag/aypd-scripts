# Cargar paquetes 
library(readr)
library(gapminder)


# Buscar la ruta del archivo y guardarla en una variables
ruta_csv <- file.choose()

# Importar datos con gapminder y le asignamos un titulo a cada columna
dataBalloons <- read.csv(ruta_csv,
                        col.names = c('color',
                                      'size',
                                      'act',
                                      'age',
                                      'inflated'))

# DESCRIPCIÓN Y EXPORACIÓN DE LOS DATOS
# VARIABLES: 
# Color: yellow, purple
# Size: large, small
# Act: stretch, dip
# Age: adult, child
# Inflated: T, F

# Mirar datos 
head(dataBalloons)

#Generando la tabla agrupada
table(dataBalloons$inflated)

#Graficamos en un diagrama de barras basicas 
barplot(table(dataBalloons$inflated))

# Lo que podemos observar en el grafico es que hay 
# mayor cantidad de globos desinflados que inflados

