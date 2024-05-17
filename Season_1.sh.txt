#!/bin/bash
for season in JFM FMA MAM AMJ MJJ JJA  JAS ASO SON OND NDJ DJF; do 
input_file="/ajdata/CRU_ACTUALIZADO2022/Projeto_cru/cru_tmax"
output_file="cru_tmax"

echo  ${season}
cdo yearmean -selseas,${season} cru_ts4.07.1901.2022.tmx.dat.nc cru_ts4.07.1901.2022.tmx_${season}.nc
echo "/ajdata/CRU_ACTUALIZADO2022/Projeto_cru/cru_tmax"
done 

for season in JFM FMA MAM AMJ MJJ JJA  JAS ASO SON OND NDJ DJF; do 
input_file="/ajdata/CRU_ACTUALIZADO2022/Projeto_cru/cru_tmin"
output_file="cru_tmin"

echo ${season}
cdo yearmean -selseas,${season} cru_ts4.07.1901.2022.tmn.dat.nc cru_ts4.07.1901.2022.tmn_${season}.nc
echo "/ajdata/CRU_ACTUALIZADO2022/Projeto_cru/cru_tmin"
done

for season in JFM FMA MAM AMJ MJJ JJA  JAS ASO SON OND NDJ DJF; do 
input_file="/ajdata/CRU_ACTUALIZADO2022/Projeto_cru/cru_tmed"
output_file="cru_tmed"

echo ${season}
cdo yearmean -selseas,${season} cru_ts4.07.1901.2022.tmp.dat.nc cru_ts4.07.1901.2022.tmp_${season}.nc
echo "/ajdata/CRU_ACTUALIZADO2022/Projeto_cru/cru_tmed"
done

# converting into binary for fortran 
# we will use GrADS to convert files from netcdf to binary

#grads -blc "run script.gs /home/blah/path/to/your/file.ctl"
#Use 'grads -bpcx':

