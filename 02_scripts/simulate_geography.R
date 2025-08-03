# simulate_geography.R

geography <- data.frame(
  County = unique(user_inputs$County),
  Region = sample(c("North", "Central", "South"), length(unique(user_inputs$County)), replace = TRUE),
  Urban_Rural = sample(c("Urban", "Rural"), length(unique(user_inputs$County)), replace = TRUE)
)


