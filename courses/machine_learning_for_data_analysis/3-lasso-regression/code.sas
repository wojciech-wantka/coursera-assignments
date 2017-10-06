proc import datafile="/home/wwantka0/sasuser.v94/cars.csv" out=imported replace;

data all_data;
set imported;

proc surveyselect data=all_data out=training_data seed=845743
    samprate=0.7 method=srs outall;
run;

ods graphics on;

proc glmselect data=training_data plots=all seed=845743;
    partition role=selected(training='1' testing='0');
    model time_to_60 = mpg cylinders cubicinches horse_power weightlbs year / selection=lar(choose=cv stop=none) cvmethod=random(10);
run;
