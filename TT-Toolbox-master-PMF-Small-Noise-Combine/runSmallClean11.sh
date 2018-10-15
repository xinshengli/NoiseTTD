#!/bin/bash
 
#SBATCH -p serial                   # Send this job to the serial partition
#SBATCH -n 8                        # number of cores
#SBATCH -t 1-00:00                  # wall time (D-HH:MM)
#SBATCH -o slurm.%j.out             # STDOUT (%j = JobId)
#SBATCH -e slurm.%j.err             # STDERR (%j = JobId)
#SBATCH --mail-type=END,FAIL        # notifications for job done & fail
#SBATCH --mail-user=lxinshen@asu.edu # send-to address
module load gcc/6.3.0
module load matlab/2016b
cd /home/lxinshen/SaguaroTTPMF/TT-Toolbox-master-PMF-Small-Noise/
matlab -nodisplay -nosplash -nodesktop -r "runSmallClean11('compressTensorPackage')"
