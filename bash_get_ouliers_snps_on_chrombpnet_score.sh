#!/bin/bash  



for i in {1..22};

do
   #cp ../input_data/chr_$i .
   grep -w "chr${i}" varients_info_m1_new.txt > temp${i}
   #mkdir model1/output_chr_$i
   #cp ENCSR146KFX_bias_fold_0.h5 model1/output_chr_$i
   #cp input_files/temp_chr"$i".vcf model1/output_chr_$i

   
done
wait
for i in {1..22};

do
 
   zcat ~/../shweta_lab/data/GI/5750callset/5750SNV_chr${i}_snvsBiallelic98missQUAL30TagsMAC2GQ10AB.vcf.gz | grep -v "#" | awk 'BEGIN{FS=OFS="\t"} FNR==NR{arr[$1,$2];next} (($1,$2) in arr)' temp${i} - > outliers_chr${i}.vcf &

   #echo "chr$i" 
   #grep "chr$i'$'\t" test_input > temp1
   #grep "chr$i"''$'\t' ../input_data/GI_input > temp1
   #awk 'BEGIN{FS="[\t,]"} {print $1"\t"$2"\t"$3"\t"$4; print $1"\t"$2"\t"$3"\t"$5}'  temp1 > temp2
   #awk '$4 != ""' temp2 > temp3
   #awk  'length($3) == 1 { print }' temp3 | awk  'length($4) == 1 { print }' > input_files/chr$i.txt 
   #cp job_script_m1.sh model1/output_chr_$i

   #cd model1/output_chr_$i
   #cp temp_chr"$i".vcf chr.txt
   #pwd
   #module load python3.8.17
   #nohup chrombpnet snp_score -snps chr.txt -g ~/../shweta_lab/data/genomes/GRCh38_full_analysis_set_plus_decoy_hla.fa -op output -m ENCSR146KFX_bias_fold_0.h5  &
   #sbatch job_script_m1.sh
   #cd ../../
  # sbatch job_sript.sh
done
 
wait
