******************************* TERRITORIES AND CORE COUNTRIES ******************

* Core Countries
if "$main_corecountries" == "YES" {
    global path "$WID_Extract/Core Countries"
    global countries "AD AE AF AG AI AL AM AO AR AT AU AW AZ BA BB BD BE BF BG BH BI BJ BM BN BO BQ BR BS BT BW BY BZ CA CD CF CG CH CI CL CM CN CO CR CU CV CW CY CZ DE DJ DK DM DO DZ EC EE EG ER ES ET FI FJ FM FR GA GB GD GE GG GH GI GL GM GN GQ GR GT GW GY HK HN HR HT HU ID IE IL IM IN IQ IR IS IT JE JM JO JP KE KG KH KI KM KN KP KR KS KW KY KZ LA LB LC LI LK LR LS LT LU LV LY MA MC MD ME MG MH MK ML MM MN MO MR MS MT MU MV MW MX MY MZ NA NC NE NG NI NL NO NP NR NZ OM PA PE PF PG PH PK PL PR PS PT PW PY QA RO RS RU RW SA SB SC SD SE SG SI SK SL SM SN SO SR SS ST SV SX SY SZ TC TD TG TH TJ TL TM TN TO TR TT TV TW TZ UA UG US UY UZ VC VE VG VN VU WS YE ZA ZM ZW"
}

* Core Territories
if "$main_coreterritories" == "YES" {
    global path "$WID_Extract/Core Territories"
    global countries "RU OA CN JP OB DE ES FR GB IT SE OC QM AR BR CL CO MX OD DZ EG TR OE CA US AU NZ OH IN ID OI ZA OJ"
}

* Sub-Countries
if "$main_subcountries" == "YES" {
    global path "$WID_Extract/Sub-Country Regions"
    global countries "CN_RU CN_UR DE_BD DE_BY DE_HB DE_HE DE_HH DE_PR DE_SN DE_WU US_AK US_AL US_AR US_AZ US_CA US_CO US_CT US_DC US_DE US_FL US_GA US_HI US_IA US_ID US_IL US_IN US_KS US_KY US_LA US_MA US_MD US_ME US_MI US_MN US_MO US_MS US_MT US_NC US_ND US_NE US_NH US_NJ US_NM US_NV US_NY US_OH US_OK US_OR US_PA US_RI US_SC US_SD US_TN US_TX US_UT US_VA US_VT US_WA US_WI US_WV US_WY"
}

* historical regions
if "$main_historicalregions" == "YES" {
    global path "$WID_Extract/Historical Regions"
    global countries "CS DD SU YU ZZ"
}

* Oil Countries
if "$main_oilcountries" == "YES" {
    global path "$WID_Extract/Oil Countries"
    global countries "AE BH IQ IR KW OM QA SA YE"
}

*********************************** WID REGIONS ********************************

* North America & Oceania
if "$coord_naoc" == "YES" {
    global path "$WID_Extract/North America & Oceania"
    global countries "US AU CA NZ QF QG QP QQ XB OH QF_MER QG_MER QP_MER QQ_MER XB_MER OH_MER"
}

* MENA
if "$coord_mena" == "YES" {
    global path "$WID_Extract/Middle East & North Africa"
    global countries "AE BH DZ EG IL IQ IR JO KW LY LB MA OM PS QA SA SY TN TR YE QO XM XN OE QO_MER XM_MER XN_MER OE_MER"
}

* LATAM
if "$coord_latam" == "YES" {
    global path "$WID_Extract/Latin America"
    global countries "AR BO BR BS BZ CL CO CR CU DO EC GT GY HN HT JM MX NI PA PE PY SR SV TT UY VE QH QI QR XL OD QH_MER QI_MER QR_MER XL_MER OD_MER"
}

* Europe
if "$coord_europe" == "YES" {
    global path "$WID_Extract/Europe"
    global countries "AL AT BA BE BG CH CY CZ DD DE DK EE ES FI FR GB GR HR HU IE IS IT KS LT LU LV MD ME MK MT NL NO PL PT RO RS SE SI SK QE QM QX QY QC QE_MER QM_MER QX_MER QY_MER QC_MER"
}

* Russia & Central Asia
if "$coord_ruca" == "YES" {
    global path "$WID_Extract/Russia & Central Asia"
    global countries "AM AZ BY GE KG KZ RU TJ TM UA UZ QJ OA QJ_MER QW_MER XR_MER OA_MER"
}

* Sub-Saharan Africa
if "$coord_ssaf" == "YES" {
    global path "$WID_Extract/Sub-Saharan Africa"
    global countries "AO BF BI BJ BW CD CF CG CI CM CV DJ ER ET GA GH GM GN GQ GW KE KM LR LS MG ML MR MU MW MZ NA NE NG RW SC SD SL SN SO SS ST SZ TD TG TZ UG ZA ZM ZW QB_MER QK_MER QN_MER QT_MER QV_MER XF_MER OJ_MER QB QK QN QT QV XF OJ"
}

* East Asia
if "$coord_ea" == "YES" {
    global path "$WID_Extract/East Asia"
    global countries "CN HK JP KP KR MN MO TW"
}

* South & South-East Asia
if "$coord_ssa" == "YES" {
    global path "$WID_Extract/South & South-East Asia"
    global countries "AF BD BN BT ID IN KH LA LK MM MV MY NP PG PH PK SG TH TL VN"
}

****************************** WID SUB-REGIONS *********************************

* Western Europe
if "$coord_we" == "YES" {
    global path "$WID_Extract/Western Europe"
    global countries "AT BE FR DE IE IT LU NL GB CH DD PT ES IT GR MT CY SE NO FI DK IS"
}

* Eastern Europe
if "$coord_ee" == "YES" {
    global path "$WID_Extract/Eastern Europe"
    global countries "AL BA BG CY CZ EE HR HU KS LT LV MD ME MK PL RO RS SI SK"
}

* South America
if "$coord_sa" == "YES" {
    global path "$WID_Extract/South America"
    global countries "AR BO BR CL CO EC FK GY PE PY SR UY VE"
}

* Central America & Caribbean
if "$coord_cac" == "YES" {
    global path "$WID_Extract/Central America & Caribbean"
    global countries "AG AI AN AW BB BS CU CW DM DO GD HT JM KN KY LC MS PR SX TC TT VC VG VI BZ CR GT HN MX NI PA SV"
}

* West & Central Africa
if "$coord_wca" == "YES" {
    global path "$WID_Extract/West & Central Africa"
    global countries "BF BJ CI CV GH GM GN GW LR ML MR NE NG SH SL SN TG AO CD CF CG CM GA GQ ST TD"
}

* East and South Africa
if "$coord_esa" == "YES" {
    global path "$WID_Extract/East & Southern Africa"
    global countries "BI DJ ER ET KE KM MG MU MW MZ RW SC SO TZ UG ZM ZW ZZ BW LS NA SZ ZA"
}

********************************** WORLD ***************************************

* Entire WID database
if "$full_world" == "YES" {
    global path "$WID_Extract/Entire World"
    global countries "AD AE AF AG AI AL AM AO AR AT AU AW AZ BA BB BD BE BF BG BH BI BJ BM BN BO BQ BR BS BT BW BY BZ CA CD CF CG CH CI CL CM CN CO CR CU CV CW CY CZ DE DJ DK DM DO DZ EC EE EG ER ES ET FI FJ FM FR GA GB GD GE GG GH GI GL GM GN GQ GR GT GW GY HK HN HR HT HU ID IE IL IM IN IQ IR IS IT JE JM JO JP KE KG KH KI KM KN KP KR KS KW KY KZ LA LB LC LI LK LR LS LT LU LV LY MA MC MD ME MG MH MK ML MM MN MO MR MS MT MU MV MW MX MY MZ NA NC NE NG NI NL NO NP NR NZ OM PA PE PF PG PH PK PL PR PS PT PW PY QA RO RS RU RW SA SB SC SD SE SG SI SK SL SM SN SO SR SS ST SV SX SY SZ TC TD TG TH TJ TL TM TN TO TR TT TV TW TZ UA UG US UY UZ VC VE VG VN VU WS YE ZA ZM ZW CN_RU CN_UR DE_BD DE_BY DE_HB DE_HE DE_HH DE_PR DE_SN DE_WU US_AK US_AL US_AR US_AZ US_CA US_CO US_CT US_DC US_DE US_FL US_GA US_HI US_IA US_ID US_IL US_IN US_KS US_KY US_LA US_MA US_MD US_ME US_MI US_MN US_MO US_MS US_MT US_NC US_ND US_NE US_NH US_NJ US_NM US_NV US_NY US_OH US_OK US_OR US_PA US_RI US_SC US_SD US_TN US_TX US_UT US_VA US_VT US_WA US_WI US_WV US_WY QB QC QD QE QF QG QH QI QJ QK QL QM QN QO QP QQ QR QS QT QU QV QW QX QY WO XA XB XF XL XM XN XR XS OA OB OC OD OE OH OI OJ QB_MER QC_MER QD_MER QE_MER QF_MER QG_MER QH_MER QI_MER QJ_MER QK_MER QL_MER QM_MER QN_MER QO_MER QP_MER QQ_MER QR_MER QS_MER QT_MER QU_MER QV_MER QW_MER QX_MER QY_MER WO_MER XA_MER XB_MER XF_MER XL_MER XM_MER XN_MER XR_MER XS_MER OA_MER OB_MER OC_MER OD_MER OE_MER OH_MER OI_MER OJ_MER CS DD SU YU ZZ"
}

* world aggregates
if "$world_avg" == "YES" {
    global path "$WID_Extract/World Average"
    global countries "WO"
}
