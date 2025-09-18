clear all
*31/3
use "/Users/caoimhemcenroe/Downloads/merged-EOSC-ESS8e02_2-5/merged-EOSC-ESS8e02_2.dta"
*make summary statistics 
*gen paccdcmdev = abs(100-paccdcm)
*gen tmpanocmabs = abs(tmpanocm)


*dtable tmpdca  tmpanocm tmpanocmabs paccta paccdcm paccdcmdev, by(cntry) ///
sample(, statistics(freq) place(seplabels)) sformat("(N=%s)" frequency) ///
note(Total sample: N = 2,582) column(by(hide)) ///
nformat(%7.2f mean sd) title(Table 1. Demographics) export(table1234.docx, replace)

*capture gen date_var = mdy(inwmme, inwdde,  inwyye)
*format date_var % td
*tab date_var if cntry == "GB"




*make countries not strings 
capture gen cntry_num = 0
replace cntry_num = 1 if cntry == "AT"
replace cntry_num = 2 if cntry == "BE"
replace cntry_num = 3 if cntry == "CZ"
replace cntry_num = 4 if cntry == "DE"
replace cntry_num = 5 if cntry == "ES"
replace cntry_num = 6 if cntry == "FR"
replace cntry_num = 7 if cntry == "GB"
replace cntry_num = 8 if cntry == "HU"
replace cntry_num = 9 if cntry == "NO"
replace cntry_num = 10 if cntry == "SE"


gen tempanom = .

*AT
*tab tmpanocm inwmms if cntry_num == 1
replace tempanom = 2.7 if cntry_num == 1 & inwmme == 10
replace tempanom = -.79 if cntry_num == 1  & inwmme == 11
replace tempanom = -.57  if cntry_num == 1 & inwmme == 12

*BE
replace tempanom = -2.5 if cntry_num == 2 & inwmme == 9
replace tempanom = 2.7 if cntry_num == 2 & inwmme == 10
replace tempanom = -1.2 if cntry_num == 2 & inwmme == 11
replace tempanom = -.95 if cntry_num == 2 & inwmme == 12


*CZ
replace tempanom = -.66 if cntry_num == 3 & inwmme == 11
replace tempanom = -.89 if cntry_num == 3 & inwmme == 12

*DE
replace tempanom = -.51  if cntry_num == 4 & inwmme == 9
replace tempanom = 3.4 if cntry_num == 4 & inwmme == 10
replace tempanom = -1 if cntry_num == 4 & inwmme == 11
replace tempanom = -1.3 if cntry_num == 4 & inwmme == 12
replace tempanom = .89 if cntry_num == 4 & inwmme == 1


*ES
replace tempanom = 1.5 if cntry_num == 5 & inwmme == 3
replace tempanom = .75 if cntry_num == 5 & inwmme == 4 
replace tempanom = 2.1 if cntry_num == 5 & inwmme == 5
replace tempanom = 2.2 if cntry_num == 5 & inwmme == 6


*FR
replace tempanom = -.35 if cntry_num ==6 & inwmme == 12
replace tempanom = -1.4 if cntry_num == 6 & inwmme == 1
replace tempanom = -2.8 if cntry_num == 6 & inwmme == 2
replace tempanom = 1.9 if cntry_num == 6 & inwmme == 3

*GB
replace tempanom = 2.3 if cntry_num == 7 & inwmme == 10
replace tempanom = -.27 if cntry_num == 7 & inwmme == 11
replace tempanom = -1.3 if cntry_num == 7 & inwmme == 12
replace tempanom = .88 if cntry_num == 7 & inwmme == 1
replace tempanom = -1.7 if cntry_num == 7 & inwmme == 2


*HU
replace tempanom = .12 if cntry_num == 8 & inwmme == 6
replace tempanom = 1.6 if cntry_num == 8 & inwmme == 7


*NO
replace tempanom = -.86 if cntry_num == 9 & inwmme == 9
replace tempanom = 2.9  if cntry_num == 9 & inwmme == 10
replace tempanom = -.7 if cntry_num == 9 & inwmme == 11
replace tempanom = -1.4 if cntry_num == 9 & inwmme == 12
replace tempanom = 2.8 if cntry_num == 9 & inwmme == 1


*SE
replace tempanom = 1.9 if cntry_num == 10 & inwmme == 10
replace tempanom = -.13 if cntry_num == 10 & inwmme == 11
replace tempanom = -1.3 if cntry_num == 10  & inwmme == 12
replace tempanom = 1.6  if cntry_num == 10 & inwmme == 1
replace tempanom = .52  if cntry_num == 10 & inwmme == 2



capture gen precanom = .


*AT
replace precanom = 50 if cntry_num == 1  & inwmme == 10
replace precanom = 180 if cntry_num == 1  & inwmme == 11
replace precanom = 94  if cntry_num == 1 & inwmme == 12



*BE

replace precanom = 35 if cntry_num == 2 & inwmme == 10
replace precanom = 63 if cntry_num == 2 & inwmme == 11
replace precanom = 113 if cntry_num == 2  & inwmme == 12
replace precanom = 31 if cntry_num == 2 & inwmme == 1



*cz
replace precanom = 148 if cntry_num == 3 & inwmme == 11
replace precanom = 86 if cntry_num == 3 & inwmme == 12



*DE
replace precanom =  48 if cntry_num == 4 & inwmme == 9
replace precanom =  29 if cntry_num == 4 & inwmme == 10
replace precanom = 141 if cntry_num == 4 & inwmme == 11
replace precanom = 80  if cntry_num == 4 & inwmme == 12
replace precanom = 94 if cntry_num == 4 & inwmme == 1



*ES
replace precanom = 169 if cntry_num == 5 & inwmme == 3
replace precanom = 60 if cntry_num == 5 & inwmme == 4 
replace precanom = 30 if cntry_num == 5 & inwmme == 5
replace precanom = 91 if cntry_num == 5 & inwmme == 6





*FR
replace precanom = 102 if cntry_num ==6 & inwmme == 12
replace precanom = 28 if cntry_num == 6 & inwmme == 1
replace precanom = 62 if cntry_num == 6 & inwmme == 2
replace precanom = 99 if cntry_num == 6 & inwmme == 3


*GB

replace precanom = 81 if cntry_num == 7 & inwmme == 10
replace precanom = 37 if cntry_num == 7 & inwmme == 11
replace precanom = 103 if cntry_num == 7 & inwmme == 12
replace precanom = 18 if cntry_num == 7 & inwmme == 1
replace precanom =  113 if cntry_num == 7 & inwmme == 2

*HU
replace precanom = 86 if cntry_num == 8 & inwmme == 6
replace precanom = 52 if cntry_num == 8  & inwmme == 7




*NO
replace precanom = 114 if cntry_num == 9 & inwmme == 9
replace precanom =  40 if cntry_num == 9 & inwmme == 10
replace precanom = 53 if cntry_num == 9 & inwmme == 11
replace precanom = 83 if cntry_num == 9 & inwmme == 12
replace precanom = 29 if cntry_num == 9 & inwmme == 1


*SE
replace precanom = 55 if cntry_num == 10 & inwmme == 10
replace precanom = 73	 if cntry_num == 10 & inwmme == 11
replace precanom = 149 if cntry_num ==10 & inwmme == 12
replace precanom = 38 if cntry_num == 10 & inwmme == 1
replace precanom = 67 if cntry_num == 10 & inwmme == 2

capture gen clmthgt = 0
replace clmthgt = clmthgt1 
replace clmthgt = clmthgt2 if missing(clmthgt)

***svendson
*trying ols regression now 
**** generate additive index

**** sort out clmthgt  - blending the two together
capture gen clmthgt = 0
replace clmthgt = clmthgt1 
replace clmthgt = clmthgt2 if missing(clmthgt)

tab clmthgt

gen beneffap = .
replace beneffap = 1 if eneffap > 5 & !missing(eneffap)
replace beneffap = 0 if eneffap <= 5 & !missing(eneffap)

capture gen blklmten = .
replace blklmten = 1 if lklmten > 5 & !missing(lklmten)
replace blklmten = 0 if lklmten <= 5 & !missing(lklmten)

capture gen bgvsrdcc = .
replace bgvsrdcc = 1 if gvsrdcc > 5 & !missing(gvsrdcc)
replace bgvsrdcc = 0 if gvsrdcc <= 5 & !missing(gvsrdcc)


capture gen  bsbsrnen = .
replace bsbsrnen = 1 if sbsrnen < 3 & !missing(sbsrnen)
replace bsbsrnen = 0 if sbsrnen >= 3 & !missing(sbsrnen)

capture gen beneffap = .
replace beneffap = 1 if eneffap > 5 & !missing(eneffap)
replace beneffap = 0 if eneffap <= 5 & !missing(eneffap)

capture gen brdcenr = .
replace brdcenr = 1 if rdcenr > 3 & !missing(rdcenr)
replace brdcenr = 0 if rdcenr <= 3 & !missing(rdcenr)



capture gen bownrdcc = .
replace bownrdcc = 1 if ownrdcc > 5 & !missing(ownrdcc)
replace bownrdcc = 0 if ownrdcc <= 5 & !missing(ownrdcc)



capture gen bclmchng = .
replace bclmchng = 1 if clmchng < 3 & !missing(clmchng)
replace bclmchng = 0 if clmchng >= 3 & !missing(clmchng)

capture gen bclmthgt = .
replace bclmthgt = 1 if clmthgt > 2 & !missing(clmthgt)
replace bclmthgt = 0 if clmthgt <= 2 & !missing(clmthgt)

capture gen bwrclmch = .
replace bwrclmch = 1 if wrclmch > 2 & !missing(wrclmch)
replace bwrclmch = 0 if wrclmch <= 2 & !missing(wrclmch)

capture gen bccgdbd = .
replace bccgdbd = 1 if ccgdbd < 5 & !missing(ccgdbd)
replace bccgdbd = 0 if ccgdbd >= 5 & !missing(ccgdbd)

capture gen bccnthum = .
replace bccnthum = 1 if ccnthum > 3 & !missing(ccnthum)
replace bccnthum = 0 if ccnthum <= 3 & !missing(ccnthum) 
replace bccnthum = 0 if ccnthum == 55  // Explicitly set 55 to 0

capture gen blkredcc = .
replace blkredcc = 1 if lkredcc > 5 & !missing(lkredcc)
replace blkredcc = 0 if lkredcc <= 5 & !missing(lkredcc)

capture gen bccrdprs = .
replace bccrdprs =1 if ccrdprs > 5  & !missing(ccrdprs)
replace bccrdprs =0 if ccrdprs <= 5  & !missing(ccrdprs)



capture gen binctxff = .
replace binctxff = 1 if inctxff < 3  & !missing(inctxff)
replace binctxff = 0 if inctxff >= 3  & !missing(inctxff)



capture gen bbanhhap = .
replace bbanhhap = 1 if banhhap < 3 & !missing(banhhap)
replace bbanhhap = 0 if banhhap >= 3 & !missing(banhhap)
**************************************************************************************************
**** CREATE PRECIPITATION MONTHLY ANNOMOLY 



**************************************************************************************************
* rename climate variables 
capture gen believe = bclmchng
capture gen worry = bwrclmch
capture gen source = bccnthum
capture gen impact = bccgdbd
capture gen persrespon = bccrdprs
capture gen carbon = binctxff
capture gen subsid = bsbsrnen
capture gen reduceown = bownrdcc
capture gen buyeeapp = beneffap 
capture gen oftendoenred = brdcenr 
capture gen thinkabt = bclmthgt
capture gen largered = blkredcc 
capture gen likelylarge = blklmten 
capture gen likelygov = bgvsrdcc 
capture gen bansale = bbanhhap


*missing weather variables only
drop if missing(tempanom, precanom)

quietly gsem (believe worry  thinkabt impact source largered persrespon carbon  bansale   <- ), logit lclass(C 4) difficult  iter(500)
estat lcprob 

estat lcmean

estat lcgof
lca_entropy 

*estimate probabilities of belonging to class
capture predict cpost4a*, classposteriorpr

capture egen max4a = rowmax(cpost4a*)
capture generate predclass4a = 1 if cpost4a1==max4a
capture replace predclass4a = 2 if cpost4a2==max4a
capture replace predclass4a = 3 if cpost4a3==max4a
capture replace predclass4a = 4 if cpost4a4==max4a
tabulate predclass4a


drop if missing(agea , gndr , rlgatnd , stfeco , edulvlb , lrscale)

quietly gsem (believe worry  thinkabt impact source largered persrespon carbon  bansale   <- ), logit lclass(C 4) difficult  iter(500)
estat lcprob 
estat lcmean
estat lcgof

*estimate probabilities of belonging to class
capture predict cpost4*, classposteriorpr
capture egen max4 = rowmax(cpost4*)
capture generate predclass4 = 1 if cpost41==max4
capture replace predclass4 = 2 if cpost42==max4
capture replace predclass4 = 3 if cpost43==max4
capture replace predclass4 = 4 if cpost44==max4
tabulate predclass4
