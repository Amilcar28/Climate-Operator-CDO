#!/bin/bash
for season in JFM FMA AMJ MJJ JJA  JAS ASO SON OND; do 

echo  ${season}
cdo yearmean -selseas,${season} cru_ts4.06.1901.2021.tmx.dat.nc cru_ts4.06.1901.2021.tmx_${season}.nc
done 

for season in JFM FMA AMJ MJJ JJA  JAS ASO SON OND; do

echo ${season}
cdo yearmean -selseas,${season} cru_ts4.06.1901.2021.tmn.dat.nc cru_ts4.06.1901.2021.tmn_${season}.nc
done

# converting into binary for fortran 
# we will use GrADS to convert files from netcdf to binary

#grads -blc "run script.gs /home/blah/path/to/your/file.ctl"
#Use 'grads -bpcx':

