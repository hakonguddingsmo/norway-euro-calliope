#!/bin/bash

#SBATCH --ntasks=8
#SBATCH --time=216:00:00
#SBATCH --mem-per-cpu=32G
#SBATCH --output=run_multiple_updated.out

scenarios=(
  "norway_wind_unconstrained_norway_to_europe_trans_50"
  "norway_wind_unconstrained_norway_to_europe_trans"
  "norway_wind_unconstrained_norway_to_europe_trans_GBR_planned"
  "norway_wind_unconstrained_norway_to_europe_trans_80"
  "norway_wind_10GW_norway_to_europe_trans_50"
  "norway_wind_10GW_norway_to_europe_trans"
  "norway_wind_10GW_norway_to_europe_trans_GBR_planned"
  "norway_wind_10GW_norway_to_europe_trans_80"
  "norway_wind_5GW_norway_to_europe_trans_50"
  "norway_wind_5GW_norway_to_europe_trans"
  "norway_wind_5GW_norway_to_europe_trans_GBR_planned"
  "norway_wind_5GW_norway_to_europe_trans_80"
  "norway_wind_0GW_norway_to_europe_trans_50"
  "norway_wind_0GW_norway_to_europe_trans"
  "norway_wind_0GW_norway_to_europe_trans_GBR_planned"
  "norway_wind_0GW_norway_to_europe_trans_80"
  "norway_wind_0GW_norway_to_europe_trans_0"
  "norway_wind_5GW_norway_to_europe_trans_0"
  "norway_wind_10GW_norway_to_europe_trans_0"
  "norway_wind_unconstrained_norway_to_europe_trans_0"
  "norway_wind_0GW_unconstrained_trans"
  "norway_wind_5GW_unconstrained_trans"
  "norway_wind_10GW_unconstrained_trans"
  "norway_wind_unconstrained_unconstrained_trans"
)
for scenario in "${scenarios[@]:0:30}"
do
  OUTPUT_FOLDER="$scenario"
  calliope run ./norway-europe-model/example-model.yaml \
    --save_netcdf="./results/$OUTPUT_FOLDER/results.nc" \
    --save_csv="./results/$OUTPUT_FOLDER/results" \
    --save_plots="./results/$OUTPUT_FOLDER/results.html" \
    --scenario="$scenario"
done
