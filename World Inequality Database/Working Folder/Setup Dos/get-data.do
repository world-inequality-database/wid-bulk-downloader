*******************************************************
* Accessing WID Data - master script to get data
*******************************************************

// =================== [1] SET UP WORKING DIRECTORIES ==========================

// Define working folders
global WID                  "`c(pwd)'"   // Base folder
global WID_Extract         "$WID/Cleaned WID Data"
global data_raw            "$WID/Working Folder/Raw Data"
global setup_dos       "$WID/Working Folder/Setup Dos"


// =================== [2] LOAD PARAMETERS & SELECTORS =========================

// Define desired countries, series, and percentiles
quietly do "$setup_dos/requested-countries.do"
quietly do "$setup_dos/series-all.do"
quietly do "$setup_dos/percentiles.do"

// =================== [3] DISPLAY SETTINGS ====================================

* Show selected countries in the console
di as result "Set Ups ran correctly. You will get data for: $countries"


// =================== [4] DOWNLOAD, CLEAN, SAVE DATA ==========================

di as result "Download and data cleaning started. It might take a while for large datasets, and in case of slow internet connection. Please wait."


if "$use_command" == "YES" {
     quietly do "$setup_dos/get-data-command.do"
}
else {
     quietly do "$setup_dos/get-data-website.do"
}


// =================== [5] CLEAN WORKING ENVIRONMENT ===========================

* Clean working enviroment
macro drop _all

// Message to user
di as result "Download and data cleaning completed. You will find data in 'Cleaned WID Data folder'"




*********************** END OF MASTER SCRIPT ***********************************

