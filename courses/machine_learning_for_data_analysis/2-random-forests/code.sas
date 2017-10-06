proc import datafile="/path/to/my/username/cars.csv" out=imported replace;

data new;
set imported;

proc hpforest;

target brand /level=nominal;

input mpg cylinders cubicinches horse_power weightlbs time_to_60 year /level=interval;

run;
