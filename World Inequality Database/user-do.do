************************************************
*   Accessing WID Data                         *     
*                                              *    
*   NOTE: Please read the README file before   *
*                                              *
************************************************

clear all
set more off

// ------------------------ [0] USAGE DESCRIPTION -----------------------------

* This script that sets parameters and runs the download and cleaning of WID data

* The user selects the region or country group, the type of WID series, 
* and percentiles (if distributional data) to be downloaded (see the READ.ME)

*  NOTE [1]: Only ONE country group can be selected at a time
*  NOTE [2]: Multiple WID series can be selected at once

*  USAGE:
*  1. From sections 1 to 3, set global macros ("YES"/"NO") accordingly
*  2. Run the entire script and wait for confirmation message


// --------------------- [1] DOWNLOAD METHOD SELECTION -------------------------
* Select download method (LOOK AT READ.ME FILE)
*     - YES = use WID command 
*     -  NO = use WID website

global use_command "NO"


// ---------------------- [2] SELECT DESIRED COUNTRIES -------------------------

* Set ONE of the following options to "YES"

    * NOTE: set "YES" one (AND ONE ONLY) group of countries !  


* [1] Core countries, core territories, and other territories

global main_corecountries      "NO"      // Core countries - large dataset
global main_coreterritories    "NO"      // Core territories
global main_subcountries       "NO"      // Sub-national regions
global main_historicalregions  "NO"      // Historical regions 
global main_oilcountries       "NO"      // Oil-rich countries

* [2]: Regional Data

* [2.1] WID Regions:
global coord_europe            "NO"      // Europe
global coord_ruca              "NO"      // Russia and Central Asia
global coord_ea                "NO"      // East Asia 
global coord_ssa               "NO"      // South & South-East Asia
global coord_ssaf              "NO"      // Sub-Saharan Africa
global coord_mena              "NO"      // Middle East & North Africa
global coord_latam             "NO"      // Latin America
global coord_naoc              "NO"      // North America & Oceania


* [2.2] WID Sub-regions:
global coord_we                "NO"      // Western Europe
global coord_ee                "NO"      // Eastern Europe
global coord_sa                "NO"      // South America
global coord_cac               "NO"      // Central America & Caribbean
global coord_wca               "NO"      // West & Central Africa
global coord_esa               "NO"      // East & Southern Africa


* [3] World

global full_world              "NO"      // Entire world - large dataset
global world_avg               "NO"      // World aggregate values 

// ---------------------- [3] SELECT DESIRED WID SERIES ------------------------

* Set ONE OR MORE of the following lines to "YES"

* Set all_data "YES" if you want a data-set with all series

global DINA_income             "NO"      // Distributional income data
global macro_income            "NO"      // National income aggregates

global DINA_wealth             "NO"      // Distributional wealth data 
global macro_wealth            "NO"      // National wealth aggregates

global price_indexes           "NO"      // MER/PPP exchange rates and price indexes
global carbon_series           "NO"      // Distributional and macro CO2 emissions
global population_series       "NO"      // Population by group
global ratios_and_shares       "NO"      // Wealth/income ratios & labor/capital shares

global all_data                "NO"      // All series - large dataset


// ------------ [3.1] DINA DATA: PERCENTILES SELECTION -------------------------

*  - - - DISREGARD THIS SECTION IF YOU ARE NOT DOWNLOADING DISTRIBUTIONAL DATA - - -

*  Set ONE of the following lines to "YES"

global g_percentiles           "YES"       // 127 generalized percentiles - large dataset
global deciles                 "NO"       // Deciles only (p0p10, p10p20, etc.)
global groups                  "NO"       // Groups (p0p50, p50p90, p90p100, p99p100)

* If all are set to "NO", it defaults to downloading ALL available percentiles groups (including p0p100)


// ------------------------- [4] EXECUTE CODE ----------------------------------

do "Working Folder/Setup Dos/get-data.do" // NOTE: check messages in the console


// ************************ END OF USER SCRIPT *********************************
