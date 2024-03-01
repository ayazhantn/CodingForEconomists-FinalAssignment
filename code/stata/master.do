*cd "CodingForEconomists-FinalAssignment"

*download data
do "code/stata/load_csv_data.do"

*clean data
do "code/stata/clean_data.do"

*run (simple) analysis
do "code/stata/regress_data.do"
