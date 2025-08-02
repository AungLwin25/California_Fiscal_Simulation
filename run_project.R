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

# Print information
print(paste("Simulated data has been saved to:", file_path))
print(head(simulated_data))
