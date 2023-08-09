#!/bin/bash
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=32
#SBATCH --error='job-%j-error.out'
#SBATCH --output='job-%j-out.out'
#SBATCH --export=ALL
#SBATCH --chdir=/nfs/home/cas96273/Thesis_Code/pypsa-earth-sec

module purge
module load Anaconda3
module load Java
source activate /nfs/home/cas96273/.conda/envs/pypsa-earth

export GRB_LICENSE_FILE=/nfs/home/cas96273/gurobi.lic

rm /nfs/home/cas96273/Thesis_Code/pypsa-earth/networks/elec.nc
rm /nfs/home/cas96273/Thesis_Code/pypsa-earth/networks/elec_s.nc

cp config.pypsa-earth_conservative_2050.yaml config.pypsa-earth.yaml
cp config_2050_cons.yaml config.yaml

#snakemake -j 32 plot_summary

cp config_2050_cons_Qs.yaml config.yaml

snakemake -j 32 plot_summary


# rm /nfs/home/cas96273/Thesis_Code/pypsa-earth/networks/elec.nc
# rm /nfs/home/cas96273/Thesis_Code/pypsa-earth/networks/elec_s.nc

# cp config.pypsa-earth_realistic_2050.yaml config.pypsa-earth.yaml
# cp config_2050_real.yaml config.yaml

# snakemake -j 32 plot_summary

# cp config_2050_real_Qs.yaml config.yaml

# snakemake -j 32 plot_summary


# rm /nfs/home/cas96273/Thesis_Code/pypsa-earth/networks/elec.nc
# rm /nfs/home/cas96273/Thesis_Code/pypsa-earth/networks/elec_s.nc

# cp config.pypsa-earth_optimistic_2050.yaml config.pypsa-earth.yaml
# cp config_2050_opt.yaml config.yaml

# snakemake -j 32 plot_summary

# cp config_2050_opt_Qs.yaml config.yaml

# snakemake -j 32 plot_summary