#-------------------------------------------------------# 
# Topic: Accessing WID Data - master script to get data # 
# Prepared by: Stella Muti                              #
#	First Created: February 18, 2025                      #
# Last Updated:  April 2, 2025                          #
#-------------------------------------------------------#


# ===== RUN SET UPS ============================================================

# Define working directories
WID <- getwd()
WID_Extract <- file.path(WID, "Cleaned WID Data")
data_raw <- file.path(WID, "Working Folder/Raw Data")
setup_scripts <- file.path(WID, "Working Folder/Setup Scripts")

# define desired countries, series, and percentiles
source(file.path(setup_scripts, "requested-countries.R"))
source(file.path(setup_scripts, "series-all.R"))
source(file.path(setup_scripts, "percentiles.R"))

#display countries in the console
message("Set Ups ran correctly. You will get data for: ", paste(countries, collapse = ", "),".")                                   


# ==== DOWNLOAD, CLEAN, SAVE DATA ==============================================

if(command){
  source(file.path(setup_scripts,"get-data-command.R"))
}else{
  source(file.path(setup_scripts,"get-data-website.R"))
}



# ==== CLEAN WORKING ENVIRONMENT =============================================== 

#clean working environment
rm(list = setdiff(ls(), ls()[sapply(ls(), function(x) is.data.frame(get(x)))]))


# Send message to console: 
message("Download and data cleaning completed, you will find data in the 'Cleaned WID Data' folder.")


#-------------------------- END OF MASTER SCRIPT -------------------------------
