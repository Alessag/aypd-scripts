# Cargar paquetes 
library(readr)

# Buscar la ruta del archivo y guardarla en una variables
ruta_csv <- file.choose()

# Importar datos con gapminder
data <- read.csv(ruta_csv)

# Mirar datos 
head(data)
