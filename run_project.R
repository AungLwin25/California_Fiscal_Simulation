# run_project.R

# Main function for raw data saving
# A function to save a data frame to a CSV and return it.
Raw_data_simul <- function(data_to_save, file_path) {
  message("Simulating raw data file...")
  write.csv(data_to_save, file = file_path, row.names = FALSE)
  return(data_to_save)
}

# Get simulated data as data frame
simulated_data <- Raw_data_simul(data_to_save = df, file_path = file_path)
demographics_data <- Raw_data_simul (demographics, demographics_path)
performance_data <- Raw_data_simul (performance, performance_path)
geograrphy_data <- Raw_data_simul (geography, geography_path)

# Print information
print(paste("Simulated data has been saved to:", file_path))
print(head(simulated_data))

print(paste("Simulated data has been saved to:", performance_path))
print(paste("Simulated data has been saved to:", geography_path))

print(paste("Simulated data has been saved to:", demographics_path))
print(head(demographics_data))

# Store datasets into lists
#. Create output list with list names
output_list <- list(
  Data = simulated_data,
  Demo = demographics_data,
  Perf = performance_data,
  Geog = geograrphy_data
)

#. Create a list of empty data frames with same names
simul_series <- lapply(output_list, function(x) data.frame())

#. Copy data from output_list to empty_list
for (name in names(output_list)) {
  simul_series[[name]] <- output_list[[name]]
}

simul_series_with_meta <- list(
  datasets = simul_series,
  created_on = Sys.time(),
  source_files = c(raw_csv_name,
                   demographics_name,
                   performance_name,
                   geography_name))

print(simul_series_with_meta)








