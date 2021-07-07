library("dplyr")
library("gapminder")

head(gapminder)
# Guardamos una busqueda filtrada por anio 2007 en una variable llamada gap_07
gap_07 <-filter(gapminder, year== 2007)

# Con este %in% podemos filtrar las busquedas para que contengan lo que esta en parentesis que vendria siendo que tenga como pais a Francia y Turkey
gap_fr_tk <- filter(gapminder, country %in% c("France", "Turkey"))



# 2. DESCRIPCIÓN Y EXPORACIÓN DE LOS DATOS

#-------------------------------------------------------------------------------
# ------------------------------------------------------------------------------
# ------------------------------------------------------------------------------
# VARIABLES: 
# Name of the class: 3(L,B,R) Left, Balanced, Right
# Left Weight: 5(1,2,3,4,5)
# Left Distance: 5(1,2,3,4,5)
# Right Weight: 5(1,2,3,4,5)
# Right Distance: 5(1,2,3,4,5)
