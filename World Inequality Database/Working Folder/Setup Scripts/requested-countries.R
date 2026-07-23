### DEFINE COUNTRIES GIVEN BLOCK AND GROUP OF COUNTRIES REQUESTED ###

#country mapping to print names, not iso 
#source("country-mapping.R")

# ======= BLOCK [1] ============================================================ 

#core countries requested #
if (main_corecountries){
  path <- file.path(WID_Extract, "Core Countries")
  countries <- c("AD", "AE", "AF", "AG", "AI", "AL", "AM", "AO","AR", "AT", "AU", 
                 "AW", "AZ", "BA", "BB", "BD", "BE", "BF", "BG", "BH", "BI", "BJ",
                 "BM", "BN", "BO", "BQ", "BR", "BS", "BT", "BW", "BY", "BZ", "CA", 
                 "CD", "CF", "CG", "CH", "CI", "CL", "CM", "CN", "CO", "CR", "CU", 
                 "CV", "CW", "CY", "CZ", "DE", "DJ", "DK", "DM", "DO", "DZ", "EC",
                 "EE", "EG", "ER", "ES", "ET", "FI", "FJ", "FM", "FR", "GA", "GB", 
                 "GD", "GE", "GG", "GH", "GI", "GL", "GM", "GN", "GQ", "GR", "GT", 
                 "GW", "GY", "HK", "HN", "HR", "HT", "HU", "ID", "IE", "IL", "IM", 
                 "IN", "IQ", "IR", "IS", "IT", "JE", "JM", "JO", "JP", "KE", "KG", 
                 "KH", "KI", "KM", "KN", "KP", "KR", "KS", "KW", "KY", "KZ", "LA", 
                 "LB", "LC", "LI", "LK", "LR", "LS", "LT", "LU", "LV", "LY", "MA", 
                 "MC", "MD", "ME", "MG", "MH", "MK", "ML", "MM", "MN", "MO", "MR", 
                 "MS", "MT", "MU", "MV", "MW", "MX", "MY", "MZ", "NA", "NC", "NE", 
                 "NG", "NI", "NL", "NO", "NP", "NR", "NZ", "OM", "PA", "PE", "PF",
                 "PG", "PH", "PK", "PL", "PR", "PS", "PT", "PW", "PY", "QA", "RO",
                 "RS", "RU", "RW", "SA", "SB", "SC", "SD", "SE", "SG", "SI", "SK",
                 "SL", "SM", "SN", "SO", "SR", "SS", "ST", "SV", "SX", "SY", "SZ", 
                 "TC", "TD", "TG", "TH", "TJ", "TL", "TM", "TN", "TO", "TR", "TT", 
                 "TV", "TW", "TZ", "UA", "UG", "US", "UY", "UZ", "VC", "VE", "VG", 
                 "VN", "VU", "WS", "YE", "ZA", "ZM", "ZW")
  

}

#core territories requested #
if (main_coreterritories) {
  path <- file.path(WID_Extract, "Core Territories")
  countries <- c("RU", "OA", "CN", "JP", "OB", "DE", "ES", "FR", "GB", "IT", "SE", 
                 "OC", "QM", "AR", "BR", "CL", "CO", "MX", "OD", "DZ", "EG", "TR", 
                 "OE", "CA", "US", "AU", "NZ", "OH", "IN", "ID", "OI", "ZA", "OJ")

}


#sub-countries requested #
if (main_subcountries) {
  path <- file.path(WID_Extract, "Sub-Country Regions")
  countries <-  c("CN-RU", "CN-UR", "DE-BD", "DE-BY", "DE-HB", "DE-HE", "DE-HH", "DE-PR", "DE-SN", "DE-WU",  
                  "US-AK", "US-AL", "US-AR", "US-AZ", "US-CA", "US-CO", "US-CT", "US-DC", "US-DE", "US-FL",  
                  "US-GA", "US-HI", "US-IA", "US-ID", "US-IL", "US-IN", "US-KS", "US-KY", "US-LA", "US-MA",  
                  "US-MD", "US-ME", "US-MI", "US-MN", "US-MO", "US-MS", "US-MT", "US-NC", "US-ND", "US-NE",  
                  "US-NH", "US-NJ", "US-NM", "US-NV", "US-NY", "US-OH", "US-OK", "US-OR", "US-PA", "US-RI",  
                  "US-SC", "US-SD", "US-TN", "US-TX", "US-UT", "US-VA", "US-VT", "US-WA", "US-WI", "US-WV", "US-WY")
  
}

#historical regions requested #
if (main_historicalregions) {
  path <- file.path(WID_Extract, "Historical Regions")
  countries <-  c("CS", "DD", "SU", "YU", "ZZ")
  
}

#oil countries requested#
if (main_oilcountries) {
  path <- file.path(WID_Extract, "Oil Countries")
  countries <-  c("AE", "BH", "IQ", "IR", "KW", "OM", "QA", "SA", "YE")
  
}

# ======= BLOCK [2] ============================================================ 

#### [2.1] MACRO REGIONS ####

# North America & Oceania requested #
# Extract Countries and all Sub-Regions 
if (coord_naoc) {
  path <- file.path(WID_Extract,  "North America & Oceania")
  countries <- "US AU CA NZ QF QG QP QQ XB OH QF-MER QG-MER QP-MER QQ-MER XB-MER OH-MER"
}

# MENA requested #
# Extract Countries and all Sub-Regions 
if (coord_mena) {
  path <- file.path(WID_Extract,  "Middle East & North Africa")
  countries <- c("AE", "BH", "DZ", "EG", "IL", "IQ", "IR", "JO", "KW", "LY", "LB", "MA", "OM", "PS", "QA", "SA",  
                 "SY", "TN", "TR", "YE", "QO", "XM", "XN", "OE", "QO-MER", "XM-MER", "XN-MER", "OE-MER")
}

# LATAM requested #
# Extract Countries and all Sub-Regions 
if (coord_latam) {
  path <- file.path(WID_Extract,  "Latin America")
  countries <- c("AR", "BO", "BR", "BS", "BZ", "CL", "CO", "CR", "CU", "DO", "EC", "GT", "GY", "HN", "HT",  
                 "JM", "MX", "NI", "PA", "PE", "PY", "SR", "SV", "TT", "UY", "VE", "QH", "QI", "QR", "XL",  
                 "OD", "QH-MER", "QI-MER", "QR-MER", "XL-MER", "OD-MER")
}

# EUROPE requested #
# Extract Countries and all Sub-Regions 
if (coord_europe) {
  path <- file.path(WID_Extract,  "Europe")
  countries <- c("AL", "AT", "BA", "BE", "BG", "CH", "CY", "CZ", "DD", "DE", "DK", "EE", "ES", "FI", "FR",  
                 "GB", "GR", "HR", "HU", "IE", "IS", "IT", "KS", "LT", "LU", "LV", "MD", "ME", "MK", "MT",  
                 "NL", "NO", "PL", "PT", "RO", "RS", "SE", "SI", "SK", "QE", "QM", "QX", "QY", "QC",  
                 "QE-MER", "QM-MER", "QX-MER", "QY-MER", "QC-MER")
}

# RUSSIA AND CENTRAL ASIA requested # 
# Extract Countries and all Sub-Regions 
if(coord_ruca){
  path <- file.path(WID_Extract,  "Russia & Central Asia")
  countries <- c("AM", "AZ", "BY", "GE", "KG", "KZ", "RU", "TJ", "TM", "UA", "UZ", "QJ", "OA",
                 "QJ-MER","QW-MER","XR-MER", "OA-MER")
}

# SUB SAHARAN AFRICA requested #
# Extract Countries and all Sub-Regions 
if (coord_ssaf) {
  path <- file.path(WID_Extract,  "Sub-Saharan Africa")
  countries <- c("AO", "BF", "BI", "BJ", "BW", "CD", "CF", "CG", "CI", "CM", "CV", "DJ", "DZ", "ER",  
                 "ET", "GA", "GH", "GM", "GN", "GQ", "GW", "KE", "KM", "LR", "LS", "MG", "ML",  
                 "MR", "MU", "MW", "MZ", "NA", "NE", "NG", "RW", "SC", "SD", "SL", "SN", "SO", "SS", "ST",  
                 "SZ", "TD", "TG", "TZ", "UG", "ZA", "ZM", "ZW", "QB-MER", "QK-MER", "QN-MER",  
                 "QT-MER", "QV-MER", "XF-MER", "OJ-MER", "QB", "QK", "QN", "QT", "QV", "XF", "OJ")
}


#### [2.2] WORLD SUB-REGIONS #####

# EAST ASIA requested #
# Extract Countries and all Sub-Regions 
if (coord_ea) {
  path <- file.path(WID_Extract,  "East Asia")
  countries <- c("CN", "HK", "JP", "KP", "KR", "MN", "MO", "TW")
}

# SSEA requested #
# Extract Countries and all Sub-Regions 
if (coord_ssa) {
  path <- file.path(WID_Extract,  "South & South-East Asia")
  countries <- c("AF", "BD", "BN", "BT", "ID", "IN", "KH", "LA", "LK", "MM", "MV", "MY", "NP", "PG",  
                 "PH", "PK", "SG", "TH", "TL", "VN")
}

# WESTERN EUROPE requested #
# Extract Countries and all Sub-Regions 
if (coord_we) {
  path <- file.path(WID_Extract,  "Western Europe")
  countries <- c("AT", "BE", "FR", "DE", "IE", "IT", "LU", "NL", "GB", "CH", "DD", "PT", "ES", "IT", "GR",  
                 "MT", "CY", "SE", "NO", "FI", "DK", "IS")
}

# EASTERN EUROPE requested #
# Extract Countries and all Sub-Regions 
if (coord_ee) {
  path <- file.path(WID_Extract,  "Eastern Europe")
  countries <- c("AL", "BA", "BG", "CY", "CZ", "EE", "HR", "HU", "KS", "LT", "LV", "MD", "ME", "MK", "PL", 
                 "RO", "RS", "SI", "SK")
}

# South America requested #
# Extract Countries and all Sub-Regions 
if (coord_sa) {
  path <- file.path(WID_Extract,  "Eastern Europe")
  countries <- c("AR", "BO", "BR", "CL", "CO", "EC", "FK", "GY", "PE", "PY", "SR", "UY", "VE")
}

# Central America & Caribbean requested #
# Extract Countries and all Sub-Regions 
if (coord_cac) {
  path <- file.path(WID_Extract,  "Central America & Caribbean")
  countries <- c("AG", "AI", "AN", "AW", "BB", "BS", "CU", "CW", "DM", "DO", "GD", "HT", "JM", "KN", "KY", 
                 "LC", "MS", "PR", "SX", "TC", "TT", "VC", "VG", "VI", "BZ", "CR", "GT", "HN", "MX", "NI", 
                 "PA", "SV")
}

# West & Central Africa requested #
# Extract Countries and all Sub-Regions 
if (coord_wca) {
  path <- file.path(WID_Extract,  "West & Central Africa")
  countries <- c("BF", "BJ", "CI", "CV", "GH", "GM", "GN", "GW", "LR", "ML", "MR", "NE", "NG", "SH", "SL", 
                 "SN", "TG", "AO", "CD", "CF", "CG", "CM", "GA", "GQ", "ST", "TD")
}

# East & Southern Africa requested #
# Extract Countries and all Sub-Regions 
if (coord_esa) {
  path <- file.path(WID_Extract,  "East & Southern Africa")
  countries <- c("BI", "DJ", "ER", "ET", "KE", "KM", "MG", "MU", "MW", "MZ", "RW", "SC", "SO", "TZ", 
                 "UG", "ZM", "ZW", "ZZ", "BW", "LS", "NA", "SZ", "ZA")
}


# ======= BLOCK [3] ============================================================ 

# entire WID database required #
if (full_world) {
  path <- file.path(WID_Extract, "Entire World")
  countries <- c("AD", "AE", "AF", "AG", "AI", "AL", "AM", "AO", "AR", "AT", "AU", "AW", "AZ", "BA", "BB", 
                 "BD", "BE", "BF", "BG", "BH", "BI", "BJ", "BM", "BN", "BO", "BQ", "BR", "BS", "BT", "BW", 
                 "BY", "BZ", "CA", "CD", "CF", "CG", "CH", "CI", "CL", "CM", "CN", "CO", "CR", "CU", "CV", 
                 "CW", "CY", "CZ", "DE", "DJ", "DK", "DM", "DO", "DZ", "EC", "EE", "EG", "ER", "ES", "ET", 
                 "FI", "FJ", "FM", "FR", "GA", "GB", "GD", "GE", "GG", "GH", "GI", "GL", "GM", "GN", "GQ", 
                 "GR", "GT", "GW", "GY", "HK", "HN", "HR", "HT", "HU", "ID", "IE", "IL", "IM", "IN", "IQ", 
                 "IR", "IS", "IT", "JE", "JM", "JO", "JP", "KE", "KG", "KH", "KI", "KM", "KN", "KP", "KR", 
                 "KS", "KW", "KY", "KZ", "LA", "LB", "LC", "LI", "LK", "LR", "LS", "LT", "LU", "LV", "LY", 
                 "MA", "MC", "MD", "ME", "MG", "MH", "MK", "ML", "MM", "MN", "MO", "MR", "MS", "MT", "MU", 
                 "MV", "MW", "MX", "MY", "MZ", "NA", "NC", "NE", "NG", "NI", "NL", "NO", "NP", "NR", "NZ", 
                 "OM", "PA", "PE", "PF", "PG", "PH", "PK", "PL", "PR", "PS", "PT", "PW", "PY", "QA", "RO", 
                 "RS", "RU", "RW", "SA", "SB", "SC", "SD", "SE", "SG", "SI", "SK", "SL", "SM", "SN", "SO", 
                 "SR", "SS", "ST", "SV", "SX", "SY", "SZ", "TC", "TD", "TG", "TH", "TJ", "TL", "TM", "TN", 
                 "TO", "TR", "TT", "TV", "TW", "TZ", "UA", "UG", "US", "UY", "UZ", "VC", "VE", "VG", "VN", 
                 "VU", "WS", "YE", "ZA", "ZM", "ZW", "CN-RU", "CN-UR", "DE-BD", "DE-BY", "DE-HB", "DE-HE", 
                 "DE-HH", "DE-PR", "DE-SN", "DE-WU", "US-AK", "US-AL", "US-AR", "US-AZ", "US-CA", "US-CO", 
                 "US-CT", "US-DC", "US-DE", "US-FL", "US-GA", "US-HI", "US-IA", "US-ID", "US-IL", "US-IN", 
                 "US-KS", "US-KY", "US-LA", "US-MA", "US-MD", "US-ME", "US-MI", "US-MN", "US-MO", "US-MS", 
                 "US-MT", "US-NC", "US-ND", "US-NE", "US-NH", "US-NJ", "US-NM", "US-NV", "US-NY", "US-OH", 
                 "US-OK", "US-OR", "US-PA", "US-RI", "US-SC", "US-SD", "US-TN", "US-TX", "US-UT", "US-VA", 
                 "US-VT", "US-WA", "US-WI", "US-WV", "US-WY", "QB", "QC", "QD", "QE", "QF", "QG", "QH", 
                 "QI", "QJ", "QK", "QL", "QM", "QN", "QO", "QP", "QQ", "QR", "QS", "QT", "QU", "QV", "QW", 
                 "QX", "QY", "WO", "XA", "XB", "XF", "XL", "XM", "XN", "XR", "XS", "OA", "OB", "OC", "OD", 
                 "OE", "OH", "OI", "OJ", "QB-MER", "QC-MER", "QD-MER", "QE-MER", "QF-MER", "QG-MER", "QH-MER", 
                 "QI-MER", "QJ-MER", "QK-MER", "QL-MER", "QM-MER", "QN-MER", "QO-MER", "QP-MER", "QQ-MER", 
                 "QR-MER", "QS-MER", "QT-MER", "QU-MER", "QV-MER", "QW-MER", "QX-MER", "QY-MER", "WO-MER", 
                 "XA-MER", "XB-MER", "XF-MER", "XL-MER", "XM-MER", "XN-MER", "XR-MER", "XS-MER", "OA-MER", 
                 "OB-MER", "OC-MER", "OD-MER", "OE-MER", "OH-MER", "OI-MER", "OJ-MER", "CS", "DD", "SU", 
                 "YU", "ZZ")
}

if(world_avg){
  path <- file.path(WID_Extract, "World Average")
  countries <- "WO"
}





