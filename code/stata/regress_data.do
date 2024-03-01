use "data/derived/derived_chicago.dta", replace

*run regression to see if year affects price of a car
ssc install outreg2
reg price_num year
outreg2 using "data/derived/reg.doc"

*graph relationship between year and price of a car
scatter price_num year

*save scatter plot as a png file
graph export "scatterplot_year_price.png", replace
