#!/bin/bash
############################################
#SBATCH --job-name=quiz1
#SBATCH --partition=Centaurus
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=2
#SBATCH --time=2:00:00
#SBATCH --error=quiz1.e
#SBATCH --output=quiz1.o
############################################

# module load samtools
pwd
ls -alh
echo -e "first sentence.\nsecond sentence.\nthirdsentence." > sentenceFile.txt
grep -o "second" sentenceFile.txt
cd ../binf6203_001/Labs
cd ~/Downloads
# bash quiz1.slurm
# sbatch quiz1.slurm
# Lines 17 and 18 are commands to change the directory that refer to the file system on my computer, so these commands would not work on the cluster.
