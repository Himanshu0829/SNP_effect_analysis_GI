#!/bin/bash
#SBATCH --partition=cbr_q_huge
#SBATCH --ntasks=22
#SBATCH --cpus-per-task=1
#SBATCH --nodes=1
#SBATCH --exclusive
#SBATCH --nodelist=node37
#SBATCH --output=annovar.log
#SBATCH --error=annovar.err


#source  activate chrombpnet_new

while read p; do
    #srun --exclusive -N1 -n1 --cpus-per-task=1 bash -c "zcat ${p}_ncr.vcf.gz | ../annovar/annovar/table_annovar.pl -  ~/../shweta_lab/data/gnomad -buildver hg38 -out annovar/anovar_${p} -remove -protocol gnomad40_genome -operation f -nastring . -vcfinput -polish" &
    srun --exclusive -N1 -n1 --cpus-per-task=1 bash -c "zcat ${p}_gene_ncr.vcf.gz | ../annovar/annovar/table_annovar.pl -  ~/../shweta_lab/data/gnomad -buildver hg38 -out annovar/anovar_gene_${p} -remove -protocol gnomad40_genome -operation f -nastring . -vcfinput -polish" &
done < "list"



wait
