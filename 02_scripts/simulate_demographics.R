# simulate_demographics.R
set.seed(123)
demographics <- expand.grid(
  County = unique(user_inputs$County),
  Year = unique(user_inputs$FiscalYear)
)
demographics$Population <- round(runif(nrow(demographics), 50000, 1000000))
demographics$Median_Income <- round(runif(nrow(demographics), 40000, 120000))

