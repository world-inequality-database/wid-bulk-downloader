#   * *********************************************** *
#   *  Accessing WID Data                             *
#   *                                                 *
#   *  NOTE: Please read the READ-ME file before      * 
#   *                                                 *
#   * *********************************************** *

rm(list = ls())
gc()

# ------------------------ [0] USAGE DESCRIPTION -------------------------------

# This script that sets parameters and runs the download and cleaning of WID data


# The user selects the region or country group, the type of WID series, 
# and percentiles (if distributional data) to be downloaded (see the READ.ME)

#  NOTE [1]: Only ONE country group must be selected at a time
#  NOTE [2]: Multiple WID series can be selected at once


#  USAGE:
#  1. From sections 1 to 3.1, set macros (TRUE/FALSE) accordingly
#  2. Run the entire script and wait for confirmation message


# --------------------- [1] DOWNLOAD METHOD SELECTION --------------------------

# Select download method (LOOK AT READ.ME)
#     - set command <- TRUE to use WID command
#     - set command <- FALSE to use WID website

command <- TRUE


# ---------------------- [2] SELECT DESIRED COUNTRIES --------------------------

# Set ONE of the following lines to TRUE

#  NOTE: set TRUE one (AND ONE ONLY) group of countries               


#  [1]: Core countries, territories, and other territories
  
    main_corecountries <- FALSE              # core countries - large data-set  
    main_coreterritories <- FALSE            # core territories
    
    main_subcountries <- FALSE               # sub-countries 
    main_historicalregions <- FALSE          # historical regions
    main_oilcountries <- FALSE               # oil countries

  
#   [2]: Regional Data
  
#   [2.1] WID Regions: 
    coord_europe <- FALSE                    # Europe
    coord_ruca <- FALSE                      # Russia and Central Asia
    coord_ea <- FALSE                        # East Asia 
    coord_ssa <- FALSE                       # South & South-East Asia
    coord_ssaf <- FALSE                      # Sub Saharan Africa
    coord_mena <- FALSE                      # Middle East & North Africa
    coord_latam <- FALSE                     # Latin America
    coord_naoc <- FALSE                      # North America & Oceania
  
#   [2.2] WID  sub-regions: 
    coord_we <- FALSE                        # Western Europe
    coord_ee <- FALSE                        # Eastern Europe
    coord_sa <- FALSE                        # South America
    coord_cac <- FALSE                       # Central America & Caribbean
    coord_wca <- FALSE                       # West & Central Africa
    coord_esa <- FALSE                       # East & Southern Africa
   
#  [3]: World  
 
   full_world <- FALSE                       # Entire world - large data-set 
   world_avg <- FALSE                        # World aggregate values 
   

 # ---------------------- [3] SELECT DESIRED WID SERIES ------------------------
  
# Set ONE OR MORE of the following lines to TRUE
   
  # Set all_data <- TRUE if you want a data-set with all series

  DINA_income <- FALSE                    # distributional income series
  macro_income <- FALSE                   # income macro series
   
  DINA_wealth <- FALSE                    # distributional wealth series
  macro_wealth <- FALSE                   # wealth macro series

  price_indexes <- FALSE                  # MER, PPP exchange rates and price indexes
  carbon_series <- FALSE                  # distributional and macro carbon series
  population_series <- FALSE              # population series from 
  ratios_and_shares <- FALSE              # wealth/income ratios & labor/capital shares

  all_data <- FALSE                       # all series - large data-set

# ------------------ [3.1] DINA DATA: PERCENTILES SELECTION --------------------

# - - - DISREGARD THIS SECTION IF YOU ARE NOT DOWNLOADING DISTRIBUTIONAL DATA - - - #
  
# Set ONE of the following lines to TRUE
  
g_percentiles <- TRUE                    # 127 generalized percentiles - large dataset
deciles <- FALSE                          # p010 - p10p20 - etc
groups <- FALSE                           # p050, p50p90, p90p100, p99p100

#  If all are set to FALSE, it defaults to downloading ALL percentiles and groups (large dataset)

# ------------------------- [4] EXECUTE CODE  ----------------------------------
  

  
source("Working Folder/Setup Scripts/get-data.R") # NOTE: check messages in the console
  

   
# ******************************* END OF SCRIPT ****************************** #
