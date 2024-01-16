#!/bin/bash
#SBATCH --partition=cbr_q_t
#SBATCH --ntasks=22
#SBATCH --cpus-per-task=2
#SBATCH --nodes=1
#SBATCH --exclusive
#SBATCH --nodelist=node51
#SBATCH --output=chrombpnet.log
#SBATCH --error=chrombpnet.err


source  activate chrombpnet_new

while read p; do
        srun --exclusive -N1 -n1 --cpus-per-task=2 bash -c "chrombpnet snp_score -snps $p/chr.txt -g ~/../shweta_lab/data/genomes/GRCh38_full_analysis_set_plus_decoy_hla.fa -op $p/output -m $p/ENCSR146KFX_bias_fold_0.h5" &
done < "list"

wait
