#!/bin/bash

#SBATCH --ntasks=8
#SBATCH --time=168:00:00
#SBATCH --mem-per-cpu=32G
#SBATCH --output=output_multiple.out

scenarios=(
  "norway_wind_unconstrained_norway_to_europe_trans_50_2050"
  "norway_wind_unconstrained_norway_to_europe_trans_2050"
  "norway_wind_unconstrained_norway_to_europe_trans_GBR_planned_2050"
  "norway_wind_unconstrained_norway_to_europe_trans_80_2050"
  "norway_wind_10GW_norway_to_europe_trans_50_2050"
  "norway_wind_10GW_norway_to_europe_trans_2050"
  "norway_wind_10GW_norway_to_europe_trans_GBR_planned_2050"
  "norway_wind_10GW_norway_to_europe_trans_80_2050"
  "norway_wind_5GW_norway_to_europe_trans_50_2050"
  "norway_wind_5GW_norway_to_europe_trans_2050"
  "norway_wind_5GW_norway_to_europe_trans_GBR_planned_2050"
  "norway_wind_5GW_norway_to_europe_trans_80_2050"
  "norway_wind_0GW_norway_to_europe_trans_50_2050"
  "norway_wind_0GW_norway_to_europe_trans_2050"
  "norway_wind_0GW_norway_to_europe_trans_GBR_planned_2050"
  "norway_wind_0GW_norway_to_europe_trans_80_2050"
)
for scenario in "${scenarios[@]:0:16}"
do
  OUTPUT_FOLDER="$scenario"
  calliope run ./norway-europe-model/example-model.yaml \
    --save_netcdf="./results/$OUTPUT_FOLDER/results.nc" \
    --save_csv="./results/$OUTPUT_FOLDER/results" \
    --save_plots="./results/$OUTPUT_FOLDER/results.html" \
    --scenario="$scenario"
done
