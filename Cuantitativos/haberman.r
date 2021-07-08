# Load packages
library(readr)
library(gapminder)


# Buscar la ruta del archivo y guardarla en una variables
ruta_csv <- file.choose()

# Importar datos con gapminder y le asignamos un titulo a cada columna
dataHabermarn <- read.csv(ruta_csv,
                        col.names = c('age_at_time_operation',
                                      'age_of_operation',
                                      'positive_axiliary_nodes',
                                      'survival_status')
                        )

# DESCRIPCIÓN Y EXPORACIÓN DE LOS DATOS
# VARIABLES: 
# Age of patient at time of operation (numerical)
# Patient's year of operation (year - 1900, numerical)
# Number of positive axillary nodes detected (numerical)
# Survival status (class attribute)
# -- 1 = the patient survived 5 years or longer
# -- 2 = the patient died within 5 year

# Mirar datos 
# head(dataHabermarn)

#Generando la tabla agrupada
hist(dataHabermarn$age_at_time_operation,
      col = blues9,
     main = "Histogram",
     xlab = "Age of the patient at the time of operation"
     )

# Podemos observar en el histograma que la edad de los 
# pacientes al momento de la operacion es entre los 50-55 años de edad

