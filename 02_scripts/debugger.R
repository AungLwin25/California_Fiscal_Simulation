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

