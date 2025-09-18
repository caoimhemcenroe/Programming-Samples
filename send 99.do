clear all
*set working directory 
cd "/Users/caoimhemcenroe/Desktop/CES"
 // cd  "/Users/vita/Dropbox/EU_Expectations/Data/"

*load Official_statistics_to_match_ECB_CES.xlsx in Stata.
import excel "Official_statistics_to_match_ECB_CES.xlsx", sheet("Sheet1") cellrange(A1:FK57) firstrow clear

*reshape it from wide to long format so that country names are in rows rather than columns (see Stata help *reshape). Save this file in Stata format as Official_statistics_to_match_ECB_CES.dta.
reshape long cpi_past12m_actual hcip_next12m_forecast cpi_next12m_actual hcip_next36m_forecast cpi_next36m_actual unrate_current_actual unrate_12m_actual unrate_12m_forecast imortg_12m_actual		imortg_12m_forecast hcip_past12m_actual	hcip_next12_actual hcip_next36_actual unrate_12m_actual_adj unrate_current_actual_adj, i(year month) j(a0020) string


save "Official_statistics_to_match_ECB_CES.dta" ,replace


*load ecb.CES_data_all_monthly_label.dta in Stata and merge it with the Official_statistics_to_match_ECB_CES.dta 

use "ecb.CES_data_all_monthly_label.dta", clear

capture drop _merge 

* Perform the m:1 merge
merge m:1 year month a0020 using "Official_statistics_to_match_ECB_CES.dta"


* Inspect the merge results
tabulate _merge

save "ecb.CES_data_all_monthly_and_official_stat.dta", replace


*rename variables

rename a0010 id

rename a0020 country

rename a0030 survey_round

rename a1010_age_rec age

rename b7040_quintile disposable_income

rename c1010 prices_past_qual

rename c1020 prices_past_open

rename c1110 prices_next12_qual

rename c1120 prices_next12_open

rename c1150_1 prices_next12_increase_8_100_d

rename c1150_2 prices_next12_increase_4_8_d

rename c1150_3 prices_next12_increase_2_4_d

rename c1150_4 prices_next12_increase_0_2_d

rename c1150_5 prices_next12_decrease_0_2_d

rename c1150_6 prices_next12_decrease_2_4_d

rename c1150_7 prices_next12_decrease_4_8_d

rename c1150_8 prices_next12_decrease_8_d

rename c2110 hprice_next12_qual

rename c2120 hprice_next12_open

rename c2150_1 hprices_next12_increase_8_100_d

rename c2150_2 hprices_next12_increase_4_8_d

rename c2150_3 hprices_next12_increase_2_4_d

rename c2150_4 hprices_next12_increase_0_2_d

rename c2150_5 hprices_next12_decrease_0_2_d

rename c2150_6 hprices_next12_decrease_2_4_d

rename c2150_7 hprices_next12_decrease_4_8_d

rename c2150_8 hprices_next12_decrease_8_100_d

rename c1152_1 prices_next12_increase_12_100

rename c1152_2 prices_next12_increase_8_12

rename c1152_3 prices_next12_increase_4_8

rename c1152_4 prices_next12_increase_2_4

rename c1152_5 prices_next12_increase_0_2

rename c1152_6 prices_next12_decrease_0_2

rename c1152_7 prices_next12_decrease_2_4

rename c1152_8 prices_next12_decrease_4_8

rename c1152_9 prices_next12_decrease_8_12

rename c1152_10 prices_next12_decrease_12_100

rename c2151_1 hprices_next12_increase_12_100

rename c2151_2 hprices_next12_increase_8_12

rename c2151_3 hprices_next12_increase_4_8

rename c2151_4 hprices_next12_increase_2_4

rename c2151_5 hprices_next12_increase_0_2

rename c2151_6 hprices_next12_decrease_0_2

rename c2151_7 hprices_next12_decrease_2_4

rename c2151_8 hprices_next12_decrease_4_8

rename c2151_9 hprices_next12_decrease_8_12

rename c2151_10 hprices_next12_decrease_12_100

rename c3210 income_next12_qual

rename c3220 income_next12_open

rename c3250_1 income_next12_increase_8_100_d

rename c3250_2 income_next12_increase_4_8_d

rename c3250_3 income_next12_increase_2_4_d

rename c3250_4 income_next12_increase_0_2_d

rename c3250_5 income_next12_decrease_0_2_d

rename c3250_6 income_next12_decrease_2_4_d

rename c3250_7 income_next12_decrease_4_8_d

rename c3250_8 income_next12_decrease_8_100_d

rename c3251_1 income_next12_increase_12_100

rename c3251_2 income_next12_increase_8_12

rename c3251_3 income_next12_increase_4_8

rename c3251_4 income_next12_increase_2_4

rename c3251_5 income_next12_increase_0_2

rename c3251_6 income_next12_decrease_0_2 

rename c3251_7 income_next12_decrease_2_4

rename c3251_8 income_next12_decrease_4_8

rename c3251_9 income_next12_decrease_8_12

rename c3251_10 income_next12_decrease_12_100

rename c1210 prices_next36_qual

rename c1220 prices_next36_open

rename c4010 econ_next12_qual

rename c4020 econ_next12_open

rename c4030 unrate_cur_open

rename c4031 unrate_next12_open

rename c5111 imortg_next12_open_d

rename c5113 imortg_next12_open

rename c6010 hspend_past_qual

rename c6020 hspend_past_open

rename c6030 hspend_past_brack

rename c6110 hspend_next12_qual

rename c6120 hspend_next12_open

rename c6130  hspend_next12_brack

rename c7110 credit_past

rename credit_past credit_past_d

rename c7111 credit_past

rename c7120 credit_next12_d

rename c7121 credit_next12

rename unrate_current_actual unrate_cur_actual

rename unrate_12m_actual unrate_next12_actual

rename cpi_past12m_actual cpi_past12_actual

rename hcip_next12m_forecast hcip_next12_forecast

rename cpi_next12m_actual cpi_next12_actual

rename hcip_next36m_forecast hcip_next36_forecast

rename cpi_next36m_actual cpi_next36_actual

rename unrate_12m_forecast unrate_next12_forecast

rename imortg_12m_actual imortg_next12_actual

rename imortg_12m_forecast imortg_next12_forecast

rename hcip_past12m_actual hcip_past12_actual

rename unrate_12m_actual_adj unrate_next12_actual_adj

rename unrate_current_actual_adj unrate_cur_actual_adj

**calculate expectation errors, usinsg the open ended variables as they are most comparable 
*individual forecasts vs realised values

*past prices: cpi//hcip_past12m_actual vs prices_past_open

gen cpi_past12_dif = cpi_past12_actual - prices_past_open
gen hcip_past12_dif = hcip_past12_actual - prices_past_open

gen cpi_next12_dif = cpi_next12_actual - prices_next12_open
gen hcip_next12_dif = hcip_next12_actual - prices_next12_open

gen cpi_next36_dif = cpi_next36_actual - prices_next36_open
gen hcip_next36_dif = hcip_next36_actual - prices_next36_open

gen unrate_cur_dif = unrate_cur_actual - unrate_cur_open
gen unrate_cur_adj_dif = unrate_cur_actual_adj - unrate_cur_open

gen unrate_next12_dif = unrate_next12_actual - unrate_next12_open
gen unrate_next12_adj_dif = unrate_next12_actual_adj - unrate_next12_open

gen imortg_next12_dif = imortg_next12_actual - imortg_next12_open

*individual forecast vs official forecasts

gen hcip_next12_f_dif = hcip_next12_forecast - prices_next12_open
gen hcip_next36_f_dif = hcip_next36_forecast - prices_next36_open
gen unrate_next12_f_dif = unrate_next12_forecast - unrate_next12_open

//egen mean_cpi_past12_dif = mean(cpi_past12_dif), by(country)
//egen mean_hcip_past12_dif = mean(hcip_past12_dif),  by(country)
//egen mean_cpi_next12_dif = mean(cpi_next12_dif), by(country)
//egen mean_hcip_next12_dif = mean(hcip_next12_dif), by(country)
//egen mean_cpi_next36_dif = mean(cpi_next36_dif), by(country)
//egen mean_hcip_next36_dif = mean(hcip_next36_dif), by(country)
//egen mean_unrate_cur_dif = mean(unrate_cur_dif),  by(country)
//egen mean_unrate_next12_dif = mean(unrate_next12_dif), by(country)
//egen mean_imortg_next12_dif = mean(imortg_next12_dif), by(country)

save "ecb.CES_data_all_monthly_and_official_stat_diff.dta", replace

** aggregate data on country-year-month level
use "ecb.CES_data_all_monthly_and_official_stat_diff.dta", clear

collapse  (mean) cpi_past12_actual     hcip_past12_actual     cpi_next12_actual hcip_next12_actual cpi_next36_actual hcip_next36_actual unrate_cur_actual unrate_next12_actual imortg_next12_actual hcip_next12_forecast hcip_next36_forecast unrate_next12_forecast unrate_next12_actual_adj unrate_cur_actual_adj ///
prices_past_open prices_next12_open  prices_next36_open  unrate_cur_open unrate_next12_open imortg_next12_open   ///
cpi_past12_dif hcip_past12_dif cpi_next12_dif hcip_next12_dif cpi_next36_dif hcip_next36_dif unrate_cur_dif unrate_next12_dif imortg_next12_dif hcip_next12_f_dif hcip_next36_f_dif unrate_next12_f_dif unrate_cur_adj_dif unrate_next12_adj_dif, by(country year month)

*vreate date variable 
gen mdate = ym(year, month)
format mdate %tm
//list mdate

* specify panel 
encode country, gen(country_num)
xtset country_num mdate

replace country = "Austria" if country == "AT"
replace country = "Belgium" if country == "BE"
replace country = "Germany" if country == "DE"
replace country = "Greece" if country == "EL"
replace country = "Spain" if country == "ES"
replace country = "Finland" if country == "FI"
replace country = "France" if country == "FR"
replace country = "Ireland" if country == "IE"
replace country = "Italy" if country == "IT"
replace country = "Netherlands" if country == "NL"
replace country = "Portugal" if country == "PT"


levelsof country, local(countries)

// Initialize an empty local macro to store graph names FOR CPI PAST 12
local graph_names
foreach country in `countries' {
capture erase cpi_past12_`country'.gph
qui graph twoway  (connected prices_past_open mdate if country=="`country'", lcolor(green) lpattern(dash) mcolor(green) msymbol(p)) ///
		              (connected cpi_past12_actual mdate if country=="`country'", lcolor(blue) lpattern(dot) mcolor(blue) msymbol(p)) ///
					  (connected cpi_past12_dif mdate if country=="`country'", lcolor(red)  lpattern(solid)  mcolor(red) lwidth(0.7) msymbol(p)), ///
					  yline(0, lpattern(solid) lcolor(black) lwidth(1)) ///
					  title("`country'") ///
					  ytitle("% change")  xtitle("Time") ///
					  legend( lab(1 "Perceived CPI in past 12m")  lab(2 "Actual CPI in past 12m") lab(3 "Difference")  region(lcolor(white))  rows(3))   ///
					graphregion(color(white))  ///
					saving(cpi_past12_`country') 
	// Save each graph as a PNG file with a unique name
    graph export "cpipast12_`country'.png", as(png) replace
	
     // Append the current graph name to the list of graph names
    local graph_names `graph_names' cpi_past12_`country'.gph
}

// Combine the graphs using grc1leg
grc1leg `graph_names', cols(4) name(combined_graph_cpipast12, replace) title("CPI - past 12 months") note("The relative change in CPI from 12 months previously. Data Source: Multiple")
graph export "combined_graph_cpipast12.png", name (combined_graph_cpipast12) replace

**************
levelsof country, local(countries)

// Initialize an empty local macro to store graph names FOR HCIP PAST 12
local graph_names
foreach country in `countries' {
capture erase hcip_past12_`country'.gph
qui graph twoway  (connected prices_past_open mdate if country=="`country'", lcolor(green) lpattern(dash) mcolor(green) msymbol(p)) ///"
		              (connected hcip_past12_actual mdate if country=="`country'", lcolor(blue) lpattern(dot) mcolor(blue) msymbol(p)) ///
					  (connected hcip_past12_dif mdate if country=="`country'", lcolor(red)  lpattern(solid)  mcolor(red) lwidth(0.7) msymbol(p)), ///
					  yline(0, lpattern(solid) lcolor(black) lwidth(1)) ///
					 			  title("`country'") ///
					  ytitle("% change ")  xtitle("Time") ///
					  legend( lab(1 "Perceived HCIP in past 12m")  lab(2 "Actual HCIP in past 12m") lab(3 "Difference")  region(lcolor(white))  rows(3))   ///
					graphregion(color(white))  ///
					saving(hcip_past12_`country') 
	// Save each graph as a PNG file with a unique name
    graph export "hcip_past12_`country'.png", as(png) replace
  // Append the current graph name to the list of graph names
    local graph_names `graph_names' hcip_past12_`country'.gph
}

// Combine the graphs using grc1leg
grc1leg `graph_names', cols(4) name(combined_graph_hcip_past12, replace) title("HCIP - past 12 months. ") note("Relative change in HCIP from 12 months previously. Data source: Eurostat")
graph export "combined_graph_hcip_past12.png", name (combined_graph_hcip_past12) replace
**************
// Initialize an empty local macro to store graph names FOR CPI NEXT 12
local graph_names
foreach country in `countries' {
capture erase cpi_next12_`country'.gph
qui graph twoway  (connected prices_next12_open mdate if country=="`country'", lcolor(green) lpattern(dash) mcolor(green) msymbol(p)) ///"
		              (connected cpi_next12_actual mdate if country=="`country'", lcolor(blue) lpattern(dot) mcolor(blue) msymbol(p)) ///
					  (connected cpi_next12_dif mdate if country=="`country'", lcolor(red)  lpattern(solid)  mcolor(red) lwidth(0.7) msymbol(p)), ///
					  yline(0, lpattern(solid) lcolor(black) lwidth(1)) ///
					 			  title("`country'") ///
					   ytitle("% change ")  xtitle("Time") ///
					  legend( lab(1 "Perceived CPI in next 12m")  lab(2 "Actual CPI in next 12m") lab(3 "Difference")  region(lcolor(white))  rows(3))   ///
					graphregion(color(white))  ///
					saving(cpi_next12_`country') 
	// Save each graph as a PNG file with a unique name
    graph export "cpinext12_`country'.png", as(png) replace
	
     // Append the current graph name to the list of graph names
    local graph_names `graph_names' cpi_next12_`country'.gph
   
}

// Combine the graphs using grc1leg
grc1leg  `graph_names', cols(4) name(combined_graph_cpi_next12, replace) title("CPI - next 12 months") note("The relative change in CPI in the next 12 months. Data Source: Multiple ")

graph export "combined_graph_cpi_next12.png", name (combined_graph_cpi_next12) replace

**************
// Initialize an empty local macro to store graph names FOR HCIP NEXT 12
 
local graph_names

foreach country in `countries' {


// Counter for naming the graphs

capture erase hcip_next12_`country'.gph
qui graph twoway  (connected  prices_next12_open mdate if country=="`country'", lcolor(green) lpattern(dash) mcolor(green) msymbol(p)) ///"
		              (connected hcip_next12_actual mdate if country=="`country'", lcolor(blue) lpattern(dot) mcolor(blue) msymbol(p)) ///
					  (connected hcip_next12_dif mdate if country=="`country'", lcolor(red)  lpattern(solid)  mcolor(red) lwidth(0.7) msymbol(p)), ///
					  yline(0, lpattern(solid) lcolor(black) lwidth(1)) ///
					  title("`country'") ///
					  ytitle("% change ")  xtitle("Time") ///
					  legend( lab(1 "Perceived HCIP in next 12 months")  lab(2 "Actual HCIP in next 12m") lab(3 "Difference")  region(lcolor(white))  rows(3))   ///
					graphregion(color(white))  ///
					saving(hcip_next12_`country') 
	// Save each graph as a PNG file with a unique name
    graph export "hcip_next12_`country'.png", as(png) replace
	
     // Append the current graph name to the list of graph names
    local graph_names `graph_names' hcip_next12_`country'.gph
   
}

// Combine the graphs using grc1leg
grc1leg  `graph_names', cols(4)  name(combined_graph_hcip_next12, replace) title("HCIP - next 12 months") note("The relative change in HCIP in the next 12 months. Data source: Eurostat ")

graph export "combined_graph_hcip_next12.png", name (combined_graph_hcip_next12) replace


**************
// Initialize an empty local macro to store graph names FOR CPI NEXT 36
 
local graph_names

foreach country in `countries' {


// Counter for naming the graphs

capture erase cpi_next36_`country'.gph
qui graph twoway  (connected prices_next36_open mdate if country=="`country'", lcolor(green) lpattern(dash) mcolor(green) msymbol(p)) ///"
		              (connected cpi_next36_actual mdate if country=="`country'", lcolor(blue) lpattern(dot) mcolor(blue) msymbol(p)) ///
					  (connected cpi_next36_dif mdate if country=="`country'", lcolor(red)  lpattern(solid)  mcolor(red) lwidth(0.7) msymbol(p)), ///
					  yline(0, lpattern(solid) lcolor(black) lwidth(1)) ///
					  title("`country'") ///
					  ytitle("% change ")  xtitle("Time") ///
					  legend( lab(1 "Perceived CPI in next 36m")  lab(2 "Actual CPI in next 36m") lab(3 "Difference")  region(lcolor(white))  rows(3))   ///
					graphregion(color(white))  ///
					saving(cpi_next36_`country') 
	// Save each graph as a PNG file with a unique name
    graph export "cpinext36_`country'.png", as(png) replace
	
     // Append the current graph name to the list of graph names
    local graph_names `graph_names' cpi_next36_`country'.gph
   
}

// Combine the graphs using grc1leg
grc1leg  `graph_names', cols(4)  name(combined_graph_cpinext36, replace) title("CPI - next 36 months") note("The relative change in CPI in the next 36 months. Data Source: Multiple")
graph export "combined_graph_cpinext36.png", name (combined_graph_cpinext36) replace
**************
// Initialize an empty local macro to store graph names FOR HCIP NEXT 36
 
local graph_names

foreach country in `countries' {


// Counter for naming the graphs

capture erase hcip_next36_`country'.gph
qui graph twoway  (connected prices_next36_open mdate if country=="`country'", lcolor(green) lpattern(dash) mcolor(green) msymbol(p)) ///"
		              (connected hcip_next36_actual mdate if country=="`country'", lcolor(blue) lpattern(dot) mcolor(blue) msymbol(p)) ///
					  (connected hcip_next36_dif mdate if country=="`country'", lcolor(red)  lpattern(solid)  mcolor(red) lwidth(0.7) msymbol(p)), ///
					  yline(0, lpattern(solid) lcolor(black) lwidth(1)) ///
					  title("`country'") ///
					  ytitle("% change ")  xtitle("Time") ///
					  legend( lab(1 "Perceived HCIP in next 36m")  lab(2 "Actual HCIP in next 36m") lab(3 "Difference")  region(lcolor(white))  rows(3))   ///
					graphregion(color(white))  ///
					saving(hcip_next36_`country') 
	// Save each graph as a PNG file with a unique name
    graph export "hcipnext36_`country'.png", as(png) replace
	
     // Append the current graph name to the list of graph names
    local graph_names `graph_names' hcip_next36_`country'.gph
   
}

// Combine the graphs using grc1leg
grc1leg  `graph_names', cols(4) name(combined_graph_hcipnext36, replace) title("HCIP - next 36 months") note("The relative change in HCIP in the next 36 months. Data Source: Eurostat")
graph export "combined_graph_hcipnext36.png", name (combined_graph_hcipnext36) replace

**************
// Initialize an empty local macro to store graph names FOR UNRATE CURRENT
 
local graph_names
foreach country in `countries' {
// Counter for naming the graphs
capture erase unrate_cur_`country'.gph
qui graph twoway  (connected unrate_cur_open mdate if country=="`country'", lcolor(green) lpattern(dash) mcolor(green) msymbol(p)) ///"
		              (connected unrate_cur_actual mdate if country=="`country'", lcolor(blue) lpattern(dot) mcolor(blue) msymbol(p)) ///
					  (connected unrate_cur_dif mdate if country=="`country'", lcolor(red)  lpattern(solid)  mcolor(red) lwidth(0.7) msymbol(p)), ///
					  yline(0, lpattern(solid) lcolor(black) lwidth(1)) ///
					  title("`country'") ///
					  ytitle("% change  ")  xtitle("Time") ///
					  legend( lab(1 "Perceived current Unemployment rate ")  lab(2 "Actual unemployment rate currently") lab(3 "Difference")  region(lcolor(white))  rows(3))   ///
					graphregion(color(white))  ///
					saving(unrate_cur_`country') 
	// Save each graph as a PNG file with a unique name
    graph export "unrate_cur_`country'.png", as(png) replace
	
     // Append the current graph name to the list of graph names
    local graph_names `graph_names' unrate_cur_`country'.gph   
}
// Combine the graphs using grc1leg
grc1leg  `graph_names', cols(4)  name(combined_graph_unrate_cur, replace) title("Unemployment Rate - Current") note("The relative change in unemployment in the next 36 months. Data Source: Multiple")
graph export "combined_graph_unrate_cur.png", name (combined_graph_unrate_cur) replace


**************
// Initialize an empty local macro to store graph names FOR UNRATE CURRENT ADJ
 
local graph_names

foreach country in `countries' {


// Counter for naming the graphs

capture erase unrate_cur_adj`country'.gph
qui graph twoway  (connected unrate_cur_open mdate if country=="`country'", lcolor(green) lpattern(dash) mcolor(green) msymbol(p)) ///"
		              (connected unrate_cur_actual_adj mdate if country=="`country'", lcolor(blue) lpattern(dot) mcolor(blue) msymbol(p)) ///
					  (connected unrate_cur_adj_dif mdate if country=="`country'", lcolor(red)  lpattern(solid)  mcolor(red) lwidth(0.7) msymbol(p)), ///
					  yline(0, lpattern(solid) lcolor(black) lwidth(1)) ///
					  title("`country'") ///
					  ytitle("% change  ")  xtitle("Time") ///
					  legend( lab(1 "Perceived current Unemployment rate ")  lab(2 "Actual adjusted unemployment rate ") lab(3 "Difference")  region(lcolor(white))  rows(3))   ///
					graphregion(color(white))  ///
					saving(unrate_cur_adj`country') 
	// Save each graph as a PNG file with a unique name
    graph export "unrate_cur_adj`country'.png", as(png) replace
	
     // Append the current graph name to the list of graph names
    local graph_names `graph_names' unrate_cur_adj`country'.gph
   
}
// Combine the graphs using grc1leg
grc1leg  `graph_names', cols(4)  name(combined_graph_unrate_cur_adj, replace) title("Adjusted unemployment - current") note("The relative change in unemployment rate calendar and seasonally adjusted in the next 36 months. Data Source: OECD")
graph export "combined_graph_unrate_cur_adj.png", name (combined_graph_unrate_cur_adj) replace

**************
// Initialize an empty local macro to store graph names FOR UNRATE next 12
 
local graph_names

foreach country in `countries' {


// Counter for naming the graphs

capture erase unrate_next12_`country'.gph
qui graph twoway  (connected unrate_next12_open mdate if country=="`country'", lcolor(green) lpattern(dash) mcolor(green) msymbol(p)) ///"
		              (connected unrate_next12_actual  mdate if country=="`country'", lcolor(blue) lpattern(dot) mcolor(blue) msymbol(p)) ///
					  (connected unrate_next12_dif mdate if country=="`country'", lcolor(red)  lpattern(solid)  mcolor(red) lwidth(0.7) msymbol(p)), ///
					  yline(0, lpattern(solid) lcolor(black) lwidth(1)) ///
					  title("`country'") ///
					  ytitle("% change  ")  xtitle("Time") ///
					  legend( lab(1 "Perceived next 12m  Unemployment rate ")  lab(2 "Actual unemployment rate next 12m ") lab(3 "Difference")  region(lcolor(white))  rows(3))   ///
					graphregion(color(white))  ///
					saving(unrate_next12_`country') 
	// Save each graph as a PNG file with a unique name
    graph export "unrate_next12_`country'.png", as(png) replace
	
     // Append the current graph name to the list of graph names
    local graph_names `graph_names' unrate_next12_`country'.gph
   
}
display "`graph_names'"


// Combine the graphs using grc1leg
grc1leg  `graph_names', cols(4) name(combined_graph_unrate_next12, replace) title("Unemployment rate - next 12 months") note("The relative change in non-adjusted unemployment in the next 12 months. Data Source: Eurostat")
graph export "combined_graph_unrate_next12.png", name (combined_graph_unrate_next12) replace

**************
// Initialize an empty local macro to store graph names FOR UNRATE next 12 ADJ
 
local graph_names

foreach country in `countries' {


// Counter for naming the graphs

capture erase unrate_next12_adj`country'.gph
qui graph twoway  (connected unrate_next12_open  mdate if country=="`country'", lcolor(green) lpattern(dash) mcolor(green) msymbol(p)) ///"
		              (connected unrate_next12_actual_adj mdate if country=="`country'", lcolor(blue) lpattern(dot) mcolor(blue) msymbol(p)) ///
					  (connected unrate_next12_adj_dif mdate if country=="`country'", lcolor(red)  lpattern(solid)  mcolor(red) lwidth(0.7) msymbol(p)), ///
					  yline(0, lpattern(solid) lcolor(black) lwidth(1)) ///
					  title("`country'") ///
					  ytitle("% change  ")  xtitle("Time") ///
					  legend( lab(1 "Perceived next 12m  Unemployment rate ")  lab(2 "Actual adjusted unemployment rate in the next 12 months ") lab(3 "Difference")  region(lcolor(white))  rows(3))   ///
					graphregion(color(white))  ///
					saving(unrate_next12_adj`country') 
	// Save each graph as a PNG file with a unique name
    graph export "unrate_next12_adj`country'.png", as(png) replace
	
     // Append the current graph name to the list of graph names
    local graph_names `graph_names' unrate_next12_adj`country'.gph
   
}
display "`graph_names'"


// Combine the graphs using grc1leg
grc1leg  `graph_names', cols(4) name(combined_graph_unrate_next12_adj, replace) title("Adjusted unemployment rate - next 12 months") note("The relative change in non-adjusted unemployment in the next 12 months. Data Source: OECD")
graph export "combined_graph_unrate_next12_adj.png", name (combined_graph_unrate_next12_adj) replace

**************
// Initialize an empty local macro to store graph names FOR imortg next 12
 
local graph_names

foreach country in `countries' {


// Counter for naming the graphs

capture erase imortg_next12_`country'.gph
qui graph twoway  (connected imortg_next12_open  mdate if country=="`country'", lcolor(green) lpattern(dash) mcolor(green) msymbol(p)) ///"
		              (connected imortg_next12_actual  mdate if country=="`country'", lcolor(blue) lpattern(dot) mcolor(blue) msymbol(p)) ///
					  (connected imortg_next12_dif mdate if country=="`country'", lcolor(red)  lpattern(solid)  mcolor(red) lwidth(0.7) msymbol(p)), ///
					  yline(0, lpattern(solid) lcolor(black) lwidth(1)) ///
					  title("`country'") ///
					  ytitle("% change ")  xtitle("Time") ///
					  legend( lab(1 "Perceived next 12m  mortgage interest rate ")  lab(2 "Actual mortgage interest rate next 12m ") lab(3 "Difference")  region(lcolor(white))  rows(3))   ///
					graphregion(color(white))  ///
					saving(imortg_next12_`country') 
	// Save each graph as a PNG file with a unique name
    graph export "imortg_next12_`country'.png", as(png) replace
	
     // Append the current graph name to the list of graph names
    local graph_names `graph_names' imortg_next12_`country'.gph  
}
display "`graph_names'"


// Combine the graphs using grc1leg
grc1leg  `graph_names', cols(4)  name(combined_graph_imortg_next12, replace) title("Mortgage interest rate - next 12 months")
graph export "combined_graph_imortg_next12.png", name (combined_graph_imortg_next12) replace

**************
// Initialize an empty local macro to store graph names FOR HCIP NEXT 12 FORECAST
 
local graph_names

foreach country in `countries' {


// Counter for naming the graphs

capture erase hcip_next12_f_`country'.gph
qui graph twoway  (connected prices_next12_open  mdate if country=="`country'", lcolor(green) lpattern(dash) mcolor(green) msymbol(p)) ///"
		              (connected hcip_next12_forecast mdate if country=="`country'", lcolor(blue) lpattern(dot) mcolor(blue) msymbol(p)) ///
					  (connected hcip_next12_f_dif mdate if country=="`country'", lcolor(red)  lpattern(solid)  mcolor(red) lwidth(0.7) msymbol(p)), ///
					  yline(0, lpattern(solid) lcolor(black) lwidth(1)) ///
					  title("`country'") ///
					  ytitle("% change i")  xtitle("Time") ///
					  legend( lab(1 "Perceived HCIP in next 12m forecast")  lab(2 "Actual HCIP forecast for next 12m") lab(3 "Difference")  region(lcolor(white))  rows(3))   ///
					graphregion(color(white))  ///
					saving(hcip_next12_f_`country') 
	// Save each graph as a PNG file with a unique name
    graph export "hcip_next12_f_`country'.png", as(png) replace
	
     // Append the current graph name to the list of graph names
    local graph_names `graph_names' hcip_next12_f_`country'.gph
   
}

// Combine the graphs using grc1leg
grc1leg  `graph_names', cols(4)  name(combined_graph_hcip_next12_f, replace) title("HCIP - next 12 months forecast") note("Forecast of HCIP for the next 12 months. Data Source: Eurostat and OECD")
graph export "combined_graph_hcip_next12_f.png", name (combined_graph_hcip_next12_f) replace


**************
// Initialize an empty local macro to store graph names FOR HCIP NEXT 36 FORECAST
 
local graph_names

foreach country in `countries' {


// Counter for naming the graphs

capture erase hcip_next36_f_`country'.gph
qui graph twoway  (connected prices_next36_open mdate if country=="`country'", lcolor(green) lpattern(dash) mcolor(green) msymbol(p)) ///"
		              (connected hcip_next36_forecast  mdate if country=="`country'", lcolor(blue) lpattern(dot) mcolor(blue) msymbol(p)) ///
					  (connected hcip_next36_f_dif mdate if country=="`country'", lcolor(red)  lpattern(solid)  mcolor(red) lwidth(0.7) msymbol(p)), ///
					  yline(0, lpattern(solid) lcolor(black) lwidth(1)) ///
					  title("`country'") ///
					  ytitle("% change")  xtitle("Time") ///
					  legend( lab(1 "Perceived HCIP in next 36m forecast")  lab(2 "Actual HCIP forecast for next 36m") lab(3 "Difference")  region(lcolor(white))  rows(3))   ///
					graphregion(color(white))  ///
					saving(hcip_next36_f_`country') 
	// Save each graph as a PNG file with a unique name
    graph export "hcip_next36_f_`country'.png", as(png) replace
	
     // Append the current graph name to the list of graph names
    local graph_names `graph_names' hcip_next36_f_`country'.gph
   
}

// Combine the graphs using grc1leg
grc1leg  `graph_names', cols(4) name(combined_graph_hcip_next36_f, replace) title("HCIP - next 36 months forecast") note("Forecast of HCIP for the next 36 months. Data Source: Eurostat and OECD")
graph export "combined_graph_hcip_next36_f.png", name (combined_graph_hcip_next36_f) replace

**************
// Initialize an empty local macro to store graph names FOR UNRATE NEXT 12 FORECAST
 
local graph_names
 
foreach country in `countries' {


// Counter for naming the graphs

capture erase unrate_next12_f_`country'.gph
qui graph twoway  (connected unrate_next12_open mdate if country=="`country'", lcolor(green) lpattern(dash) mcolor(green) msymbol(p)) ///"
		              (connected unrate_next12_forecast mdate if country=="`country'", lcolor(blue) lpattern(dot) mcolor(blue) msymbol(p)) ///
					  (connected unrate_next12_f_dif mdate if country=="`country'", lcolor(red)  lpattern(solid)  mcolor(red) lwidth(0.7) msymbol(p)), ///
					  yline(0, lpattern(solid) lcolor(black) lwidth(1)) ///
					  title("`country'") ///
					 ytitle("% change  ")  xtitle("Time") ///
					  legend( lab(1 "Perceived unrate in next 12m forecast")  lab(2 "Actual unrate forecast for next 12m") lab(3 "Difference")  region(lcolor(white))  rows(3))   ///
					graphregion(color(white))  ///
					saving(unrate_next12_f_`country') 
	// Save each graph as a PNG file with a unique name
    graph export "unrate_next12_f_`country'.png", as(png) replace
	
     // Append the current graph name to the list of graph names
    local graph_names `graph_names' unrate_next12_f_`country'.gph
   
}

// Combine the graphs using grc1leg
grc1leg  `graph_names', cols(4) name(combined_graph_unrate_next12_f, replace) title("Unemployment rate - next 12 months forecast") note("Forecast of unemployment for the next 12 months. Data Source: Eurostat and OECD")
graph export "combined_graph_unrate_next12_f.png", name (combined_graph_unrate_next12_f) replace

// change graph combine and make only one legend


					
*Scatterplot example for actual values + linear fit 
//scatter prices_past_open cpi_past12_actual if country=="DE"

//graph twoway (lfit prices_past_open cpi_past12_actual if country=="DE") (scatter prices_past_open cpi_past12_actual if country=="DE") 



* Scatteplot for lagged actual values
//gen lag_cpi_past12_actual = L.cpi_past12_actual // create lagged value for one period

//gen lag12_cpi_past12_actual = L12.cpi_past12_actual  // value shifted backwards for several periods,  useful for aligning actual values with expectations in 36 months

//gen forw12_cpi_past12_actual = F12.cpi_past12_actual // value shifted forward for several periods

* Scatterlot with an actual value shifted by one period
//graph twoway (scatter prices_past_open lag_cpi_past12_actual if country=="DE") (lfit prices_past_open lag_cpi_past12_actual if country=="DE")
// Generate lagged variables with "a" instead of "actual"
gen lag_cpi_past12_a = L.cpi_past12_actual
gen lag_hcip_past12_a = L.hcip_past12_actual
gen lag_cpi_next12_a = L.cpi_next12_actual
gen lag_hcip_next12_a = L.hcip_next12_actual
gen lag_cpi_next36_a = L.cpi_next36_actual
gen lag_hcip_next36_a = L.hcip_next36_actual
gen lag_unrate_cur_a = L.unrate_cur_actual
gen lag_unrate_next12_a = L.unrate_next12_actual
gen lag_imortg_next12_a = L.imortg_next12_actual
gen lag_hcip_next12_f = L.hcip_next12_forecast
gen lag_hcip_next36_f = L.hcip_next36_forecast
gen lag_unrate_next12_f = L.unrate_next12_forecast
gen lag_unrate_next12_a_adj = L.unrate_next12_actual_adj
gen lag_unrate_cur_a_adj = L.unrate_cur_actual_adj

//test
graph twoway (lfit prices_past_open lag_cpi_past12_a if country=="Austria") (scatter prices_past_open lag_cpi_past12_a if country=="Austria")
 
**************
// Initialize an empty local macro to store graph names lag_cpi_past12_a
 
levelsof country, local(countries)

local graph_names
 
foreach country in `countries' {


// Counter for naming the graphs

capture erase lag_cpi_past12_a`country'.gph

//scatter plot
graph twoway     (lfit prices_past_open lag_cpi_past12_a if country=="`country'") ///
				(scatter prices_past_open lag_cpi_past12_a if country=="`country'"), ///	  /* need to add a comma between the main part of the graph and additional details */ 
					  title("`country'") ///
					 ytitle(" Expectations @ t")  xtitle("CPI @ t-1") ///
					  legend( lab(1 "Consumer expectation of prices 12 months ago at time t")  lab(2 "Actual CPI in the 13 months ago at time t")   region(lcolor(white))  rows(2))   ///
					graphregion(color(white))  ///
					saving(lag_cpi_past12_a`country') 
	// Save each graph as a PNG file with a unique name
    graph export "lag_cpi_past12_a`country'.png", as(png) replace
	
     // Append the current graph name to the list of graph names
    local graph_names `graph_names' lag_cpi_past12_a`country'.gph
}
// Combine the graphs using grc1leg
grc1leg  `graph_names', cols(4) name(combined_lag_cpi_past12_a, replace) title("Consumer Price Expectation 12 months ago vs CPI 13 months ago ") note("Data Sources: CES and seperate data sources for each country")
graph export "combined_lag_cpi_past12_a.png", name (combined_lag_cpi_past12_a) replace



**************
// Initialize an empty local macro to store graph names lag_hcip_past12_a
 levelsof country, local(countries)

local graph_names
 
foreach country in `countries' {


// Counter for naming the graphs

capture erase lag_hcip_past12_a`country'.gph
graph twoway  (scatter prices_past_open lag_hcip_past12_a if country=="`country'") ///              
		              (lfit prices_past_open lag_hcip_past12_a if country=="`country'"), ///
					  title("`country'") ///
					  ytitle("Expectations @ t")  xtitle("HCIP @ t-1") ///
					  legend( lab(1 "Consumer expectation of prices 12 months ago at time t")  lab(2 "Actual HCIP in the 13 months previously at time t")   region(lcolor(white))  rows(2))   ///
					graphregion(color(white))  ///
					saving(lag_hcip_past12_a`country') 
	// Save each graph as a PNG file with a unique name
    graph export "lag_hcip_past12_a`country'.png", as(png) replace
	
     // Append the current graph name to the list of graph names
    local graph_names `graph_names' lag_hcip_past12_a`country'.gph
   
}

// Combine the graphs using grc1leg
grc1leg  `graph_names', cols(4) name(combined_lag_hcip_past12_a, replace) title(" Expectations of prices 12 months ago vs HCIP 13 months ago ") note("Data Sources: CES and Eurostat")

**************
// Initialize an empty local macro to store graph names lag_cpi_next12_a
 
local graph_names
 
foreach country in `countries' {


// Counter for naming the graphs

capture erase lag_cpi_next12_a`country'.gph

graph twoway  (scatter prices_next12_open lag_cpi_next12_a if country=="`country'")  ///
		              (lfit prices_next12_open lag_cpi_next12_a if country=="`country'"), ///
					  title("`country'") ///
					 ytitle("Expectations @ t")  xtitle("CPI @ t-1") ///
					  legend( lab(1 "Consumer expectation of prices in the next 12 months at time t")  lab(2 "Actual CPI in the next 11 months at time t")   region(lcolor(white))  rows(2))   ///
					graphregion(color(white))  ///
					saving(lag_cpi_next12_a`country') 
	// Save each graph as a PNG file with a unique name
    graph export "lag_cpi_next12_a`country'.png", as(png) replace
	
     // Append the current graph name to the list of graph names
    local graph_names `graph_names' lag_cpi_next12_a`country'.gph
   
}

// Combine the graphs using grc1leg
grc1leg  `graph_names', cols(4) name(combined_lag_cpi_next12_a, replace) title(" Expectations of prices in next 12 months vs CPI in next 11 months ") note("Data Sources: CES and seperate data sources for each country")
graph export "combined_lag_cpi_next12_a.png", name (combined_lag_cpi_next12_a) replace


**************
// Initialize an empty local macro to store graph names lag_hcip_next12_a
 
local graph_names
 
foreach country in `countries' {


// Counter for naming the graphs

capture erase lag_hcip_next12_a`country'.gph
graph twoway  (scatter prices_next12_open lag_hcip_next12_a if country=="`country'")  ///
		              (lfit prices_next12_open lag_hcip_next12_a if country=="`country'"), ///
					  title("`country'") ///
					 ytitle("Expectations @ t")  xtitle("HCIP @ t-1") ///
					  legend( lab(1 "Consumer expectation of prices in the next 12 months at time t")  lab(2 "Actual HCIP in the next 11 months at time t")   region(lcolor(white))  rows(2))   ///
					graphregion(color(white))  ///
					saving(lag_hcip_next12_a`country') 
	// Save each graph as a PNG file with a unique name
    graph export "lag_hcip_next12_a`country'.png", as(png) replace
	
     // Append the current graph name to the list of graph names
    local graph_names `graph_names' lag_hcip_next12_a`country'.gph
   
}

// Combine the graphs using grc1leg
grc1leg  `graph_names', cols(4) name(combined_lag_hcip_next12_a, replace) title(" Expectations of prices next 12 months vs HCIP next 11 months ") note("Data Sources: CES and Eurostat")
graph export "combined_lag_hcip_next12_a.png", name (combined_lag_hcip_next12_a) replace


**************
// Initialize an empty local macro to store graph names lag_hcip_next12_f
 
local graph_names
 
foreach country in `countries' {


// Counter for naming the graphs

capture erase lag_hcip_next12_f`country'.gph
graph twoway  (scatter prices_next12_open lag_hcip_next12_f if country=="`country'")  ///
		              (lfit prices_next12_open lag_hcip_next12_f if country=="`country'"), ///
					  title("`country'") ///
					 ytitle("Expectations @ t")  xtitle("HCIP @ t-1") ///
					  legend( lab(1 "Consumer expectation of prices in the next 12 months at time t")  lab(2 "Forecasted HCIP in the next 11 months at time t")   region(lcolor(white))  rows(2))   ///
					graphregion(color(white))  ///
					saving(lag_hcip_next12_f`country') 
	// Save each graph as a PNG file with a unique name
    graph export "lag_hcip_next12_f`country'.png", as(png) replace
	
     // Append the current graph name to the list of graph names
    local graph_names `graph_names' lag_hcip_next12_f`country'.gph
   
}

// Combine the graphs using grc1leg
grc1leg  `graph_names', cols(4) name(combined_lag_hcip_next12_f, replace) title("Expectations of prices in next 12 months vs Forecasted HCIP in next 11 months") note("Data Sources: CES and OECD")
graph export "combined_lag_hcip_next12_f.png", name (combined_lag_hcip_next12_f) replace


**************
// Initialize an empty local macro to store graph names lag_cpi_next36_a
 
local graph_names
 
foreach country in `countries' {


// Counter for naming the graphs

capture erase lag_cpi_next36_a`country'.gph
graph twoway  (scatter prices_next36_open lag_cpi_next36_a if country=="`country'")  ///
		              (lfit prices_next36_open lag_cpi_next36_a if country=="`country'"), ///
					title("`country'") ///
					 ytitle("Expectations @ t")  xtitle("CPI @ t-1") ///
					  legend( lab(1 "Consumer expectation of prices in the next 36 months at time t")  lab(2 "Actual CPI in the next 35 months at time t")   region(lcolor(white))  rows(2))   ///
					graphregion(color(white))  ///
					saving(lag_cpi_next36_a`country') 
	// Save each graph as a PNG file with a unique name
    graph export "lag_cpi_next36_a`country'.png", as(png) replace
	
     // Append the current graph name to the list of graph names
    local graph_names `graph_names' lag_cpi_next36_a`country'.gph
   
}

// Combine the graphs using grc1leg
grc1leg  `graph_names', cols(4) name(combined_lag_cpi_next36_a, replace) title(" Expectations of prices next 36 months vs CPI next 35 months ") note("Data Sources: CES and seperate data sources for each country")
graph export "combined_lag_cpi_next36_a.png", name (combined_lag_cpi_next36_a) replace


**************
// Initialize an empty local macro to store graph names lag_hcip_next36_a
 
local graph_names
 
foreach country in `countries' {


// Counter for naming the graphs

capture erase lag_hcip_next36_a`country'.gph
graph twoway  (scatter prices_next36_open lag_hcip_next36_a if country=="`country'") ///
		              (lfit prices_next36_open lag_hcip_next36_a if country=="`country'"), ///
					   title("`country'") ///
					 ytitle("Expectations @ t")  xtitle("HCIP @ t-1") ///
					  legend( lab(1 "Consumer expectation of prices in the next 36 months at time t")  lab(2 "Actual HCIP in the next 35 months at time t")   region(lcolor(white))  rows(2))   ///
					graphregion(color(white))  ///
					saving(lag_hcip_next36_a`country') 
	// Save each graph as a PNG file with a unique name
    graph export "lag_hcip_next36_a`country'.png", as(png) replace
	
     // Append the current graph name to the list of graph names
    local graph_names `graph_names' lag_hcip_next36_a`country'.gph
   
}

// Combine the graphs using grc1leg
grc1leg  `graph_names', cols(4) name(combined_lag_hcip_next36_a, replace) title(" Expectations of prices next 36 months vs HCIP next 35 months ") note("Data Sources: CES and Eurostat")
graph export "combined_lag_hcip_next36_a.png", name (combined_lag_hcip_next36_a) replace


**************
// Initialize an empty local macro to store graph names lag_hcip_next36_f
 
local graph_names
 
foreach country in `countries' {


// Counter for naming the graphs

capture erase lag_hcip_next36_f`country'.gph
graph twoway  (scatter prices_next36_open lag_hcip_next36_f if country=="`country'")  ///
		              (lfit prices_next36_open lag_hcip_next36_f if country=="`country'"), ///			
					  title("`country'") ///
					 ytitle("Expectations @ t")  xtitle("HCIP @ t-1") ///
					  legend( lab(1 "Consumer expectations of prices in the next 36 months at time t")  lab(2 "Forecasted HCIP in the next 35 months at time t")   region(lcolor(white))  rows(2))   ///
					graphregion(color(white))  ///
					saving(lag_hcip_next36_f`country') 
	// Save each graph as a PNG file with a unique name
    graph export "lag_hcip_next36_f`country'.png", as(png) replace
	
     // Append the current graph name to the list of graph names
    local graph_names `graph_names' lag_hcip_next36_f`country'.gph
   
}

// Combine the graphs using grc1leg
grc1leg  `graph_names', cols(4) name(combined_lag_hcip_next36_f, replace) title(" Expectations of prices in next 36 months vs Forecasted HCIP in next 35 months ") note("Data Sources: CES and OECD")
graph export "combined_lag_hcip_next36_f.png", name (combined_lag_hcip_next36_f) replace


**************
// Initialize an empty local macro to store graph names lag_unrate_cur_a
 
local graph_names
 
foreach country in `countries' {


// Counter for naming the graphs

capture erase lag_unrate_cur_a`country'.gph
graph twoway  (scatter unrate_cur_open lag_unrate_cur_a if country=="`country'")  ///
		              (lfit unrate_cur_open lag_unrate_cur_a if country=="`country'"), ///					  
					  title("`country'") ///
					 ytitle("Expectations @ t")  xtitle("Actual unemployment  @ t-1") ///
					  legend( lab(1 "Expectation of unemployment at time t")  lab(2 "Actual unemployment rate at time t-1")   region(lcolor(white))  rows(2))   ///
					graphregion(color(white))  ///
					saving(lag_unrate_cur_a`country') 
	// Save each graph as a PNG file with a unique name
    graph export "lag_unrate_cur_a`country'.png", as(png) replace
	
     // Append the current graph name to the list of graph names
    local graph_names `graph_names' lag_unrate_cur_a`country'.gph
   
}

// Combine the graphs using grc1leg
grc1leg  `graph_names', cols(4) name(combined_lag_unrate_cur_a, replace) title("Expectations vs actual of current unemployment rate" ) note("Data Sources: CES and Eurostat")
graph export "combined_lag_unrate_cur_a.png", name (combined_lag_unrate_cur_a) replace


**************
// Initialize an empty local macro to store graph names lag_unrate_cur_a_adj
 
local graph_names
 
foreach country in `countries' {


// Counter for naming the graphs

capture erase lag_unrate_cur_a_adj`country'.gph
graph twoway  (scatter unrate_cur_open lag_unrate_cur_a_adj if country=="`country'")  ///
		              (lfit unrate_cur_open lag_unrate_cur_a_adj if country=="`country'"), ///			  
					  title("`country'") ///
					 ytitle("Expectations @ t")  xtitle("Actual unemployment rate @ t-1") ///
					  legend( lab(1 "Expectation of unemployment at time t")  lab(2 "Actual unemployment at time t-1")   region(lcolor(white))  rows(2))   ///
					graphregion(color(white))  ///
					saving(lag_unrate_cur_a_adj`country') 
	// Save each graph as a PNG file with a unique name
    graph export "lag_unrate_cur_a_adj`country'.png", as(png) replace
	
     // Append the current graph name to the list of graph names
    local graph_names `graph_names' lag_unrate_cur_a_adj`country'.gph
   
}

// Combine the graphs using grc1leg
grc1leg  `graph_names', cols(4) name(combined_lag_unrate_cur_a_adj, replace) title("Expectations vs Adjusted lagged  current unemployment rate" ) note("Data Sources: CES and OECD. Data adjusted by OECD")
graph export "combined_lag_unrate_cur_a_adj.png", name (combined_lag_unrate_cur_a_adj) replace



**************
// Initialize an empty local macro to store graph names lag_unrate_next12_a
 
local graph_names
 
foreach country in `countries' {


// Counter for naming the graphs

capture erase lag_unrate_next12_a`country'.gph
graph twoway  (scatter unrate_next12_open lag_unrate_next12_a if country=="`country'")  ///
		              (lfit unrate_next12_open lag_unrate_next12_a if country=="`country'"), ///			  
					  title("`country'") ///
					 ytitle("Expectations @ t")  xtitle("Actual unemployment @ t-1") ///
					  legend( lab(1 "Expectation of unemployment rate in next 12 months at time t")  lab(2 "Actual unemployment rate in the next 11 months at time t-1")   region(lcolor(white))  rows(2))   ///
					graphregion(color(white))  ///
					saving(lag_unrate_next12_a`country') 
	// Save each graph as a PNG file with a unique name
    graph export "lag_unrate_next12_a`country'.png", as(png) replace
	
     // Append the current graph name to the list of graph names
    local graph_names `graph_names' lag_unrate_next12_a`country'.gph
   
}

// Combine the graphs using grc1leg
grc1leg  `graph_names', cols(4) name(combined_lag_unrate_next12_a, replace) title(" Expectations vs actual lagged of unemployment in the next 12 months" ) note("Data Sources: CES and Eurostat. Data NOT adjusted")
graph export "combined_lag_unrate_next12_a.png", name (combined_lag_unrate_next12_a) replace



**************
// Initialize an empty local macro to store graph names lag_unrate_next12_a_adj
 
local graph_names
 
foreach country in `countries' {


// Counter for naming the graphs

capture erase lag_unrate_next12_a_adj`country'.gph
graph twoway  (scatter unrate_next12_open lag_unrate_next12_a_adj if country=="`country'")  ///
		              (lfit unrate_next12_open lag_unrate_next12_a_adj if country=="`country'"), ///
					  title("`country'") ///
					 ytitle("Expectations @ t")  xtitle("Actual unemployment @ t-1") ///
					  legend( lab(1 "Expectation of unemployment rate in next 12 months at time t")  lab(2 "Actual adjusted unemployment rate in the next 11 months at time t-1")   region(lcolor(white))  rows(2))   ///
					graphregion(color(white))  ///
					saving(lag_unrate_next12_a_adj`country') 
	// Save each graph as a PNG file with a unique name
    graph export "lag_unrate_next12_a_adj`country'.png", as(png) replace
	
     // Append the current graph name to the list of graph names
    local graph_names `graph_names' lag_unrate_next12_a_adj`country'.gph
   
}

// Combine the graphs using grc1leg
grc1leg  `graph_names', cols(4) name(combined_lag_unrate_next12_a_adj, replace) title("Expectations vs adjusted lagged unemployment  in the next 12 months" ) note("Data Sources: CES and OECD. Data adjusted by OECD")
graph export "combined_lag_unrate_next12_a.png", name (combined_lag_unrate_next12_a_adj) replace



**************
// Initialize an empty local macro to store graph names lag_unrate_next12_f
 
local graph_names
 
foreach country in `countries' {


// Counter for naming the graphs

capture erase lag_unrate_next12_f`country'.gph
graph twoway  (scatter unrate_next12_open lag_unrate_next12_f if country=="`country'")  ///
		              (lfit unrate_next12_open lag_unrate_next12_f if country=="`country'"), ///
					  title("`country'") ///
					 ytitle("Expectations @ t")  xtitle("Forecasted unemployment @ t-1") ///
					  legend( lab(1 "Expectation of unemployment rate in next 12 months at time t")  lab(2 "Forecasted unemployment rate in the next 11 months at time t-1")   region(lcolor(white))  rows(2))   ///
					graphregion(color(white))  ///
					saving(lag_unrate_next12_f`country') 
	// Save each graph as a PNG file with a unique name
    graph export "lag_unrate_next12_f`country'.png", as(png) replace
	
     // Append the current graph name to the list of graph names
    local graph_names `graph_names' lag_unrate_next12_f`country'.gph
   
}

// Combine the graphs using grc1leg
grc1leg  `graph_names', cols(4) name(combined_lag_unrate_next12_f, replace) title(" Expectations ns lagged forecast of unemployment in the next 12 months" ) note("Data Sources: CES and OECD")
graph export "combined_lag_unrate_next12_f.png", name (combined_lag_unrate_next12_f) replace


**************
// Initialize an empty local macro to store graph names lag_imortg_next12_a
 
local graph_names
 
foreach country in `countries' {


// Counter for naming the graphs

capture erase lag_imortg_next12_a`country'.gph
graph twoway  (scatter imortg_next12_open lag_imortg_next12_a if country=="`country'")  ///
		              (lfit imortg_next12_open lag_imortg_next12_a if country=="`country'"), ///				  
					  title("`country'") ///
					 ytitle("Expectations @ t")  xtitle("Actual mortgage interest @ t-1") ///
					  legend( lab(1 "Expectation of mortgage interest rates in the next 12 months at time t")  lab(2 "Actual mortgage interest rates in the next 12 months at time t-1")   region(lcolor(white))  rows(2))   ///
					graphregion(color(white))  ///
					saving(lag_imortg_next12_a`country') 
	// Save each graph as a PNG file with a unique name
    graph export "lag_imortg_next12_a`country'.png", as(png) replace
	
     // Append the current graph name to the list of graph names
    local graph_names `graph_names' lag_imortg_next12_a`country'.gph
   
}

// Combine the graphs using grc1leg
grc1leg  `graph_names', cols(4) name(combined_lag_imortg_next12_a, replace) title(" Expectations ns lagged of mortgage interest in the next 12 months" ) note("Data Sources: CES and Eurostat. Unadjusted data ")
graph export "combined_lag_imortg_next12_a.png", name (combined_lag_imortg_next12_a) replace

