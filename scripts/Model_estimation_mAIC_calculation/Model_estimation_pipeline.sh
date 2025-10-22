#!/bin/bash

# iqtree_pipeline.sh
# Author: Changsen Jiang
# Description (For more description, see Section 2.3 in my thesis):
# This script runs a complete IQ-TREE phylogenetic analysis pipeline automatically on a given dataset directory.
# It supports both partitioned models and C60 profile mixture models,
# including automatic selection of best models based on AIC/mAIC scores and subsequent tree search.
#
# The pipeline includes:
#   1. Partition model selection and tree search using MF+MERGE on p/Q/q schemes
#   2. C60 initialization to identify the best-fit C60-based model
#   3. C60 model fitting (with and without +F, with and without weight optimization)
#   4. Model comparison between C60 and partitioned models
#   5. Final tree search under the best C60 model (only in full mode)
#
# Usage:
#   Place this script in the dataset folder (named after the dataset),
#   with a subfolder named "partition" containing p/q/Q alignment files,
#   and another subfolder named "c60" with the same alignment used for C60 models.
#
#   Then simply run:
#       bash iqtree_pipeline.sh
#
# Parameters (defined at the top of the script):
#   ns       - Number of taxa in the dataset (e.g. 20)
#   threads  - Maximum number of CPU threads to use
#   maxmem   - Maximum memory to allocate (e.g. 120G)
#   mode     - Analysis mode: "simple" (C60+F or C60±mwopt) or "full" (all C60 variants + tree search)
#
# Requirements:
#   - IQ-TREE 2 executable available as ../../iqtree2
#   - Python script `parameter_nex.py` (in the same directory as this script)
#   - GNU time, awk, grep, and bc (for shell-side processing)
#
# Output:
#   - Log file: analysis_<timestamp>.log
#   - IQ-TREE outputs under partition/ and c60/ directories
#   - Final tree search results using best model

set -e  # Exit immediately if any command fails

# Set input parameters
ns=20  # Number of species to analyze (e.g., 20)
threads=30  # Maximum number of threads
maxmem=120G  # Maximum memory limit
mode="full"  # Mode: simple or full
log="analysis_$(date '+%Y%m%d_%H%M%S').log"  # Log file name with timestamp
dataset=$(basename $(pwd))  # Get the current directory name as dataset

# Log basic information
echo "Starting IQ-TREE pipeline at $(date)" > "$log"  # Log start time
echo "Species: $ns, Threads: $threads, Max memory: $maxmem" >> "$log"  # Log config info
echo "Mode: $mode" >> "$log"

# Step 1: Partition Analysis
echo -e "\n1. Partition Analysis" >> "$log"
partition_dir="partition"

for dir in "$partition_dir"/*; do
    sub=$(basename "$dir")

    if [ ! -d "$dir" ]; then
        continue
    fi

    # Run MF analysis with conditional -mrate for "q"
    (
        cd "$dir"
        alignment="${ns}_concated.nex"
        threads_sub=$((threads / 4))

        task_mf="${dataset}${ns}_${sub}_mf"
        echo "$task_mf running at $(date)" >> "../../$log"

        if [[ "$sub" == "q" ]]; then
            /usr/bin/time -v -o "${task_mf}.txt" ../../../iqtree2 -s "$alignment" -${sub} "$alignment" -m MF+MERGE -mrate E,I,G,I+G -merit AIC -T $threads_sub -pre "$task_mf"
        else
            /usr/bin/time -v -o "${task_mf}.txt" ../../../iqtree2 -s "$alignment" -${sub} "$alignment" -m MF+MERGE -merit AIC -T $threads_sub -pre "$task_mf"
        fi

        echo "$task_mf completed at $(date)" >> "../../$log"
    ) &
done

wait  # Wait for all parallel tasks to finish

# Extract best AIC from p,Q,q
best_score=9999999999
best_sub=""
for sub in p Q q; do
    iqtree_file="${partition_dir}/${sub}/${dataset}${ns}_${sub}_mf.iqtree"
    if [ -f "$iqtree_file" ]; then
        score=$(grep "Akaike information criterion (AIC) score:" "$iqtree_file" | awk '{print $NF}')
        if (( $(echo "$score < $best_score" | bc -l) )); then
            best_score=$score
            best_sub=$sub
        fi
    fi
done

echo "Best partition: $best_sub with AIC: $best_score" >> "$log"

# Extract best mAIC from p,Q,q
best_score_maic=9999999999
best_sub_maic=""
for sub in p Q q; do
    iqtree_file="${partition_dir}/${sub}/${dataset}${ns}_${sub}_mf.iqtree"
    if [ -f "$iqtree_file" ]; then
        score=$(grep "(mAIC) score:" "$iqtree_file" | awk '{print $NF}')
        if (( $(echo "$score < $best_score_maic" | bc -l) )); then
            best_score_maic=$score
            best_sub_maic=$sub
        fi
    fi
done

echo "Best partition: $best_sub_maic with mAIC: $best_score_maic" >> "$log"

# Run partition best model treesearch (using best AIC)
echo "Current working directory before tree search: $(pwd)" >> "$log"
cd "${partition_dir}/${best_sub}"

best_model_nex="${dataset}${ns}_${best_sub}_mf.best_model.nex"
treefile="${dataset}${ns}_${best_sub}_mf.treefile"
task_search="${dataset}${ns}_${best_sub}_search"
echo "$task_search running at $(date)" >> "../../$log"

if [ ! -f "$best_model_nex" ]; then
    msg="Best model file $best_model_nex not found, aborting tree search."
    echo "$msg" | tee -a "../../$log" 
    exit 1
fi
if [ ! -f "$treefile" ]; then
    msg="Treefile $treefile not found, aborting tree search."
    echo "$msg" | tee -a "../../$log" 
    exit 1
fi


/usr/bin/time -v -o "${task_search}.txt" ../../../iqtree2 -s "${ns}_concated.nex" -${best_sub} "$best_model_nex" -t "$treefile" -T $threads -pre "$task_search"
echo "$task_search completed at $(date)" >> "../../$log"

cd ../..

# Step 2: C60 Initialization

echo -e "\n2. C60 Initialization" >> "$log"
c60_alignment="c60/${ns}_concated.nex"

if [ ! -f "$c60_alignment" ]; then
    msg="C60 initialization skipped due to missing ${ns}_concated.nex"
    echo "$msg" | tee -a "$log" 
    exit 1
fi

# Run initialization analysis
cd "c60"
task_init="${ns}${dataset}_c60_init"
echo "$task_init running at $(date)" >> "../$log"
/usr/bin/time -v -o "${task_init}.txt" ../../iqtree2 -s "${ns}_concated.nex" -m MF -merit AIC -T $threads -mem $maxmem -pre "$task_init"
echo "$task_init completed at $(date)" >> "../$log"
selected_model=$(grep "Best-fit model according to AIC:" ${task_init}.iqtree | awk -F": " '{print $2}')
echo "Selected model: $selected_model" >> "../$log"
cd ..

# Step 3: C60 Running

cd c60
echo -e "\n3. C60 Running ($mode mode)" >> "../$log"
treefile="../${partition_dir}/${best_sub}/$task_search.treefile"
c60_alignment_2="./${ns}_concated.nex"
if [ ! -f "$treefile" ]; then
    echo "Missing treefile $treefile, aborting C60 step." | tee -a "../$log"
    exit 1
fi

# Parse selected model
prefix=$(echo "$selected_model" | cut -d'+' -f1)  # Exchange matrix part, e.g. LG
suffix=$(echo "$selected_model" | cut -d'+' -f2-)  # Remaining model parts, e.g. F+I+R6 or I+R5

# Construct model strings
base_model="$prefix+C60+$suffix"
base_model_nof=$(echo "$base_model" | sed 's/+F//')  # Remove F if present

# Add F manually if not in original model
if [[ "$suffix" == *"F"* ]]; then
  base_model_f="$base_model"
else
  base_model_f="$prefix+C60+F+$suffix"
fi

threads_sub=$((threads / 2))  # Half threads
mem_sub="$(( ${maxmem%G} / 2 ))G"  # Half memory

# Run according to selected mode
if [[ "$mode" == "simple" ]]; then
    if [[ "$selected_model" == *"+F"* ]]; then
        # If model includes F, run only +F version
        task="${dataset}${ns}_c60_F"
        echo "$task running (simple: +F) at $(date)" >> "../$log"
        /usr/bin/time -v -o "${task}.txt" ../../iqtree2 -s "$c60_alignment_2" -m "$base_model" -te "$treefile" -T $threads -mem $maxmem -safe -pre "$task"
        echo "$task completed at $(date)" >> "../$log"
    else
        # Run two no-F models: with and without mwopt
        task_unopt="${dataset}${ns}_c60_unopt"
        task_opt="${dataset}${ns}_c60_opt"
        echo "$task_unopt running (simple: no F, no mwopt) at $(date)" >> "../$log"
        (
            /usr/bin/time -v -o "${task_unopt}.txt" ../../iqtree2 -s "$c60_alignment_2" -m "$base_model" -te "$treefile" -T $threads_sub -mem $mem_sub -safe -pre "$task_unopt"
            echo "$task_unopt completed at $(date)" >> "../$log"
        ) &

        echo "$task_opt running (simple: no F, with mwopt) at $(date)" >> "../$log"
        (
            /usr/bin/time -v -o "${task_opt}.txt" ../../iqtree2 -s "$c60_alignment_2" -m "$base_model" -te "$treefile" -mwopt -T $threads_sub -mem $mem_sub -safe -pre "$task_opt"
            echo "$task_opt completed at $(date)" >> "../$log"
        ) &
        wait  # Wait for two tasks
    fi
else
    # Full mode: always run three models
    task_f="${dataset}${ns}_c60_F"
    echo "$task_f running (C60+F, no mwopt) at $(date)" >> "../$log"
    /usr/bin/time -v -o "${task_f}.txt" ../../iqtree2 -s "$c60_alignment_2" -m "$base_model_f" -te "$treefile" -T $threads -mem $maxmem -safe -pre "$task_f"
    echo "$task_f completed at $(date)" >> "../$log"

    task_unopt="${dataset}${ns}_c60_unopt"
    task_opt="${dataset}${ns}_c60_opt"

    echo "$task_unopt running (C60 no F, no mwopt) at $(date)" >> "../$log"
    /usr/bin/time -v -o "${task_unopt}.txt" ../../iqtree2 -s "$c60_alignment_2" -m "$base_model_nof" -te "$treefile" -T $threads -mem $maxmem -safe -pre "$task_unopt"
    echo "$task_unopt completed at $(date)" >> "../$log"

    echo "$task_opt running (C60 no F, with mwopt) at $(date)" >> "../$log"
    /usr/bin/time -v -o "${task_opt}.txt" ../../iqtree2 -s "$c60_alignment_2" -m "$base_model_nof" -te "$treefile" -mwopt -T $threads -mem $maxmem -safe -pre "$task_opt"
    echo "$task_opt completed at $(date)" >> "../$log"
fi

cd ..

# After C60 Running, compare AIC scores
best_c60_score=9999999999
best_c60_task=""
for task in c60_F c60_unopt c60_opt; do
    iqtree_file="c60/${dataset}${ns}_${task}.iqtree"
    if [ -f "$iqtree_file" ]; then
        score=$(grep "(AIC) score:" "$iqtree_file" | awk '{print $NF}')
        if (( $(echo "$score < $best_c60_score" | bc -l) )); then
            best_c60_score=$score
            best_c60_task=$task
        fi
    fi
done
echo "Best C60: $best_c60_task with AIC: $best_c60_score" >> "$log"


# Compare Partition and C60
if (( $(echo "$best_c60_score < $best_score_maic" | bc -l) )); then
    echo "Best overall: C60 ($best_c60_task) with AIC: $best_c60_score" >> "$log"
else
    echo "Best overall: Partition ($best_sub_maic) with mAIC: $best_score_maic" >> "$log"
fi


# C60 treesearch in full mode
if [[ "$mode" == "full" ]]; then
    cd c60
    python3 ../parameter_nex.py "${dataset}${ns}_${best_c60_task}.iqtree" "${dataset}${ns}_${best_c60_task}.log" --outdir .

    # Check if the parameter NEXUS file exists
    nex_file="${dataset}${ns}_${best_c60_task}_parameter.nex"
    if [ ! -f "$nex_file" ]; then
        echo "NEXUS file $nex_file not found, aborting treesearch." >> "../$log"
        exit 1
    fi
    echo "Final C60 treesearch running at $(date)" >> "../$log"
    /usr/bin/time -v -o "${dataset}${ns}_c60_treesearch.txt" ../../iqtree2 -s "${ns}_concated.nex" -mdef "$nex_file" -m "$(grep '^model' "$nex_file" | awk '{print $2}')" -t "../${partition_dir}/${best_sub}/${task_search}.treefile" -T $threads --mem $maxmem -pre "${dataset}${ns}_c60_search"
    echo "Final C60 treesearch completed at $(date)" >> "../$log"
    cd ..
fi

echo "IQ-TREE pipeline finished at $(date)" >> "$log"
