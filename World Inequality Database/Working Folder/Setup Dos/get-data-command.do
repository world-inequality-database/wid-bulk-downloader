* ******************************************************************************
* Accessing WID Data Using WID Stata Command                   				   *
*	Prepared by: Khaled Bendary, Rowaida Moshrif, Stella Muti, Ana Van Der Ree *
*	First Created: December 4, 2024.                              			   *
*	Last Updated:  April 2026                                  		   		   *
******************************************************************************** 

* ======= SECTION 1: Load globals and wid package ==============================

*install package 
ssc install wid, replace

* Define prefixes (as locals)
local macro_prefix a m
local distr_prefix a b c o m s t
local carbon_prefix e k l

* ====== SECTION 2: Define available codes =====================================

include "${setup_dos}/country_code_vectors.do"

* Fix global countries names: replace underscores with hyphens
local countries : subinstr global countries "_" "-", all

set maxvar 120000

foreach group of local countries {
    local codes = "$`group'"
	
    foreach code of local codes {
        if strpos(" `all_codes' ", " `code' ") == 0 {
            global all_codes "$all_codes `code'"
        }
    }
}

* ===== SECTION 3: Import and Export Indexes ===================================
 
	wid, indicators($index_mer) areas($countries) clear
		reshape wide value, i(country percentile year) j(variable) string
		renvars value*, predrop(5) 
		drop age pop
			
	tempfile indexes
	save `indexes', replace 

	* save if you call indexes 
	if "$price_indexes" == "YES" {
		capture mkdir "$path"
		save "$path/Indexes.dta", replace
	}

 

* ====== SECTION 4: Import and Export Data series requested ====================

* Declare tempfiles for all datasets
tempfile income_macro_series dist_series wealth_macro_series wealth_dist_series carbon_series pop_series ratios_series

**# Macro Income

if "$macro_income" == "YES" {
	 
 * codes to download
   local codes ""
   foreach fivelet in $income_macro {
	 foreach prefix in `macro_prefix' {
		local sixlet "`prefix'`fivelet'"
		  if strpos("$all_codes", " `sixlet' ") {
			local codes "`codes' `sixlet'"
            }
         }
     }
	 if "`codes'" == "" {
        display as error "Sorry. No available data for this selection."
		clear all
        exit 1
    }	 
* download
   wid, indicator(`codes') areas($countries) ages() p() years() clear
   drop age pop
   merge m:1 country year using "`indexes'", nogen
* save
   save `income_macro_series', replace
   capture mkdir "$path"
   save "${path}/Income-Macro-Series.dta", replace 

}
		

**# Income Distribution DINA 

if "$DINA_income" == "YES" {

    * codes to download
    local codes
    foreach fivelet in $income_distr {
        foreach prefix in `distr_prefix' {
            local sixlet "`prefix'`fivelet'"
            if strpos("$all_codes", " `sixlet' ") {
                local codes "`codes' `sixlet'"
            }
        }
    }
    if "`codes'" == "" {
        di as error "Sorry. No available data for this selection."
        clear all
        exit 1
    }

    * if all percentiles are requested, split download into chunks of 6 codes
    if "$percentiles" == "_all" {

        tempfile dist_series
        local n_codes : word count `codes'
        local chunk_size 6
        local n_chunks = ceil(`n_codes' / `chunk_size')

        local first = 1
        forval c = 1/`n_chunks' {

            local start = (`c' - 1) * `chunk_size' + 1
            local end   = min(`c' * `chunk_size', `n_codes')

            local chunk_codes
            forval j = `start'/`end' {
                local this_code : word `j' of `codes'
                local chunk_codes "`chunk_codes' `this_code'"
            }

            di as txt "Downloading Income DINA part `c' of `n_chunks' ..."

            wid, indicators(`chunk_codes') areas(`countries') clear
            capture drop age pop

            if `first' {
                save `dist_series', replace
                local first = 0
            }
            else {
                append using `dist_series'
                save `dist_series', replace
            }
        }

        use `dist_series', clear
    }
    else {
        wid, indicators(`codes') areas(`countries') perc($percentiles) clear
        capture drop age pop
    }

    merge m:1 country year using `indexes', nogen

    * NAs for non-monetary values for index cols
    ds
    local allvars `r(varlist)'
    local tot : word count `allvars'
    forval i = 6/`tot' {
        local var : word `i' of `allvars'
        replace `var' = . if inlist(substr(variable, 1, 1), "s")
    }

    save `dist_series', replace
    capture mkdir "$path"
    save "${path}/Income-Distribution-Series.dta", replace
}



**#  Macro Wealth 

if "$macro_wealth" == "YES" {
	 
 * codes to download
   local codes ""
   foreach fivelet in $wealth_macro {
	 foreach prefix in `macro_prefix' {
		local sixlet "`prefix'`fivelet'"
		  if strpos("$all_codes", " `sixlet' ") {
			local codes "`codes' `sixlet'"
            }
         }
     }
	 if "`codes'" == "" {
        display as error "Sorry. No available data for this selection."
		clear all
        exit 1
    }	 
* download
   wid, indicator(`codes') areas($countries) ages() p() years() clear
   drop age pop
   merge m:1 country year using "`indexes'", nogen
* save
   save `wealth_macro_series', replace
   capture mkdir "$path"
   save "${path}/Wealth-Macro-Series.dta", replace
 

}

**# Wealth Distribution DINA

if "$DINA_wealth" == "YES" {

  * codes to download
    local codes ""
    foreach fivelet in $dibn_wealth  {
	 foreach prefix in `distr_prefix' {
		local sixlet "`prefix'`fivelet'"
		  if strpos("$all_codes", " `sixlet' ") {
			local codes "`codes' `sixlet'"
            }
         }
     }
        if "`codes'" == "" {
            display as error "Sorry. No available data for this selection."
			clear all
            exit 1
        }

        wid, indicators(`codes') areas($countries) perc($percentiles) clear
        drop age pop
        merge m:1 country year using `indexes', nogen

     * NAs for non-monetary values for index cols
		ds
		local allvars `r(varlist)'
		local tot : word count `allvars'
	    forval i = 6/`tot' {
	      	local var : word `i' of `allvars'
	    	replace `var' = . if inlist(substr(variable, 1, 1), "s")
	     }

		save `wealth_dist_series', replace
        capture mkdir "$path"
        save "${path}/Wealth-Distribution-Series.dta", replace
 
}   


**# Carbon Series

if "$carbon_series" == "YES" {

  * codes to download
    local codes ""
    foreach fivelet in $carbon {
	 foreach prefix in `carbon_prefix' {
		local sixlet "`prefix'`fivelet'"
		  if strpos("$all_codes", " `sixlet' ") {
			local codes "`codes' `sixlet'"
            }
         }
     }
        if "`codes'" == "" {
            display as error "Sorry. No available data for this selection."
			clear all
            exit 1
        }

        wid, indicators(`codes') areas($countries) perc($percentiles) clear
		drop age pop
      
		save `carbon_series', replace
        capture mkdir "$path"
        save "${path}/Carbon-Series.dta", replace
 
}   

**# Population Series 

if "$population_series" == "YES" {

    local codes ""
    foreach var in $population {
        local code = "n`var'"
        if strpos("$all_codes", " `code' ") {
            local codes "`codes' `code'"
        }
    }
    if "`codes'" == "" {
        display as error "Sorry. No available data for this selection."
		clear all
        exit 1
    }
    
    wid, indicators(`codes') areas($countries) clear
    drop age pop
    
    save `pop_series', replace
    capture mkdir "$path"
    save "${path}/Population-Series.dta", replace
  
}

**#  Wealth-Income Ratios - Capital shares

if "$ratios_and_shares" == "YES" {

    local codes
    foreach var in $ratios {
        local codes "`codes' `var'"
    }
    if "`codes'" == "" {
        display as error "Sorry. No available data for wealth-income ratios."
		clear all
        exit 1
    }
    wid, indicators(`codes') areas($countries) clear
	
    save `ratios_series', replace
    capture mkdir "$path"
    save "${path}/Income_Wealth_ratios-Capital_shares.dta", replace
   
}

**# Full WID Dataset 

if "$all_data" == "YES" {
    
    * First append non-monetary datasets (no indexes needed)
    use `ratios_series', clear
    append using `pop_series'
    append using `carbon_series'
    
    * Merge with indexes and delete index values for non-monetary data
    merge m:1 country year using `indexes', nogen
    
     * NAs for non-monetary values for index cols
		ds
		local allvars `r(varlist)'
		local tot : word count `allvars'
	    forval i = 6/`tot' {
	      	local var : word `i' of `allvars'
	    	replace `var' = . 
	     }

    * Now append the monetary datasets (which already have indexes merged)
    append using `income_macro_series'
    append using `dist_series'
    append using `wealth_macro_series'
    append using `wealth_dist_series'

    capture mkdir "$path"
    save "${path}/Full-WID-Series.dta", replace
}


* ------------------------ END OF SCRIPT -----------------------------------
