setwd('C:/Users/Pawel/Desktop/WSB Data Analysis with R/datasets/')
list.files()

# install.packages('readxl')
# install.packages('writexl')
library(readxl)
library(writexl)
library(tidyverse)

# Data from Excel files ----
# economic_indicators = read_xlsx('C:/Users/Pawel/Desktop/WSB Data Analysis with R/datasets/Obs1.xlsx')
economic_indicators = read_xlsx('Obs1.xlsx', sheet = 'Sheet1')
metadata = read_xlsx('Metadata1.xlsx')

# Exercise 1: Are the rows in the metadata table unique?
Filter = metadata %>% 
  group_by(ID) %>% 
  nrow()
ifelse(nrow(metadata)==Filter, 'Unique', 'Not Unique')

length(unique(metadata$ID)) == nrow(metadata)

# Exercise 2: Join both tables using a common key.
economic_indicators = left_join(
  x = economic_indicators
  , y = metadata
  , by = c('EconomicIndicatorId' = 'ID')
)

# Exercise 3: Filter money aggregates (M0 - M3).
economic_indicators_filtered = economic_indicators %>%
  filter(str_detect(Description, '.oney .upply')) %>%
  filter(!str_detect(Description, '.urrency'))

unique(economic_indicators_filtered$Description)

# economic_indicators %>% filter(str_detect(Description,".*M[0-3].*"))

# Exercise 4: Create a line chart where each aggregate has a different color.
ggplot(economic_indicators_filtered, aes(x = ObsDate, y = Value)) +
  geom_line(aes(color = Description),linewidth =2,show.legend=TRUE)+
  theme(legend.position = 'top') -> plot1

plotly::ggplotly(plot1)

# Exercise 5: Convert data from long format to wide format.
economic_indicators_filtered_wide = economic_indicators_filtered %>% 
  pivot_wider(
    id_cols = 2,
    names_from = Description,
    values_from = Value
  )

write_xlsx(economic_indicators_filtered_wide, 'Results.xlsx')

# Data from databases ----
# install.packages('RSQLite')
library(RSQLite)
db = dbConnect(SQLite(), dbname = 'SampleDB.db')

dbGetQuery(
  conn = db
  , statement = "select * from sqlite_schema"
)

df_1 = dbGetQuery(
  conn = db
  , statement = "select * from Obs limit 10"
)

dbGetQuery(
  conn = db
  , statement = "select count(*) from Obs"
)

# Exercise 6: Create a data frame with money supply indicators for 2015-2018.
df44 = dbGetQuery(
  conn = db
  , statement ="
    SELECT Obs.*, M.*
    FROM Obs 
    LEFT JOIN Metadane AS M
    ON Obs.EconomicIndicatorId = M.ID
    WHERE M.Description LIKE '%oney%upply%' AND M.Description NOT LIKE '%urrency%'"
)

unique(df44$Description)

# Data from XML, JSON ----
library(XML)
df_xml = xmlToDataFrame('sampleXML.xml')

library(jsonlite)
df_json = fromJSON('sampleJSON.json') %>%
  as.data.frame()
