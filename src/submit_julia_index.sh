#!/bin/bash
#SBATCH --job-name=julia
######SBATCH --mail-user=a.barth@ulg.ac.be
######SBATCH --mail-type=ALL
#SBATCH --output=output-%N-%j.out
#SBATCH --time=24:00:00
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --mem-per-cpu=4000

module load  EasyBuild  Python/3.5.1-foss-2016a

export script="$1"
export INDEX="$2"
echo script $script

bt0=$(date +%s)

unset DISPLAY
#printenv

julia <<EOF
include("$script")
EOF

bt1=$(date +%s)

awk  " BEGIN { print \"Run time (hours): \",($bt1 - $bt0)/3600 } "



