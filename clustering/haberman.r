#### ---------------------------------------------------------------------------
#### TEMA 1. Introducción al procesamiento de datos
#### EXPLORACION Y DESCRIPCION DE DATOS CUANTITATIVOS

#### REALIZADO POR: Alessandra Amicarella Girardi, V-26.209.731

#### ---------------------------------------------------------------------------
#### ---------------------------------------------------------------------------

####                  CARGA DE PAQUETES

library(readr)

#### ---------------------------------------------------------------------------
#### ---------------------------------------------------------------------------

# Lectura de datos: Archivo haberman.data
# La primera fila no contiene los nombres de las columnas
# Los datos estan separados por ,
# La primera columna identifica a las filas
# El archivo contiene 306 filas
# Las variables contienen informacion la supervivencia de pacientes con cancer 
# de mama que han sido operadas ente los anos 1958 y 1970
# Las variables registradas fueron: 
# Edad de la paciente al momento de la operacion (numerica)
# Año de la operacion de la paciente (año - 1900, numerica)
# Número de ganglios axilares positivos detectados (numerica)
# Status de supervivencia (Atributo de clase)
# -- 1 = La paciente sobrevivió 5 años o más
# -- 2 = La paciente falleció en un plazo de 5 años

# Buscar la ruta del archivo y la guardarmos en una variable
ruta_csv <- file.choose()

# Importamos y leemos los datos, le asignamos un titulo a cada columna
# y los guardamos en una variable llamada dataHabermarn
dataHabermarn <- read.csv(ruta_csv,
                        col.names = c('age_at_time_operation',
                                      'age_of_operation',
                                      'positive_axiliary_nodes',
                                      'survival_status')
                        )

#Generamos el histograma para la variable: Edad al momento de la operacion
hist(dataHabermarn$age_at_time_operation,
      col = blues9,
     main = "Histogram",
     xlab = "Age of the patient at the time of operation"
     )

# Podemos observar en el histograma que la edad de las pacientes 
# al momento de la operacion es entre los 50-55 años de edad

