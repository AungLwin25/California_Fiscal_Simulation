# Debugger
library(dplyr)
library(tidyr)

set.seed(123)

# Define counties and their regions
county_region_map <- tribble(
  ~County, ~RegionCode, ~RegionName,
  "Butte", "Region 1", "Sacramento Valley & Sierra Foothills",
  "Colusa", "Region 1", "Sacramento Valley & Sierra Foothills")

county_region_map -> data

d1 <- expand.grid(
  FiscalYear = years,
  County = county_region_map$County,
  Department = departments,
  FundType = fund_types
) 

d2 <- d1 %>%
  left_join(county_region_map, by = "County") %>%
  rowwise() %>% 
  mutate(Program = sample(programs[[gsub(" ", "", Department)]], 1)) 

write.csv(performance, file = here("01_raw_data", "California_Performance.csv"), row.names = FALSE)

output_list$Geog

library(purrr)

empty_list <- map(output_list, ~ .x)  # Copies each element

# example
new_data <- list(Next1 = next1, Next2 = next2)

# Merge into existing list
simul_series_backup <- c(simul_series_backup, new_data)
simul_series_backup_meta <- list(
  datasets = simul_series_backup,
  created_on = Sys.time(),
  source_files = c("file1.csv", "file2.csv")
)

# Tasks: how can two scripts' same variable be defined



