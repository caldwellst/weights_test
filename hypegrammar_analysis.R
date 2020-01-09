library(readr)
library(hypegrammaR)

df <- read_csv("input/test.csv")
sf <- read_csv("input/sf.csv")
dap <- read_csv("input/dap.csv")

weight_function <- hypegrammaR::map_to_weighting(sf,
                                                 data.stratum.column = "strata",
                                                 sampling.frame.population.column = "population",
                                                 sampling.frame.stratum.column = "strata")

analysis <- from_analysisplan_map_to_output(df, dap, weighting = weight_function)

hypegrammaR::map_to_master_table(analysis$results, "output/hypegrammar_results.csv")
