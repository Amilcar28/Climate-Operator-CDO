#!/bin/bash
for season in JFM FMA MAM  SON OND NDJ DJF; do 

echo  ${season}
cdo monsum -selseas,${season} era5_pr_hourly_1964_2022_AGO.nc era5_pr_hourly_1964_2022_AGO_${season}.nc
cdo seldate,1991-01-31,2020-12-31 era5_pr_hourly_1964_2022_AGO.nc era5_pr_hourly_1991_2020_AGO.nc 
done

