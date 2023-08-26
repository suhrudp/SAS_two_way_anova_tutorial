/*IMPORT DATA*/
proc import datafile="/home/u62868661/Datasets/Two-way ANOVA/Heart Rate.csv"
dbms=csv
out=df
replace;
run;

/*TWO-WAY ANALYSIS OF VARIANCE WITH INTERACTIONS*/
proc glm data=df;
	class Gender Group;
	model 'Heart Rate'n = Gender Group Gender*Group;
	means Gender Group Gender*Group / hovtest=levene welch plots=none;
	lsmeans Gender Group Gender*Group / adjust=tukey pdiff alpha=.05;
	run;