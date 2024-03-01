*price variable is given with dollar signs at the beginning, so need to leave only the numbers and drop „NA" observations
gen price_num = substr(price, 2, .)
drop if regexm(price_num, "[A-Za-z]")

*new price_num variable has only numbers but the type is strong, need to convert it to numeric type
destring price_num, replace

*after checking what is left, need to clean price by dropping extremely low, high value observations which seem implausible
drop if price_num==1
drop if price_num==90002

*cylinders variable could be transformed to numeric to be used more effectively: leave only the number of cylinders given at the beginning of the original variable
gen cylinder_num = substr(cylinders, 1, 1)

*clean observations with no data about number of cylinders (N is left from NA and o left from other - after the previous line) & change to numeric type
keep if !(cylinder_num == "N" | cylinder_num == "o")
destring cylinder_num, replace

*create a year variable by getting the year from name variable and making it numeric
gen year = substr(name, 1, 4)
destring year, replace

*apply filter to leave only chicago observations, this drops los angeles observations
keep if area=="chicago"

*drop variables that were previously transfromed
drop cylinders price

*save derived new data
save "data/derived/derived_chicago.dta", replace
