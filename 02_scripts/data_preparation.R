library(dplyr)
library(tidyr)

set.seed(123)

# Define counties and their regions
county_region_map <- tribble(
  ~County, ~RegionCode, ~RegionName,
  "Butte", "Region 1", "Sacramento Valley & Sierra Foothills",
  "Colusa", "Region 1", "Sacramento Valley & Sierra Foothills",
  "El Dorado", "Region 1", "Sacramento Valley & Sierra Foothills",
  "Glenn", "Region 1", "Sacramento Valley & Sierra Foothills",
  "Lassen", "Region 1", "Sacramento Valley & Sierra Foothills",
  "Modoc", "Region 1", "Sacramento Valley & Sierra Foothills",
  "Nevada", "Region 1", "Sacramento Valley & Sierra Foothills",
  "Placer", "Region 1", "Sacramento Valley & Sierra Foothills",
  "Plumas", "Region 1", "Sacramento Valley & Sierra Foothills",
  "Sacramento", "Region 1", "Sacramento Valley & Sierra Foothills",
  "Shasta", "Region 1", "Sacramento Valley & Sierra Foothills",
  "Sierra", "Region 1", "Sacramento Valley & Sierra Foothills",
  "Siskiyou", "Region 1", "Sacramento Valley & Sierra Foothills",
  "Sutter", "Region 1", "Sacramento Valley & Sierra Foothills",
  "Tehama", "Region 1", "Sacramento Valley & Sierra Foothills",
  "Yolo", "Region 1", "Sacramento Valley & Sierra Foothills",
  "Yuba", "Region 1", "Sacramento Valley & Sierra Foothills",
  "Del Norte", "Region 2", "North Coast",
  "Humboldt", "Region 2", "North Coast",
  "Lake", "Region 2", "North Coast",
  "Mendocino", "Region 2", "North Coast",
  "Napa", "Region 2", "North Coast",
  "Sonoma", "Region 2", "North Coast",
  "Trinity", "Region 2", "North Coast",
  "Alameda", "Region 3", "Bay Area",
  "Contra Costa", "Region 3", "Bay Area",
  "Marin", "Region 3", "Bay Area",
  "San Francisco", "Region 3", "Bay Area",
  "San Mateo", "Region 3", "Bay Area",
  "Santa Clara", "Region 3", "Bay Area",
  "Solano", "Region 3", "Bay Area",
  "Alpine", "Region 4", "Central Valley (North)",
  "Amador", "Region 4", "Central Valley (North)",
  "Calaveras", "Region 4", "Central Valley (North)",
  "Madera", "Region 4", "Central Valley (North)",
  "Mariposa", "Region 4", "Central Valley (North)",
  "Merced", "Region 4", "Central Valley (North)",
  "Mono", "Region 4", "Central Valley (North)",
  "San Joaquin", "Region 4", "Central Valley (North)",
  "Stanislaus", "Region 4", "Central Valley (North)",
  "Tuolumne", "Region 4", "Central Valley (North)",
  "Monterey", "Region 5", "Central Coast",
  "San Benito", "Region 5", "Central Coast",
  "San Luis Obispo", "Region 5", "Central Coast",
  "Santa Barbara", "Region 5", "Central Coast",
  "Santa Cruz", "Region 5", "Central Coast",
  "Ventura", "Region 5", "Central Coast",
  "Fresno", "Region 6", "Central Valley (South)",
  "Inyo", "Region 6", "Central Valley (South)",
  "Kern", "Region 6", "Central Valley (South)",
  "Kings", "Region 6", "Central Valley (South)",
  "Tulare", "Region 6", "Central Valley (South)",
  "Riverside", "Region 7", "Inland Empire",
  "San Bernardino", "Region 7", "Inland Empire",
  "Los Angeles", "Region 8", "Los Angeles",
  "Orange", "Region 9", "Orange County",
  "Imperial", "Region 10", "San Diego & Imperial Counties",
  "San Diego", "Region 10", "San Diego & Imperial Counties"
)

# Define other variables
years <- 2020:2024
departments <- c("Health", "Education", "Housing", "Transportation", "Social Services")
programs <- list(
  Health = c("Mental Health", "Public Health", "Medicaid"),
  Education = c("K-12", "Higher Ed", "Adult Education"),
  Housing = c("Affordable Housing", "Homeless Services"),
  Transportation = c("Roads", "Public Transit"),
  SocialServices = c("Food Assistance", "Child Welfare")
)
fund_types <- c("General Fund", "Federal Fund", "Special Fund")

# test

df <- expand.grid(
  FiscalYear = years,
  County = county_region_map$County,
  Department = departments,
  FundType = fund_types
) 

# Generate full dataset
df <- expand.grid(
  FiscalYear = years,
  County = county_region_map$County,
  Department = departments,
  FundType = fund_types
) %>%
  left_join(county_region_map, by = "County") %>%
  rowwise() %>%
  mutate(
    Program = sample(programs[[gsub(" ", "", Department)]], 1),
    Budget = round(runif(1, 50, 200), 1),
    ActualSpend = round(Budget * runif(1, 0.85, 1.15), 1),
    Beneficiaries = sample(50000:500000, 1)
  ) %>%
  ungroup()

head(df)
