

for i in {1..22}; do
echo "${i}"

while read p; do



zcat /gpfs/data/user/shweta_lab/data/roadmap/egg2.wustl.edu/roadmap/withgh38liftover/${p} | awk -F"\t" '{print $1"\t"$2"\t"$3"\t"$4}' - > anno_af_chrom3/temp_${p} 


#echo "${p}"

#for i in {1..2}; do

    #touch temp.bed
    #echo "${i}"
    # Concatenate header and outliers files
    #cat ../vcf_header/header_chr${i}.vcf outliers_chr${i}.vcf > temp${i}_sorted.vcf 

    # Sort the input VCF file
    awk -F"," '{print $1"\t"$2"\t"$2}' /gpfs/data/user/himanshu/chrombpnet_old/bash_scripts/snp_pred_191223/analysis/model1/anno_af_chrom_new/allele_freq_chr${i}_gene_ncr.tsv_chr_${i}.csv > anno_af_chrom3/temp${i}.bed 
    #cp anno_af_chrom/allele_freq_chr${i}_gene_ncr.tsv_chr_${i}.csv anno_af_chrom3/temp${i}.bed
    
    #sed -i 's/,/\t/g' anno_af_chrom3/temp${i}.bed 
#     /gpfs/data/user/himanshu/chrombpnet_old/bash_scripts/snp_pred_191223/analysis/model1/anno_af_chrom/allele_freq_chr${i}_gene_ncr.tsv_chr_${i}.csv > anno_af_chrom3/temp.bed
#    awk -F"," '{print $1"\t"$2"\t"$2}' /gpfs/data/user/himanshu/chrombpnet_old/bash_scripts/snp_pred_191223/analysis/model1/anno_af_chrom/allele_freq_chr${i}_gene_ncr.tsv_chr_${i}.csv > anno_af_chrom3/temp.bed
    sed -i '1d' anno_af_chrom3/temp${i}.bed  

    bedtools sort -i anno_af_chrom3/temp${i}.bed > anno_af_chrom3/temp_sorted${i}.bed 
    #bedtools sort -i outliers_chr${i}.vcf > temp${i}_sorted.sorted.vcf &
    
    # Use bedtools intersect to get regions within the exon.bed file
    bedtools intersect -a anno_af_chrom3/temp_sorted${i}.bed -b anno_af_chrom3/temp_${p} -wa -wb > anno_af_chrom3/gene_chr${i}_${p}.vcf 
    # Use bedtools subtract to get regions outside the exon.bed file
    #bedtools subtract -a temp${i}_sorted.vcf -b exon.bed > outliers_chr${i}_ncr.vcf 
#done 
#wait

done < "tissue_data.txt"
done

rm anno_af_chrom3/temp*
