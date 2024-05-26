# Dane z plików Excelowych ----
setwd("C:/Users/Pawel/Desktop/WSB Analiza danych R")

install.packages('readxl')
library(readxl)
library(tidyverse)
library(writexl)

economic_indicators = read_xlsx('dane/Obs1.xlsx')
metadata = read_xlsx('dane/Metadane1.xlsx')

# Zadanie 1: Czy wiersze w tabeli metadata są unikatowe?
length(unique(metadata$ID)) == nrow(metadata)

# Zadanie 2: Połącz obie tabele po wspólnym kluczu.
economic_indicators = left_join(economic_indicators, metadata, by = c("EconomicIndicatorId" = "ID"))

# Zadanie 3: Wyfiltruj podaż pieniądza (M0 - M3).
zad3 = economic_indicators %>%
  filter(str_detect(Description, '.oney .upply'))

# Zadanie 4: Stwórz wykres liniowy, gdzie każdy agregat ma inny kolor.
zad3 %>%
  ggplot(aes(x = ObsDate, y = Value)) +
  geom_line(aes(color = Description), size = 1) +
  theme(legend.position = c(0.3, 0.7))

# Zadanie 5: Zamień dane z formatu long do formatu wide.


write_xlsx(zad3, 'zadanie3.xlsx')

# Dane z relacyjncych baz danych ----
# install.packages('RSQLite')
library(RSQLite)

baza = dbConnect(SQLite(), dbname = 'dane/SampleDB.db')
dbGetQuery(baza, 'select * from sqlite_schema')

obs = dbGetQuery(baza, 'select * from Obs')

dbGetQuery(baza, 'select count(*) from Obs')

dbGetQuery(baza, 'select * from Obs limit 10')

# dbGetQuery(baza, '
#            select * 
#            from Obs
#            where
#            
#           ')

# Zadanie 6: Stwórz ramkę danych wskaźników podaży pieniądza dla lat 2015-2018.

# Dane z plików XML, JSON ----

library(XML)
testXML <- xmlToDataFrame('sampleXML.xml')

library(jsonlite)
testJSON <- fromJSON('sampleJSON.json') %>% as.data.frame()
















