#!/bin/bash
CDO=cdo
# Dado de entrada netcdf
input_dir=era5_pr_hourly_1964_2022_AGO.nc
# Criando director para saida de dados
output_dir=output_data

# Criando diretório para a saida de dados
mkdir -p $output_dir

# Calcular as medias sazonais e somas mensais para cada acumulado
for season in JFM FMA MAM  SON OND NDJ DJF; do
	# Calculo da media Sazonal
	$CDO-seltimestep,$season-seasmean $input_dir ${output_dir}/${season}_sazonal.nc
	# Calculo soma mensal
	$CDO monsum ${output_dir}/${season}_sazonal.nc ${output_dir}/${season}_monthly_sum.nc
	#Selecionar o periodo climatologio_19912020
	$CDO seldate, 1991-01-31,2020-12-31 ${output_dir}/${season}_monthly_sum.nc ${output_dir}/${season}_media_climatology.nc
	# calculo de converter dados m para mm
	$CDO mulc,1000 ${output_dir}/${season}_media_climatology.nc ${output_dir}/${season}_media_convertido.nc	
done

echo "Seasonal e calculo mensal completo"
