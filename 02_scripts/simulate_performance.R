# simulate_performance.R

performance <- expand.grid(
  County = unique(user_inputs$County),
  Year = unique(user_inputs$FiscalYear),
  Department = unique(user_inputs$Department)
)
performance$Performance_Score <- round(runif(nrow(performance), 60, 100), 1)

