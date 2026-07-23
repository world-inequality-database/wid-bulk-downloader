# DEFINE REQUESTED INDICATORS IN WID #

if (all_data) {
  # If full_series is TRUE, set all other variables to TRUE
  macro_income <- TRUE
  DINA_income <- TRUE
  macro_wealth <- TRUE
  DINA_wealth <- TRUE
  price_indexes <- TRUE
  population_series <- TRUE
  ratios_and_shares <- TRUE
  carbon_series <- TRUE
} 

# ---- Indexes and MER ---- *ALWAYS DEFINED*

index_mer <- c("inyixx", "xlcusp", "xlceup", "xlcyup", "xlcusx", "xlceux", "xlcyux", "xrerus", "xrereu", "xreryu", "intlcu")

#---- Income Macro ----
if(macro_income){
gdp_nni <- c("nninc", "ndpro", "gdpro", "confc", "nnfin")
foreign_income_paid_received <- c("nnfin", "finrx", "flcir", "comrx", "pinrx", "fdirx", 
                                  "ptfrx", "ptdrx", "pterx", "ptrrx", "ptfrr", "fsubx", 
                                  "fpsub", "fosub", "finpx", "flcip", "compx", "pinpx", 
                                  "fdipx", "ptfpx", "ptdpx", "ptepx", "ptfrp", "ftaxx", 
                                  "fptax", "fotax")
foreign_income_labor_capital <- c("nnfin", "flcin", "pinnx", "fdinx", "ptfnx", "ptdnx", 
                                  "ptenx", "ptfrn", "ptrrx", "comnx", "taxnx", "prtxn", "optxn")
foreign_wealth <- c("nwnxa", "fdixn", "fdixa", "fdixd", "ptfxn", "ptfxa", "ptexa", 
                    "ptdxa", "ptrxa", "ptfxd", "ptexd", "ptdxd")
primary_income <- c("nninc", "prigo", "prihn", "priho", "prinp", "prico", "prinf", "prifc")
secondary_income <- c("nninc", "secgo", "sechn", "secho", "secnp", "secco", "secnf", "secfc")
property_income <- c("pinnx", "prphn", "prpco", "prpgo")
direct_taxes <- c("taxgo", "tiwhn", "taxco")
ss_contributions <- c("sschn", "sscgo", "sscco")
ss_benefits <- c("ssbhn", "ssbgo", "ssbco")
net_savings <- c("savin", "savhn", "savho", "savnp", "savco", "secnf", "secfc", "savgo")
gross_savings <- c("savig", "saghn", "sagho", "sagnp", "sagco", "segnf", "segfc", "saggo")
net_gross_variables <- c("confc", "cfchn", "cfcho", "cfcnp", "cfcco", "cfcnf", "cfcfc", "cfcgo", "savin", "savig")
# Labor and Capital Income
labor_of_capital_income <- c("nninc", "comhn", "fkpin", "prphn", "prpgo", "nsrhn", "prico", "nmxho", "ptxgo")
# Net and Gross Primary Consumption (Fixed Capital)
net_primconsum_fixcap <- c("prihn", "comhn", "prphn", "nsmhn", "nsrhn", "nmxhn")
gross_primaconsum_fixcap <- c("prghn", "comhn", "prphn", "gsmhn", "gsrhn", "gmxhn")
net_secconsum_fixcap <- c("sechn", "prihn", "taxhn", "sschn", "tiwhn", "ssbhn")
gross_secconsum_fixed_capital <- c("seghn", "prghn", "taxhn", "sschn", "tiwhn", "ssbhn")
net_consumption_fixed_apital <- c("savhn", "sechn", "conhn")
gross_consumption_fixed_apital <- c("saghn", "seghn", "conhn")
relation_net_gross_variables <- c("prghn", "prihn", "cfchn", "seghn", "sechn", "saghn", "savhn", "gsmhn", 
                                  "nsmhn", "gsrhn", "nsrhn", "ccshn", "gmxhn", "nmxhn", "ccmhn")
# Household Income and Consumption
prim_inc_hh_net_consumption <- c("priho", "comho", "prpho", "nsmho", "nsrho", "nmxho")
prim_inc_hh_gross_consumption <- c("prgho", "comho", "prpho", "gsmho", "gsrho", "gmxho")
secon_inc_hh_net_consumption <- c("secho", "priho", "taxho", "sscho", "tiwho", "ssbho")
secon_inc_hh_gross_consumption <- c("segho", "prgho", "taxho", "sscho", "tiwho", "ssbho")
savings_hh_net_consumption <- c("savho", "secho", "conho")
savings_hh_gross_consumption <- c("sagho", "segho", "conho")
relation_hh_net_gross_variables <- c("prgho", "priho", "cfcho", "segho", "secho", "sagho", "savho", "gsmho", 
                                     "nsmho", "gsrho", "nsrho", "ccsho", "gmxho", "nmxho", "ccmho")
# Net and Gross Primary Income for NPISH
net_pinc_NPISH <- c("prinp", "comnp", "prpnp", "nsrnp")
gross_pinc_NPISH <- c("prgnp", "comnp", "prpnp", "gsrnp")
net_sinc_NPISH <- c("secnp", "prinp", "taxnp", "sscnp", "tiwnp", "ssbnp")
gross_sinc_NPISH <- c("segnp", "prgnp", "taxnp", "sscnp", "tiwnp", "ssbnp")
net_cons_sav_NPISH <- c("savnp", "secnp", "connp")
gross_cons_sav_NPISH <- c("sagnp", "segnp", "connp")
relation_NPISH_netgross_vars <- c("prgnp", "prinp", "cfcnp", "segnp", "secnp", "sagnp", "savnp", "gsrnp", "nsrnp")
# Corporate Net and Gross Primary Income
net_pinc_corp <- c("prico", "prpco", "nsrco")
gross_pinc_corp <- c("prgco", "prpco", "gsrco")
net_sinc_corp <- c("secco", "prico", "taxco", "sscco", "ssbco")
gross_sinc_corp <- c("segco", "prgco", "taxco", "sscco", "ssbco")
relation_corp_netgross_vars <- c("prgco", "prico", "cfcco", "segco", "secco")
# Non-financial Corporate Income
net_pinc_nonfincorp <- c("prinf", "prpnf", "nsrnf")
gross_pinc_nonfincorp <- c("prgnf", "prpnf", "gsrnf")
net_sinc_nonfincorp <- c("secnf", "prinf", "taxnf", "sscnf", "ssbnf")
gross_sinc_nonfincorp <- c("segnf", "prgnf", "taxnf", "sscnf", "ssbnf")
relat_nonfincorp_netgross_vars <- c("prgnf", "prinf", "cfcnf", "segnf", "secnf")
# Financial Corporate Income
net_pinc_fincorp <- c("prifc", "prpfc", "nsrfc")
gross_pinc_fincorp <- c("prgfc", "prpfc", "gsrfc")
net_sinc_fincorp <- c("secfc", "prifc", "taxfc", "sscfc", "ssbfc")
gross_sinc_fincorp <- c("segfc", "prgfc", "taxfc", "sscfc", "ssbfc")
relation_fincorp_netgross_vars <- c("prgfc", "prifc", "cfcfc", "segfc", "secfc")
# Government Income and Spending
net_pinc_gov <- c("prigo", "ptxgo", "tpigo", "tprgo", "otpgp", "spigo", "sprgo", "ospgo", "prpgo", "nsrgo")
gross_pinc_gov <- c("prggo", "ptxgo", "tpigo", "tprgo", "otpgp", "spigo", "sprgo", "ospgo", "prpgo", "gsrgo")
# Government Income and Consumption
net_sinc_gov <- c("secgo", "prigo", "taxgo", "tiwgo", "sscgo", "ssbgo")
gross_sinc_gov <- c("seggo", "prggo", "taxgo", "tiwgo", "sscgo", "ssbgo")
net_cons_sav_gov <- c("savgo", "secgo", "congo", "indgo", "colgo")
gross_cons_sav_gov <- c("saggo", "seggo", "congo", "indgo", "colgo")
# Government Expenditure by Function
gov_expenditure_by_function <- c("expgo", "gpsge", "defge", "polge", "ecoge", "envge", "houge", "heage", "recge", 
                                "eduge", "edpge", "edsge", "edtge", "sopge", "spige", "sacge", "sakge")
# Government Spending by Function
gov_spending_by_function <- c("congo", "gpsgo", "defgo", "polgo", "ecogo", "envgo", "hougo", "heago", "recgo", 
                              "edugo", "sopgo", "othgo")
# Government Revenue
gov_revenue <- c("revgo", "pitgr", "citgr", "scogr", "pwtgr", "intgr", "ottgr", "ntrgr", "retgo", "psugo", "ssugo", 
                 "inpgo")
# Current Account
current_account <- c("ncanx", "pinnx", "pinrx", "pinpx", "comnx", "comrx", "compx", "tbnnx", "tbxrx", "tbmpx", "taxnx", 
                     "fsubx", "ftaxx", "scinx", "scirx", "scipx")
# Trade Balance
trade_balance <- c("tbnnx", "tgnnx", "tgxrx", "tgmpx", "tsnnx", "tsxrx", "tsmpx")
trade_balance_services <- c("tsnnx", "tsvnx", "tsvrx", "tsvpx", "tstnx", "tstrx", "tstpx", "tsonx", "tsorx", "tsopx")
# Capital Account
capital_account <- c("fkanx", "fkarx", "fkapx")
# Net Foreign Transfers
net_foreig_transfers <- c("scinx", "scrnx", "scrrx", "scrpx", "scgnx", "scgrx", "scgpx", "sconx", "scorx", "scopx")

#### Aggregates for income ####
income_macro <- c(gdp_nni, foreign_income_paid_received, foreign_income_labor_capital, foreign_wealth, 
                  primary_income, secondary_income, property_income, direct_taxes, ss_contributions, 
                  ss_benefits, net_savings, gross_savings, net_gross_variables, labor_of_capital_income, 
                  net_primconsum_fixcap, gross_primaconsum_fixcap, net_secconsum_fixcap, 
                  gross_secconsum_fixed_capital, net_consumption_fixed_apital, gross_consumption_fixed_apital, 
                  relation_net_gross_variables, prim_inc_hh_net_consumption, prim_inc_hh_gross_consumption, 
                  secon_inc_hh_net_consumption, secon_inc_hh_gross_consumption, savings_hh_net_consumption, 
                  savings_hh_gross_consumption, relation_hh_net_gross_variables, net_pinc_NPISH, gross_pinc_NPISH, 
                  net_sinc_NPISH, gross_sinc_NPISH, net_cons_sav_NPISH, gross_cons_sav_NPISH, 
                  relation_NPISH_netgross_vars, net_pinc_corp, gross_pinc_corp, net_sinc_corp, gross_sinc_corp, 
                  relation_corp_netgross_vars, net_pinc_nonfincorp, gross_pinc_nonfincorp, net_sinc_nonfincorp, 
                  gross_sinc_nonfincorp, relat_nonfincorp_netgross_vars, net_pinc_fincorp, gross_pinc_fincorp, 
                  net_sinc_fincorp, gross_sinc_fincorp, relation_fincorp_netgross_vars, net_pinc_gov, gross_pinc_gov, 
                  net_sinc_gov, gross_sinc_gov, net_cons_sav_gov, gross_cons_sav_gov, gov_spending_by_function, 
                  gov_expenditure_by_function, gov_revenue, current_account, trade_balance, trade_balance_services, 
                  capital_account, net_foreig_transfers)
 }
if (DINA_income) {
# ---- DINA Distributions Income -----

fiscal_income <- c("fiinc", "filin", "fiwag", "fimil", "ficap", "firen", "fiint", "fidiv", "fikgi", "fimik", "fimix")
# Pretax and Posttax Income
pretax_income <- c("ptinc", "ptlin", "ptkin", "pllin", "pkkin")
posttax_income <- c("diinc", "cainc")
# Factor Income
factor_income <- c("fainc", "flinc")
#aggregate DINA income
income_distr <- c(fiscal_income, pretax_income, posttax_income, factor_income)

# source the percentiles requested 
source(file.path(setup_scripts,"percentiles.R"))

}
if (macro_wealth) {
# ---- Wealth Macro -----

wealth_nat_eco <- c("nweal", "nwnfa", "nwhou", "nwdwe", "nwlan", "nwbus", "nwagr", "nwnat", "nwodk", "nwnxa", "nwgxa", 
                    "nwgxd", "nwboo", "cwres", "nwdka")
wealth_hh_NPISH_combined <- c("pweal", "pwnfa", "pwhou", "pwdwe", "pwlan", "pwbus", "pwagr", "pwnat", "pwodk", "pwfin", 
                              "pwfiw", "pwcud", "pwbol", "pwequ", "pweqi", "pwoff", "pwpen", "pwdeb", "pwfie")
wealth_hh <- c("hweal", "hwnfa", "hwhou", "hwdwe", "hwlan", "hwbus", "hwagr", "hwnat", "hwodk", "hwfin", "hwfiw", 
               "hwcud", "hwbol", "hwequ", "hweqi", "hwoff", "hwpen", "hwdeb", "hwfie")
wealth_NPISH <- c("iweal", "iwnfa", "iwhou", "iwdwe", "iwlan", "iwbus", "iwagr", "iwnat", "iwodk", "iwfin", "iwfiw", 
                  "iwcud", "iwbol", "iwequ", "iweqi", "iwoff", "iwpen", "iwdeb", "iwfie")
# Corporate Wealth
wealth_corp <- c("cwboo", "cwnfa", "cwhou", "cwdwe", "cwlan", "cwbus", "cwagr", "cwnat", "cwodk", "cwfin", "cwfiw", 
                 "cwcud", "cwbol", "cwequ", "cweqi", "cwoff", "cwpen", "cwdeb", "cwdeq", "cwres", "cwfie")
# Government Wealth
wealth_gov <- c("gweal", "gwnfa", "gwhou", "gwdwe", "gwlan", "gwbus", "gwagr", "gwnat", "gwodk", "gwfin", "gwfiw", 
                "gwcud", "gwbol", "gwequ", "gweqi", "gwoff", "gwpen", "gwdeb", "gwdec", "gwfie")

# Aggregates for wealth
wealth_macro <- c(wealth_nat_eco, wealth_hh_NPISH_combined, wealth_hh, wealth_NPISH, wealth_corp, wealth_gov)

}
if (DINA_wealth) {
# ---- Wealth Distribution -----

dibn_wealth <- c("hweal", "hwnfa", "hwhou", "hwdwe", "hwlan", "hwbus", "hwagr", "hwodk", "hwfin", "hwfiw", 
                 "hwcud", "hwbol", "hwequ", "hweqi", "hwpen", "hwdeb", "hwfie")
# source the percentiles requested 
source(file.path(setup_scripts,"percentiles.R"))
} 

if (population_series) { 
# ---- Population ----

population <- c("popul", "popem", "taxto", "taxma", "taxad", "taxre")
} 
if (ratios_and_shares){
# ---- Wealth/Income ratio and labor/capital shares ----

ratios <- c("ylsgdp", "ylsndp", "ycsgdp", "ycsndp", "wlsgni", "wlsnni", "wcsgni", "wcsnni", "ylscgv", "ylscnv", "ycscgv", "ycscnv")
} 
if (carbon_series) {
# ---- Carbon Emissions ----

nat_territorial_carbon_emissions <- c("ntghg", "ntcar", "ntgho", "hfghd", "ntgna", "ntcna", "ntona")
nat_exported_carbon_emissions <- c("neghg", "necar", "negho")
nat_net_imports_carbon_emissions <- c("nnghg", "nncar", "nngho")
nat_carbon_footprint <- c("nfghg", "nfcar", "nfgho", "hfghg", "hfghd", "hfghn", "hfcar", "hfgho", "gfghg", "gfcar", 
                          "gfgho", "ifghg", "ifcar", "ifgho", "ofghg", "ofcar", "ofgho")
dibn_carbon <- c("ptghg", "ptcar", "ptgho", "pfghg", "pfcar", "pfgho")
# Aggregates for Carbon
carbon <- c(nat_territorial_carbon_emissions, nat_exported_carbon_emissions, nat_net_imports_carbon_emissions, 
            nat_carbon_footprint, dibn_carbon)
# source the percentiles requested 
source(file.path(setup_scripts,"percentiles.R"))
}


#----- All Series -----

if (all_data) {
# Aggregates for all series
full_series <- c(income_macro, income_distr, population, wealth_macro, dibn_wealth, carbon)
}