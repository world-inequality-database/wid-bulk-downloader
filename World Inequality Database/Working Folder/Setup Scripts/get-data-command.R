#-------------------------------------------------------# 
# Topic: Accessing WID Data Using WID R command.        # 
# Prepared by: Stella Muti, Ana Van Der Ree             #
#	First Created: February 18, 2024                      #
# Last Updated:  April 2026                             #
#-------------------------------------------------------#

# ==== SECTION 0: LOAD WID PACKAGE  ============================================

# download or load WID command # 
if (!requireNamespace("wid", quietly = TRUE)) {
  if (!requireNamespace("pak", quietly = TRUE)) {
    install.packages("pak")
  }
  pak::pak("world-inequality-database/wid-r-tool")
}

library(wid)
# ==== SECTION 1: DEFINE AVAILABLE SERIES  =====================================

source(file.path(setup_scripts,"country_code_vectors.R")) # all available series per country in WID

countries <- gsub("-","_",countries) # fix code if needed 
all_codes <- unique(unlist(lapply(countries, function(ctry) get(ctry)))) # get code list
countries <- gsub("_","-",countries) # fix back the country code 

# ==== SECTION 2: IMPORT AND EXPORT DATA  ======================================

message("WID data download and cleaning started. It might take a while for large datasets. Please wait.")

# prefixes to build WID codes
macro_prefix <- c("a","m")
distr_prefix <- c("a", "b", "c", "o", "m", "s", "t") 
carbon_prefix <- c("e", "k", "l")

# Import indexes - always
indexes <- download_wid(indicators=index_mer, 
                           areas=countries,
                           perc="p0p100",
                           ages="999", 
                           pop="i")
indexes<-reshape(indexes, idvar = c("country","year","percentile"), timevar= "variable", direction="wide")
# clean
colnames(indexes) <- sub("^value.", "", colnames(indexes))
indexes <- indexes[,-2] 


##### Indexes and Exchange Rates #####
if(price_indexes==T & all_data==F){
  dir.create(dirname(file.path(path,"Indexes.csv")), recursive = TRUE, showWarnings = FALSE)
  write.csv(indexes, file.path(path,"Indexes.csv"))
}


##### Income Macro Series #####

if (macro_income) {
  codes <- as.vector(outer(macro_prefix, income_macro, paste0))
  codes <- codes[codes %in% all_codes]
  
  if (length(codes) == 0) {
    rm(list = ls())
    message("Sorry. No available data for the series and country group selected.")
    stop()
  }
  wid_data_income_macro <- download_wid(indicators = codes, areas = countries)
  # merge with index data-set
  wid_data_income_macro <- merge(wid_data_income_macro, indexes, by = c("country", "year"))
  # save
  dir.create(dirname(file.path(path, "Income-Macro-Series.csv")), recursive = TRUE, showWarnings = FALSE)
  write.csv(wid_data_income_macro, file.path(path, "Income-Macro-Series.csv"), row.names = FALSE)
}


##### Income Distribution DINA Series #####

if (DINA_income) {
  codes <- as.vector(outer(distr_prefix, income_distr, paste0))
  codes <- codes[codes %in% all_codes]
  
  if (length(codes) == 0) {
    rm(list = ls())
    message("Sorry. No available data for the series and country group selected.")
    stop()
  }
  # download
  # when all percentiles are selected, this series is very heavy so downloading in chunks and then appending.  
  if (length(percentiles) == 1 && (percentiles == "all")) 
    {
    code_groups <- split(codes, ceiling(seq_along(codes) / 6))
    wid_data_income_DINA_list <- list()
    for (i in seq_along(code_groups)) {
      message("Downloading Income DINA part ", i, " of ", length(code_groups), " ...")
      tmp <- download_wid(indicators = code_groups[[i]], areas = countries)
      wid_data_income_DINA_list[[i]] <- tmp
    }
    wid_data_income_DINA <- do.call(rbind, wid_data_income_DINA_list)
    
  } else {
    wid_data_income_DINA <- download_wid(indicators = codes, areas = countries, perc = percentiles)
  }
  
  # merge exchange
  wid_data_income_DINA <- merge(wid_data_income_DINA, indexes, by = c("country", "year"))
  shares_rows <- grepl("^s", wid_data_income_DINA$variable, ignore.case = TRUE)
  wid_data_income_DINA[shares_rows, 6:ncol(wid_data_income_DINA)] <- NA
  
  # save
  dir.create(dirname(file.path(path, "Income-Distribution-Series.csv")), recursive = TRUE, showWarnings = FALSE)
  write.csv(wid_data_income_DINA, file.path(path, "Income-Distribution-Series.csv"), row.names = FALSE)
}


##### Wealth Macro Series #####

if (macro_wealth) {
  codes <- as.vector(outer(macro_prefix, wealth_macro, paste0))
  codes <- codes[codes %in% all_codes]
  
  if (length(codes) == 0) {
    rm(list = ls())
    message("Sorry. No available data for the series and country group selected.")
    stop()
  }
  
  # download
  wid_data_wealth_macro <- download_wid(indicators = codes, areas = countries)
  
  # merge with index data-set
  wid_data_wealth_macro <- merge(wid_data_wealth_macro, indexes, by = c("country", "year"))
  
  # save
  dir.create(dirname(file.path(path, "Wealth-Macro-Series.csv")), recursive = TRUE, showWarnings = FALSE)
  write.csv(wid_data_wealth_macro, file.path(path, "Wealth-Macro-Series.csv"), row.names = FALSE)
}


##### Wealth Distribution DINA Series #####

if (DINA_wealth) {
  codes <- as.vector(outer(distr_prefix, dibn_wealth, paste0))
  codes <- codes[codes %in% all_codes]
  
  if (length(codes) == 0) {
    rm(list = ls())
    message("Sorry. No available data for the series and country group selected.")
    stop()
  }
  
  # download
  wid_data_wealth_DINA <- download_wid(indicators = codes, areas = countries, perc = percentiles)
  
  wid_data_wealth_DINA <- merge(wid_data_wealth_DINA, indexes, by = c("country", "year"))
  shares_rows <- grepl("^s", wid_data_wealth_DINA$variable, ignore.case = TRUE)
  wid_data_wealth_DINA[shares_rows, 6:ncol(wid_data_wealth_DINA)] <- NA
  
  # save
  dir.create(dirname(file.path(path, "Wealth-Distribution-Series.csv")), recursive = TRUE, showWarnings = FALSE)
  write.csv(wid_data_wealth_DINA, file.path(path, "Wealth-Distribution-Series.csv"), row.names = FALSE)
}


##### Carbon Distribution and Macro Series #####

if (carbon_series) {
  codes <- as.vector(outer(carbon_prefix, carbon, paste0))
  codes <- codes[codes %in% all_codes]
  
  if (length(codes) == 0) {
    rm(list = ls())
    message("Sorry. No available data for the series and country group selected.")
    stop()
  }
  
  # download
    wid_data_carbon <- download_wid(indicators = codes, areas = countries, perc = percentiles)
  
  # save
  dir.create(dirname(file.path(path, "Carbon-Distribution-Macro-Series.csv")), recursive = TRUE, showWarnings = FALSE)
  write.csv(wid_data_carbon, file.path(path, "Carbon-Distribution-Macro-Series.csv"), row.names = FALSE)
}


##### Population Series #####

if (population_series) {
  codes <- paste0("n", population)
  codes <- codes[codes %in% all_codes]
  
  if (length(codes) == 0) {
    rm(list = ls())
    message("Sorry. No available data for the series and country group selected.")
    stop()
  }
  
  # download
  wid_data_pop <- download_wid(indicators = codes, areas = countries)
  
  # save
  dir.create(dirname(file.path(path, "Population-Series.csv")), recursive = TRUE, showWarnings = FALSE)
  write.csv(wid_data_pop, file.path(path, "Population-Series.csv"), row.names = FALSE)
}


##### Wealth Income Ratio #####

if (ratios_and_shares) {
  codes <- ratios

  if (length(codes) == 0) {
    rm(list = ls())
    message("Sorry. No available data for the series and country group selected.")
    stop()
  }
  
  # download
  wid_data_ratio <- download_wid(indicators = codes, areas = countries)
  
  # save
  dir.create(dirname(file.path(path, "wealth-to-income-ratios-series.csv")), recursive = TRUE, showWarnings = FALSE)
  write.csv(wid_data_ratio, file.path(path, "wealth-to-income-ratios-series.csv"), row.names = FALSE)
}


##### FULL WID Series #####

if (all_data) {
  
  non_monetary <- rbind(wid_data_carbon, wid_data_pop, wid_data_ratio)
  indexes[, 3:9] <- NA
  non_monetary <- merge(non_monetary, indexes, by = c("country", "year"))
  
  full_wid <- rbind(
    wid_data_income_macro,
    wid_data_income_DINA,
    wid_data_wealth_macro,
    wid_data_wealth_DINA,
    non_monetary
  )
  
  # save
  dir.create(dirname(file.path(path, "Full-WID-Series.csv")), recursive = TRUE, showWarnings = FALSE)
  write.csv(full_wid, file.path(path, "Full-WID-Series.csv"), row.names = FALSE)
}


# --------------------------- END OF SCRIPT ------------------------------------

