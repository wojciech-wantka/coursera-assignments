proc import datafile="/path/to/my/username/cars.csv" out=imported replace;

data new;
set imported;

ods graphics on;

proc hpsplit assignmissing=popular seed=67483;

class brand mpg cylinders horse_power weightlbs time_to_60 year;

model brand = mpg cylinders cubicinches horse_power weightlbs time_to_60 year;

grow entropy;
prune costcomplexity;

run;
