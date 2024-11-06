#!/bin/bash

#SBATCH --job-name=cnn    # Job name
#SBATCH --output=output/output_cnn_pool%j.txt        # Output file
#SBATCH --error=output/error_cnn_pool%j.txt          # Error file
#SBATCH --time=08:00:00               # Time limit
#SBATCH --ntasks=1                    # Number of tasks
#SBATCH --gpus=2                      # Number of GPUs
#SBATCH --mem-per-cpu=16G 
#SBATCH --partition=normal            # Partition (adjust for your cluster)

# Set number of threads for multi-threading
#export OMP_NUM_THREADS=$SLURM_CPUS_PER_TASK
#export MKL_NUM_THREADS=$SLURM_CPUS_PER_TASK

module load stack/2024-06
conda init
conda activate nn4dms_gpu

# Loop through each file in each of the 1c0p_run directories
for dir in regression_args/1c0p_run/*; do
    if [ -d "$dir" ]; then  # Check if it is a directory
        for file in "$dir"/*.txt; do  # Loop through each .txt file in the directory
            echo "Running $file"
            # Run the Python script with the current file as an argument
            python code/regression.py @"$file"
        done
    fi
done
