** DEFINE REQUESTED INDICATORS IN WID *

if "${all_data}" == "YES" {
	
	global macro_income = "YES" 
    global DINA_income = "YES" 
    global macro_wealth = "YES" 
    global DINA_wealth = "YES" 
    global price_indexes = "YES" 
    global population_series = "YES" 
    global ratios_and_shares = "YES" 
    global carbon_series = "YES" 
}

**# Indexes and MER - always defined!
global index_mer "inyixx xlcusp xlceup xlcyup xlcusx xlceux xlcyux xrerus xrereu xreryu intlcu"


if "${macro_income}" == "YES"  {
**# Income Macro
global gdp_nni "nninc ndpro gdpro confc nnfin"
global foreign_income_paid_received "nnfin finrx flcir comrx pinrx fdirx ptfrx ptdrx pterx ptrrx ptfrr fsubx fpsub fosub finpx flcip compx pinpx fdipx ptfpx ptdpx ptepx ptfrp ftaxx fptax fotax"

global foreign_income_labor_capital "nnfin flcin pinnx fdinx ptfnx ptdnx ptenx ptfrn ptrrx comnx taxnx prtxn optxn"

global foreign_wealth "nwnxa fdixn fdixa fdixd ptfxn ptfxa ptexa ptdxa ptrxa ptfxd ptexd ptdxd"

global primary_income "nninc prigo prihn priho prinp prico prinf prifc"
global secondary_income "nninc secgo sechn secho secnp secco secnf secfc"
global property_income "pinnx prphn prpco prpgo"
global direct_taxes "taxgo tiwhn taxco"
global ss_contributions "sschn sscgo sscco"
global ss_benefits "ssbhn ssbgo ssbco"
global net_savings "savin savhn savho savnp savco secnf secfc savgo"
global gross_savings "savig saghn sagho sagnp sagco segnf segfc saggo"
global net_gross_variables "confc cfchn cfcho cfcnp cfcco cfcnf cfcfc cfcgo savin savig"

 global labor_of_capital_income "nninc comhn fkpin prphn prpgo nsrhn prico nmxho ptxgo wlabsh wcapsh"

global labor_of_capital_income "nninc comhn fkpin prphn prpgo nsrhn prico nmxho ptxgo"

global net_primconsum_fixcap "prihn comhn prphn nsmhn nsrhn nmxhn"
global gross_primaconsum_fixcap "prghn comhn prphn gsmhn gsrhn gmxhn"
global net_secconsum_fixcap "sechn prihn taxhn sschn tiwhn ssbhn"
global gross_secconsum_fixed_capital "seghn prghn taxhn sschn tiwhn ssbhn"
global net_consumption_fixed_apital "savhn sechn conhn"
global gross_consumption_fixed_apital "saghn seghn conhn"
global relation_net_gross_variables "prghn prihn cfchn seghn sechn saghn savhn gsmhn nsmhn gsrhn nsrhn ccshn gmxhn nmxhn ccmhn"

global prim_inc_hh_net_consumption "priho comho prpho nsmho nsrho nmxho"
global prim_inc_hh_gross_consumption "prgho comho prpho gsmho gsrho gmxho"
global secon_inc_hh_net_consumption "secho priho taxho sscho tiwho ssbho"
global secon_inc_hh_gross_consumption "segho prgho taxho sscho tiwho ssbho"
global savings_hh_net_consumption "savho secho conho"
global savings_hh_gross_consumption "sagho segho conho"
global relation_hh_net_gross_variables "prgho priho cfcho segho secho sagho savho gsmho nsmho gsrho nsrho ccsho gmxho nmxho ccmho"

global net_pinc_NPISH "prinp comnp prpnp nsrnp"
global gross_pinc_NPISH "prgnp comnp prpnp gsrnp"
global net_sinc_NPISH "secnp prinp taxnp sscnp tiwnp ssbnp"
global gross_sinc_NPISH "segnp prgnp taxnp sscnp tiwnp ssbnp"
global net_cons_sav_NPISH "savnp secnp connp"
global gross_cons_sav_NPISH "sagnp segnp connp"
global relation_NPISH_netgross_vars "prgnp prinp cfcnp segnp secnp sagnp savnp gsrnp nsrnp"

global net_pinc_corp "prico prpco nsrco"
global gross_pinc_corp "prgco prpco gsrco"
global net_sinc_corp "secco prico taxco sscco ssbco"
global gross_sinc_corp "segco prgco taxco sscco ssbco"
global relation_corp_netgross_vars "prgco prico cfcco segco secco"
global net_pinc_nonfincorp "prinf prpnf nsrnf"
global gross_pinc_nonfincorp "prgnf prpnf gsrnf"
global net_sinc_nonfincorp "secnf prinf taxnf sscnf ssbnf"
global gross_sinc_nonfincorp "segnf prgnf taxnf sscnf ssbnf"
global relat_nonfincorp_netgross_vars "prgnf prinf cfcnf segnf secnf"
global net_pinc_fincorp "prifc prpfc nsrfc"
global gross_pinc_fincorp "prgfc prpfc gsrfc"
global net_sinc_fincorp "secfc prifc taxfc sscfc ssbfc"
global gross_sinc_fincorp "segfc prgfc taxfc sscfc ssbfc"
global relation_fincorp_netgross_vars "prgfc prifc cfcfc segfc secfc"
global net_pinc_gov "prigo ptxgo tpigo tprgo otpgp spigo sprgo ospgo prpgo nsrgo"
global gross_pinc_gov "prggo ptxgo tpigo tprgo otpgp spigo sprgo ospgo prpgo gsrgo"

global net_sinc_gov "secgo prigo taxgo tiwgo sscgo ssbgo"
global gross_sinc_gov "seggo prggo taxgo tiwgo sscgo ssbgo"
global net_cons_sav_gov "savgo secgo congo indgo colgo"
global gross_cons_sav_gov "saggo seggo congo indgo colgo"
global gov_spending_by_function "congo gpsgo defgo polgo ecogo envgo hougo heago recgo edugo sopgo othgo"

global gov_expenditure_by_function "expgo gpsge defge polge ecoge envge houge heage recge eduge edpge edsge edtge sopge spige sacge sakge"

global gov_revenue "revgo pitgr citgr scogr pwtgr intgr ottgr ntrgr retgo psugo ssugo inpgo"

global current_account "ncanx pinnx pinrx pinpx comnx comrx compx tbnnx tbxrx tbmpx taxnx fsubx ftaxx scinx scirx scipx"

global trade_balance "tbnnx tgnnx tgxrx tgmpx tsnnx tsxrx tsmpx"
global trade_balance_services "tsnnx tsvnx tsvrx tsvpx tstnx tstrx tstpx tsonx tsorx tsopx"

global capital_account "fkanx fkarx fkapx"
global net_foreig_transfers "scinx scrnx scrrx scrpx scgnx scgrx scgpx sconx scorx scopx"

global income_macro "$gdp_nni $foreign_income_paid_received $foreign_income_labor_capital $foreign_wealth $primary_income $secondary_income $property_income $direct_taxes $ss_contributions $ss_benefits $net_savings $gross_savings $net_gross_variables $labor_of_capital_income $net_primconsum_fixcap $gross_primaconsum_fixcap $net_secconsum_fixcap $gross_secconsum_fixed_capital $net_consumption_fixed_apital $gross_consumption_fixed_apital $relation_net_gross_variables $prim_inc_hh_net_consumption $prim_inc_hh_gross_consumption $secon_inc_hh_net_consumption $secon_inc_hh_gross_consumption $savings_hh_net_consumption $savings_hh_gross_consumption $relation_hh_net_gross_variables $net_pinc_NPISH $gross_pinc_NPISH $net_sinc_NPISH $gross_sinc_NPISH $net_cons_sav_NPISH $gross_cons_sav_NPISH $relation_NPISH_netgross_vars $net_pinc_corp $gross_pinc_corp $net_sinc_corp $gross_sinc_corp $relation_corp_netgross_vars $net_pinc_nonfincorp $gross_pinc_nonfincorp $net_sinc_nonfincorp $gross_sinc_nonfincorp $relat_nonfincorp_netgross_vars $net_pinc_fincorp $gross_pinc_fincorp $net_sinc_fincorp $gross_sinc_fincorp $relation_fincorp_netgross_vars $net_pinc_gov $gross_pinc_gov $net_sinc_gov $gross_sinc_gov $net_cons_sav_gov $gross_cons_sav_gov $gov_spending_by_function $gov_expenditure_by_function $gov_revenue $current_account $trade_balance $trade_balance_services $capital_account $net_foreig_transfers"
 
 }

if "${DINA_income}" == "YES" {
**# DINA Distributions INCOME:
global fiscal_income "fiinc filin fiwag fimil ficap firen fiint fidiv fikgi fimik fimix"
global pretax_income "ptinc ptlin ptkin pllin pkkin"
global posttax_income "diinc cainc"
global factor_income "fainc flinc"	

global income_distr "$fiscal_income $pretax_income $posttax_income $factor_income"

}

if "${macro_wealth}" == "YES" {
**# Wealth Macro
global wealth_nat_eco "nweal nwnfa nwhou nwdwe nwlan nwbus nwagr nwnat nwodk nwnxa nwgxa nwgxd nwboo cwres nwdka"
global wealth_hh_NPISH_combined "pweal pwnfa pwhou pwdwe pwlan pwbus pwagr pwnat pwodk pwfin pwfiw pwcud pwbol pwequ pweqi pwoff pwpen pwdeb pwfie"
global wealth_hh "hweal hwnfa hwhou hwdwe hwlan hwbus hwagr hwnat hwodk hwfin hwfiw hwcud hwbol hwequ hweqi hwoff hwpen hwdeb hwfie"
global wealth_NPISH "iweal iwnfa iwhou iwdwe iwlan iwbus iwagr iwnat iwodk iwfin iwfiw iwcud iwbol iwequ iweqi iwoff iwpen iwdeb iwfie"
global wealth_corp "cwboo cwnfa cwhou cwdwe cwlan cwbus cwagr cwnat cwodk cwfin cwfiw cwcud cwbol cwequ cweqi cwoff cwpen cwdeb cwdeq cwres cwfie"
global wealth_gov "gweal gwnfa gwhou gwdwe gwlan gwbus gwagr gwnat gwodk gwfin gwfiw gwcud gwbol gwequ gweqi gwoff gwpen gwdeb gwdec gwfie"

global wealth_macro "$wealth_nat_eco $wealth_hh_NPISH_combined $wealth_hh $wealth_NPISH $wealth_corp $wealth_gov"

}

if "${DINA_wealth}" == "YES" {
**# Wealth Distribution
global dibn_wealth "hweal hwnfa hwhou hwdwe hwlan hwbus hwagr hwnat hwodk hwfin hwfiw hwcud hwbol hwequ hweqi hwoff hwpen hwdeb hwfie"

}


if "${population_series}"== "YES" {
	**# Population
global population "popul popem taxto taxma taxad taxre"
}

if "${ratios_and_shares}"== "YES" {
	**# Wealth/Income
global ratios "ylsgdp ylsndp ycsgdp ycsndp wlsgni wlsnni wcsgni wcsnni ylscgv ylscnv ycscgv ycscnv"
}


if "${carbon_series}" == "YES"{
**# Carbon
global nat_territorial_carbon_emissions "ntghg ntcar ntgho hfghd ntgna ntcna ntona"
global nat_exported_carbon_emissions "neghg necar negho"
global nat_net_imports_carbon_emissions "nnghg nncar nngho"
global nat_carbon_footprint "nfghg nfcar nfgho hfghg hfghd hfghn hfcar hfgho gfghg gfcar gfgho ifghg ifcar ifgho ofghg ofcar ofgho"
global dibn_carbon "ptghg ptcar ptgho pfghg pfcar pfgho"

global carbon "$nat_territorial_carbon_emissions $nat_exported_carbon_emissions $nat_net_imports_carbon_emissions $nat_carbon_footprint $dibn_carbon"

}


**# all series: 
if "${all_data}" == "YES"{
	global full_series "$income_macro $income_distr $wealth_macro $dibn_wealth $carbon"
}









