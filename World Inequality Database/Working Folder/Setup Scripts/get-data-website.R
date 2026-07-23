#-------------------------------------------------------# 
# Accessing WID Data Using WID Website Raw Data.        # 
# Prepared by: Stella Muti, Ana Van Der Ree             #
#	First Created: February 18, 2025                      #
# Last Updated:  April 2026                             #
#-------------------------------------------------------#


options(show.error.messages = FALSE)

# ======== SECTION 1: IMPORT & CLEAN WID DATA =================================

baseurl <- "https://wid.world/bulk_download"
rawdir  <- data_raw

# fix country names if needed
countries <- gsub("_", "-", countries)

wid_data <- NULL

for (country in countries) {
  
  # force uppercase country codes
  country <- toupper(country)
  
  fileurl   <- paste0(baseurl, "/WID_data_", country, ".csv")
  localfile <- file.path(rawdir, paste0("WID_data_", country, ".csv"))
  
  message("Downloading ", country, " from ", fileurl, " ...")
  
  # download and overwrite local copy
  utils::download.file(fileurl, destfile = localfile, mode = "wb", quiet = TRUE)
  
  # import and append
  data <- read.csv(localfile, sep = ";")
  wid_data <- if (is.null(wid_data)) data else rbind(wid_data, data)
}

rm(data)

# ==== SECTION 2: DATA CLEANING ================================================ 

#correct WID code
wid_data$variable <- sub("(.*?)([a-z])([0-9]+)", "\\1\\3\\2", wid_data$variable)
#drop potential duplicates
wid_data <- wid_data[!duplicated(wid_data),] 
#drop redundant columns
wid_data <- subset(wid_data,select=-c(age,pop))

#get data-set for PPP & MER exchange rates and price indexes
indexes<-wid_data[substr(wid_data$variable, 1, 6) %in% index_mer,]
indexes <- subset(indexes, select = -percentile)
indexes<-reshape(indexes, idvar = c("country","year"), timevar= "variable", direction="wide")
colnames(indexes) <- sub("^value.", "", colnames(indexes))


# ==== SECTION 3: EXPORT DATA ==================================================  


##### Indexes and Exchange Rates ####
if(price_indexes==T && all_data== F){
  dir.create(dirname(file.path(path,"Indexes.csv")), recursive = TRUE, showWarnings = FALSE)
  write.csv(indexes, file.path(path,"Indexes.csv"))
}

##### Income Macro Series #####
if (macro_income == TRUE && all_data == FALSE) {
  wid_data_income_macro <- wid_data[substr(wid_data$variable, 2, 6) %in% income_macro, ]
  if (nrow(wid_data_income_macro) == 0) {
    rm(list = ls())
    message("Sorry. No available data for the series and country group selected.")
    stop()
  } else {
    wid_data_income_macro <- merge(wid_data_income_macro, indexes, by = c("country", "year"))
    dir.create(dirname(file.path(path, "Income-Macro-Series.csv")), recursive = TRUE, showWarnings = FALSE)
    write.csv(wid_data_income_macro, file.path(path, "Income-Macro-Series.csv"), row.names = FALSE)
  }
}

##### Income Distribution DINA Series #####
if (DINA_income == TRUE && all_data == FALSE) {
 
   wid_data_income_DINA <- wid_data[substr(wid_data$variable, 2, 6) %in% income_distr, ]
  
   if (length(percentiles) > 0) {
    wid_data_income_DINA <- wid_data_income_DINA[ wid_data_income_DINA$percentile %in% percentiles, ]
  }
  if (nrow(wid_data_income_DINA) == 0) {
    rm(list = ls())
    message("Sorry. No available data for the series and country group selected.")
    stop()
  } else {
    wid_data_income_DINA <- merge(wid_data_income_DINA, indexes, by = c("country", "year"))
    shares_rows <- grepl("^s", wid_data_income_DINA$variable, ignore.case = TRUE)
    wid_data_income_DINA[shares_rows, 6:12] <- NA
    dir.create(dirname(file.path(path, "Income-Distribution-Series.csv")), recursive = TRUE, showWarnings = FALSE)
    write.csv(wid_data_income_DINA, file.path(path, "Income-Distribution-Series.csv"), row.names = FALSE)
  }
}

##### Wealth Macro Series #####
if (macro_wealth == TRUE && all_data == FALSE) {
  wid_data_wealth_macro <- wid_data[substr(wid_data$variable, 2, 6) %in% wealth_macro, ]
  wid_data_wealth_macro <- wid_data_wealth_macro[wid_data_wealth_macro$percentile == "p0p100", ]
  if (nrow(wid_data_wealth_macro) == 0) {
    rm(list = ls())
    message("Sorry. No available data for the series and country group selected.")
    stop()
  } else {
    wid_data_wealth_macro <- merge(wid_data_wealth_macro, indexes, by = c("country", "year"))
    dir.create(dirname(file.path(path, "Wealth-Macro-Series.csv")), recursive = TRUE, showWarnings = FALSE)
    write.csv(wid_data_wealth_macro, file.path(path, "Wealth-Macro-Series.csv"), row.names = FALSE)
  }
}

##### Wealth Distribution DINA Series #####
if (DINA_wealth == TRUE && all_data == FALSE) {
 
   wid_data_wealth_DINA <- wid_data[substr(wid_data$variable, 2, 6) %in% dibn_wealth, ]
 
    if (length(percentiles) > 0){
    wid_data_wealth_DINA <- wid_data_wealth_DINA[ wid_data_wealth_DINA$percentile %in% percentiles, ]
    }
   
  if (nrow(wid_data_wealth_DINA) == 0) {
    rm(list = ls())
    message("Sorry. No available data for the series and country group selected.")
    stop()
  } else {
    wid_data_wealth_DINA <- merge(wid_data_wealth_DINA, indexes, by = c("country", "year"))
    shares_rows <- grepl("^s", wid_data_wealth_DINA$variable, ignore.case = TRUE)
    wid_data_wealth_DINA[shares_rows, 6:12] <- NA
    dir.create(dirname(file.path(path, "Wealth-Distribution-Series.csv")), recursive = TRUE, showWarnings = FALSE)
    write.csv(wid_data_wealth_DINA, file.path(path, "Wealth-Distribution-Series.csv"), row.names = FALSE)
  }
}

##### Carbon Distribution and Macro Series #####
if (carbon_series == TRUE && all_data == FALSE) {
 
   wid_data_carbon <- wid_data[substr(wid_data$variable, 2, 6) %in% carbon, ]
 
   if (length(percentiles) > 0){
    wid_data_carbon <- wid_data_carbon[ wid_data_carbon$percentile %in% percentiles, ]
   }
  
  if (nrow(wid_data_carbon) == 0) {
    rm(list = ls())
    message("Sorry. No available data for the series and country group selected.")
    stop()
  } else {
    dir.create(dirname(file.path(path, "Carbon-Distr-Macro-Series.csv")), recursive = TRUE, showWarnings = FALSE)
    write.csv(wid_data_carbon, file.path(path, "Carbon-Distr-Macro-Series.csv"), row.names = FALSE)
  }
}

##### Population Series #####
if (population_series == TRUE && all_data == FALSE) {
  wid_data_pop <- wid_data[substr(wid_data$variable, 2, 6) %in% population, ]
  if (nrow(wid_data_pop) == 0) {
    rm(list = ls())
    message("Sorry. No available data for the series and country group selected.")
    stop()
  } else {
    dir.create(dirname(file.path(path, "Population-Series.csv")), recursive = TRUE, showWarnings = FALSE)
    write.csv(wid_data_pop, file.path(path, "Population-Series.csv"), row.names = FALSE)
  }
}

##### Wealth Income Ratio #####
if (ratios_and_shares == TRUE && all_data == FALSE) {
  wid_data_ratio <- wid_data[substr(wid_data$variable, 2, 6) %in%  ratios, ]
  if (nrow(wid_data_ratio) == 0) {
    rm(list = ls())
    message("Sorry. No available data for the series and country group selected.")
    stop()
  } else {
    dir.create(dirname(file.path(path, "wealth-to-income-ratios-series.csv")), recursive = TRUE, showWarnings = FALSE)
    write.csv(wid_data_ratio, file.path(path, "wealth-to-income-ratios-series.csv"), row.names = FALSE)
  }
}

##### Full WID series #####
if(all_data){
  # subset out indexes
  wid_data<-wid_data[!substr(wid_data$variable,1,1)%in%c("i","x"),]
  wid_data<-merge(wid_data,indexes, by=c("country", "year")) #merge
  #empty indexes for non monetary values
  carbon_str <- paste(carbon, collapse = "|")
  carbon_rows <- grepl(carbon_str, wid_data$variable, ignore.case = TRUE)
  wid_data[carbon_rows, 6:12] <- NA
  pop_str <- paste(population, collapse = "|")
  pop_rows <- grepl(pop_str, wid_data$variable, ignore.case = TRUE)
  wid_data[pop_rows, 6:12] <- NA
  shares_rows <- grepl("^s", wid_data$variable, ignore.case = TRUE)
  wid_data[shares_rows, 6:12] <- NA 
  ratios_rows <- grepl("^w",wid_data$variable, ignore.case = TRUE)
  wid_data[ratios_rows, 6:12] <- NA 
  all_wid_data<-wid_data
  #save
  dir.create(dirname(file.path(path,"Full-WID-Series.csv")), recursive = TRUE, showWarnings = FALSE)
  write.csv(all_wid_data, file.path(path,"Full-WID-Series.csv"))
}

rm(wid_data)
# --------------------------- END OF SCRIPT ------------------------------------