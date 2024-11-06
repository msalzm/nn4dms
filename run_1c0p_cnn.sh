#!/bin/bash

#SBATCH --job-name=cnn    # Job name
#SBATCH --output=output/output_cnn_pool%j.txt        # Output file
#SBATCH --error=output/error_cnn_pool%j.txt          # Error file
#SBATCH --time=02:00:00               # Time limit
#SBATCH --ntasks=1                    # Number of tasks
#SBATCH --gpus=2           # Number of CPU cores per task
#SBATCH --mem-per-cpu=16G 
#SBATCH --partition=normal            # Partition (adjust for your cluster)

# Set number of threads for multi-threading
#export OMP_NUM_THREADS=$SLURM_CPUS_PER_TASK
#export MKL_NUM_THREADS=$SLURM_CPUS_PER_TASK

module load stack/2024-06
conda init
conda activate nn4dms_gpu


# Run your Python script
python code/regression.py @regression_args/1c0p_pools2/0.txt
