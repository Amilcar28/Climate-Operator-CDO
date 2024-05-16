#!/bin/bash

# Definer dados de entradas e saidas com ficheiro
input_file ="era5_pr_hourly_1964_2022_AGO.nc"
output_file ="era5_pr_hourly_1991_2020.nc"

#Selecionar o periodo climatologio 1991 - 2020
 cdo seldate, 1991-01-31,2020-12-31 era5_pr_hourly_1964_2022_AGO.nc era5_pr_hourly_1991_2020.nc

echo "Calculations completed!"

# Converter dados de precipitacao de metros para mm (*1000)
input_file ="era5_pr_hourly_1991_2020.nc"
output_file ="era5_pr_h_mm_1991_2020.nc"
cdo mulc,1000 era5_pr_hourly_1991_2020.nc, era5_pr_h_mm_1991_2020.nc

echo "Calculations completed!"

# passar os dados horarios para mensal
input_file ="era5_pr_h_mm_1991_2020.nc"
output_file ="era5_pr_mensal_mm_1991_2020.nc"
cdo monsum era5_pr_h_mm_1991_2020.nc era5_pr_mensal_mm_1991_2020.nc

echo "Calculations completed!"

# criar os trimestre para fazer a climatolgia do Era5 
input_file ="era5_pr_mensal_mm_1991_2020.nc"
output_file ="SON_era5_pr_mensal_1991_2020"
output_file ="OND_era5_pr_mensal_1991_2020"
output_file ="NDJ_era5_pr_mensal_1991_2020"
output_file ="DJF_era5_pr_mensal_1991_2020"
output_file ="JFM_era5_pr_mensal_1991_2020"
output_file ="FMA_era5_pr_mensal_1991_2020"
output_file ="MAM_era5_pr_mensal_1991_2020"

# Seleccionar os trimestres totais
cdo selmon,9,10,11 ${input_file} ${output_file} 
cdo selmon,10,11,12 ${input_file} ${output_file}
cdo selmon,11,12,1 ${input_file} ${output_file}
cdo selmon,12,1,2 ${input_file} ${output_file}
cdo selmon,1,2,3 ${input_file} ${output_file}
cdo selmon,2,3,4 ${input_file} ${output_file}
cdo selmon,3,4,5 ${input_file} ${output_file}

echo "Calculations completed!"
