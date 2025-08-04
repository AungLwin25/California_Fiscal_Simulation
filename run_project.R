# run_project.R

# Save Simulated Data to CSV 
Raw_data_simul <- function(data_to_save, file_path) {
  message("Simulating raw data file...")
  write.csv(data_to_save, file = file_path, row.names = FALSE)
  return(data_to_save)
}

# Generate Simulated Datasets 
simulated_data   <- Raw_data_simul(df, file_path)
demographics_data <- Raw_data_simul(demographics, demographics_path)
performance_data  <- Raw_data_simul(performance, performance_path)
geograrphy_data   <- Raw_data_simul(geography, geography_path)

# Display Confirmation and Previews 
print(paste("Simulated data has been saved to:", file_path))
print(head(simulated_data))

print(paste("Simulated data has been saved to:", performance_path))
print(paste("Simulated data has been saved to:", geography_path))

print(paste("Simulated data has been saved to:", demographics_path))
print(head(demographics_data))

# Organize Datasets into Named List 
output_list <- list(
  Data = simulated_data,
  Demo = demographics_data,
  Perf = performance_data,
  Geog = geograrphy_data
)

# Initialize and Populate Dataset Series 
simul_series <- lapply(output_list, function(x) data.frame())
for (name in names(output_list)) {
  simul_series[[name]] <- output_list[[name]]
}

# Create Metadata with Full Datasets 
simul_series_data_meta <- list(
  datasets    = simul_series,
  created_on  = Sys.time(),
  source_files = c(raw_csv_name,
                   demographics_name,
                   performance_name,
                   geography_name)
)

# Assign Datasets to Global Environment 
list2env(simul_series, envir = .GlobalEnv)

# Create Metadata with Dataset Names Only 
simul_series_setnames_meta <- list(
  datasets    = names(simul_series),
  created_on  = Sys.time(),
  source_files = c(raw_csv_name,
                   demographics_name,
                   performance_name,
                   geography_name)
)

print(simul_series_setnames_meta)

# Export Simulated Datasets to Excel Workbook 
library(openxlsx)

message("Exporting datasets to Excel workbook...")
wb <- createWorkbook()
for (sheet_name in names(simul_series)) {
  addWorksheet(wb, excel_sheet_names[[sheet_name]])
  writeData(wb, sheet = excel_sheet_names[[sheet_name]], simul_series[[sheet_name]])
}

saveWorkbook(wb, file = excel_workbook_path, overwrite = TRUE)
message(paste("Master Excel workbook saved to:", excel_workbook_path))







