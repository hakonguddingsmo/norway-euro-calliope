#!/bin/bash

#SBATCH --ntasks=8
#SBATCH --time=8:00:00
#SBATCH --mem-per-cpu=32G
#SBATCH --output=base_case.out

NAME="base_case"

OUTPUT_FOLDER="$NAME"

SCENARIO="$NAME"

calliope run ./norway-europe-model/example-model.yaml --save_netcdf="./results/$OUTPUT_FOLDER/results.nc" --save_csv="./results/$OUTPUT_FOLDER/results" --save_plots="./results/$OUTPUT_FOLDER/results.html" --scenario=$SCENARIO
