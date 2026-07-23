
********************************************************************************
* 	Accessing WID Data Using WID Website Raw Data.                			   *
*	Prepared by: Khaled Bendary, Rowaida Moshrif, Stella Muti, Ana Van Der Ree *
*	First Created: December 4, 2024.                              			   *
*	Last Updated:  April 2026                                  		   		   *
******************************************************************************** 

* ======== SECTION 1: IMPORT & CLEAN WID DATA  =================================

local baseurl "https://wid.world/bulk_download"
local rawdir  "$data_raw"

* fix global countries names (regions)
local countries : subinstr global countries "_" "-", all

local first ""
tempfile WID_data_combined

foreach country of local countries {
    
    * download requested country file directly
    local fileurl "`baseurl'/WID_data_`country'.csv"
    local localfile "`rawdir'/WID_data_`country'.csv"
    
    di as txt "Downloading `country' from `fileurl' ..."
    copy "`fileurl'" "`localfile'", replace
    
    * import and append
    import delimited "`localfile'", clear
    
    if "`first'" == "" {
        save `WID_data_combined', replace
        local first "`country'"
    }
    else {
        append using `WID_data_combined'
        save `WID_data_combined', replace
    }
}

use `WID_data_combined', clear

* clean WID code
gen updated_var = variable
replace updated_var = regexs(1) + regexs(3) + regexs(2) if ///
    regexm(variable, "(.*?)([a-z])([0-9]+)$")

drop variable
capture drop age pop
rename updated_var variable

duplicates drop

save `WID_data_combined', replace

* ======== SECTION 2: SAVE INDEXES  ============================================


	keep if inlist(substr(variable, 1, 1), "i", "x")
	reshape wide value, i(country percentile year) j(variable) string
	foreach var of varlist value* {
		local newname = substr("`var'", 6, .)
		rename `var' `newname'
			}
		tempfile indexes 
		save `indexes', replace 



* save if indexes data requested
	if "$price_indexes" == "YES" {
		
		capture mkdir "$path"
		save "$path/Indexes.dta", replace
	}


	
* ======== SECTION 2: SAVE AND EXPORT REQUESTED DATA SERIES  ===================

**# macro income
if "$macro_income" == "YES" & "$all_data"=="NO" {
use `WID_data_combined', clear

	gen keep_series = 0
	foreach fivelet of global income_macro {
		replace keep_series = 1 if ///
			strpos(variable, "a`fivelet'") > 0 | ///
			strpos(variable, "m`fivelet'") > 0
		}
	keep if keep_series == 1
	drop keep_series
	
	 if c(N) == 0 {
        display as error "Sorry. No available data for wealth-income ratios."
        exit 1
    }
	
	merge m:1 country year using "`indexes'", nogen
	
	capture mkdir "$path"
	save "${path}/Income-Macro-Series.dta", replace

}


**# Income Distribution DINA Series 

if "$DINA_income" == "YES" & "$all_data"=="NO" {
use `WID_data_combined', clear

	gen keep_series = 0
	foreach fivelet of global income_distr {
		replace keep_series = 1 if ///
			strpos(variable, "a`fivelet'") > 0 | ///
			strpos(variable, "b`fivelet'") > 0 | ///
			strpos(variable, "c`fivelet'") > 0 | ///
			strpos(variable, "m`fivelet'") > 0 | ///
			strpos(variable, "s`fivelet'") > 0 | ///
			strpos(variable, "t`fivelet'") > 0
		}
		
	if "$percentiles" != "" {
		gen temp_keep = 0
		foreach perc of global percentiles {
			replace temp_keep = 1 if percentile == "`perc'"
		}
		replace keep_series = 0 if temp_keep == 0
		drop temp_keep
    }
	
	keep if keep_series == 1
	drop keep_series
	
		if c(N) == 0 {
         display as error "Sorry. No available data for wealth-income ratios."
         exit 1
        }
	
	merge m:1 country year using "`indexes'", nogen
	
	* NAs for non-monetary values for index cols
        ds
    local allvars `r(varlist)'
	local tot : word count `allvars'
	 forval i = 6/`tot' {
		local var : word `i' of `allvars'
		replace `var' = . if inlist(substr(variable, 1, 1), "s")
	 }
		
	capture mkdir "$path"
	save "${path}/Income-Distribution-Series.dta", replace
}

**#  Wealth Macro Series 

if "$macro_wealth" == "YES"  & "$all_data"=="NO" {
use `WID_data_combined', clear

	gen keep_series = 0
	foreach fivelet of global wealth_macro {
		replace keep_series = 1 if ///
			strpos(variable, "a`fivelet'") > 0 | ///
			strpos(variable, "m`fivelet'") > 0
		}
		
	keep if keep_series == 1
	drop keep_series
	
		if c(N) == 0 {
         display as error "Sorry. No available data for wealth-income ratios."
         exit 1
        }
		
	merge m:1 country year using "`indexes'", nogen
	
	capture mkdir "$path"
	save "${path}/Wealth-Macro-Series.dta", replace
}


**# Wealth Distribution DINA Series 

if "$DINA_wealth" == "YES"  & "$all_data"=="NO" {
use `WID_data_combined', clear

	gen keep_series = 0
	foreach fivelet of global dibn_wealth {
		replace keep_series = 1 if ///
			strpos(variable, "a`fivelet'") > 0 | ///
			strpos(variable, "b`fivelet'") > 0 | ///
			strpos(variable, "c`fivelet'") > 0 | ///
			strpos(variable, "m`fivelet'") > 0 | ///
			strpos(variable, "s`fivelet'") > 0 | ///
			strpos(variable, "t`fivelet'") > 0
	}
		
	if "$percentiles" != "" {
		gen temp_keep = 0
		foreach perc of global percentiles {
			replace temp_keep = 1 if percentile == "`perc'"
		}
		replace keep_series = 0 if temp_keep == 0
		drop temp_keep
    }

	keep if keep_series == 1
	drop keep_series
	
	if c(N) == 0 {
    display as error "Sorry. No available data for wealth-income ratios."
    exit 1
    }
		
	merge m:1 country year using "`indexes'", nogen
	
	* NAs for non-monetary values for index cols
    ds
    local allvars `r(varlist)'
	local tot : word count `allvars'
	 forval i = 6/`tot' {
		local var : word `i' of `allvars'
		replace `var' = . if inlist(substr(variable, 1, 1), "s")
	 }
		
	capture mkdir "$path"
	save "${path}/Wealth-Distribution-Series.dta", replace
}


**# Carbon Distribution and Macro Series  
if "$carbon_series" == "YES" & "$all_data" == "NO" {
use `WID_data_combined', clear

	gen keep_series = 0
	foreach fivelet of global carbon {
		replace keep_series = 1 if ///
			strpos(variable, "e`fivelet'") > 0 | ///
			strpos(variable, "k`fivelet'") > 0 | ///
			strpos(variable, "l`fivelet'") > 0 
		}
		
	if "$percentiles" != "" {
		gen temp_keep = 0
		foreach perc of global percentiles {
			replace temp_keep = 1 if percentile == "`perc'"
		}
		replace keep_series = 0 if temp_keep == 0
		drop temp_keep
    }
	
	keep if keep_series == 1
	drop keep_series
	
		if c(N) == 0 {
         display as error "Sorry. No available data for wealth-income ratios."
         exit 1
        }
		
	capture mkdir "$path"
	save "${path}/Carbon-Distrib-Macro-Series.dta", replace

}


**# Population Series 

if "$population_series" == "YES" & "$all_data" == "NO" {
use `WID_data_combined', clear

	gen keep_series = 0
	foreach fivelet of global population {
		replace keep_series = 1 if ///
			strpos(variable, "n`fivelet'") > 0
		}
	keep if keep_series == 1
	drop keep_series
	
		if c(N) == 0 {
         display as error "Sorry. No available data for wealth-income ratios."
         exit 1
        }	
		
	capture mkdir "$path"
    save "${path}/Population-Series.dta", replace
restore
}


**#  Wealth-Income Ratios - Capital shares

if "$ratios_and_shares" == "YES" & "$all_data" == "NO" {	
	
use `WID_data_combined', clear

	gen keep_series = 0
	foreach fivelet of global ratios {
		replace keep_series = 1 if ///
			strpos(variable, "w`fivelet'") > 0
		}
	keep if keep_series == 1
	drop keep_series
	
		if c(N) == 0 {
         display as error "Sorry. No available data for wealth-income ratios."
         exit 1
        }	
		
	capture mkdir "$path"
    save "${path}/Income_Wealth_ratios-Capital_shares.dta", replace

} 

**# All WID series

if "$all_data"== "YES" {
use `WID_data_combined', clear

     keep if !inlist(substr(variable, 1, 1), "i", "x")
     merge m:1 country year using "`indexes'", nogen
	 
	* NAs for non-monetary values for index cols
	ds
    local allvars `r(varlist)'
	local tot : word count `allvars'

	forval i = 6/`tot' {
		local var : word `i' of `allvars'
		replace `var' = . if inlist(substr(variable, 1, 1), "s", "n", "w", "e", "k", "l")
	 }
	
	capture mkdir "$path"
    save "${path}/Full-WID-Series.dta", replace

}
	
	
	
	