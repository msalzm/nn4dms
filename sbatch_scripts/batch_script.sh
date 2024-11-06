#!/bin/bash

#SBATCH --job-name=cnn    # Job name
#SBATCH --output=output/output_cnn%j.txt        # Output file
#SBATCH --error=output/error_cnn%j.txt          # Error file
#SBATCH --time=08:00:00               # Time limit
#SBATCH --ntasks=1                    # Number of tasks
#SBATCH --gpus=2           # Number of CPU cores per task
#SBATCH --mem-per-cpu=16G 
#SBATCH --partition=normal            # Partition (adjust for your cluster)

# Set number of threads for multi-threading
#export OMP_NUM_THREADS=$SLURM_CPUS_PER_TASK
#export MKL_NUM_THREADS=$SLURM_CPUS_PER_TASK

module load stack/2024-06
conda activate nn4dms_gpu


# Run your Python script
python code/regression.py @regression_args/example_run/0.txt
python code/regression.py @regression_args/example_run/1.txt
python code/regression.py @regression_args/example_run/2.txt
python code/regression.py @regression_args/example_run/3.txt
python code/regression.py @regression_args/example_run/4.txt
python code/regression.py @regression_args/example_run/5.txt
python code/regression.py @regression_args/example_run/6.txt
python code/regression.py @regression_args/example_run/7.txt
python code/regression.py @regression_args/example_run/8.txt

