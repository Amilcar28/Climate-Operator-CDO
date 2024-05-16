#!/bin/bash

# Input and output filenames
input_file="era5_pr_hourly_1991_2020_AGO.nc"
output_file="era5_pr_mm_1991_2020_AGO.nc"

# CDO commands to perform calculations
# cdo seldate,1991-01-31,2020-12-31 ${input_file} ${output_file}  

# CDO comands to convert parameter m (meter) for mm (millimeter)
cdo mulc,1000 input_file.nc output_file.nc

echo "Calculations completed!"

# Input and output filenames
input_file="era5_pr_mm_1991_2020_AGO.nc"
output_file="era5_pr_mensal_1991_2020_AGO.nc"

# CDO comands to sum monthly
cdo monsum input_file.nc output_file.nc

echo "Calculations completed!"

# Input and output filenames
input_file="era5_pr_mensal_1991_2020_AGO.nc"
output_file="era5_pr_mensal_1991_2020_AGO.nc"

# CDO comands to sum monthly
cdo monsum input_file.nc output_file.nc

echo "Calculations completed!"

# Add more CDO commands as needed for other calculations
# For example:
# cdo timmean ${input_file} ${output_file} # Calculate temporal mean
# cdo fldmean ${input_file} ${output_file}  # Calculate spatial mean
# cdo remapbil,target_grid.txt ${input_file} ${output_file}  # Remap data to a new grid
# ...

echo "Calculations completed!"

