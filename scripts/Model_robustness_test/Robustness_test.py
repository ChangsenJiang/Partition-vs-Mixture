#!/usr/bin/env python3

"""
Robustness_test.py

Description:
------------
This script computes pairwise tree distances using the Lin-Rajan-Moret (LRM) metric for all `.treefile` files in a specified directory.
It performs two types of comparisons:
1. All-vs-all pairwise comparisons (excluding the reference).
2. Each tree compared to a 'reference.treefile' (to-Ref LRM)

The results include:
- LRM distances for each pair
- Summary statistics: mean, standard deviation, and median
- Separate reporting for distances to the reference tree

Requirements:
-------------
- cogent3 package (for tree parsing and LRM distance computation)

Usage:
------
    python Robustness_test.py <input_dir> [-o <output_file>]

Arguments:
----------
    input_dir       Path to the folder containing multiple `.treefile` trees,
                    including a mandatory 'reference.treefile'.

Options:
--------
    -o, --output    Output file name (default: lrm_distances.txt)

Example:
--------
    python Robustness_test.py ./trees --output ascomycota_lrm.txt

"""
import argparse
from pathlib import Path
from cogent3 import load_tree
from itertools import combinations
from statistics import mean, stdev, median

def parse_args():
    parser = argparse.ArgumentParser(description="Compute pairwise LRM distances including reference.")
    parser.add_argument("input_dir", help="Path to the folder containing .treefile files including 'reference.treefile'")
    parser.add_argument("-o", "--output", default="lrm_distances.txt", help="Output txt file name (default: lrm_distances.txt)")
    return parser.parse_args()

def compute_lrm_distances(input_dir, output_file):
    input_path = Path(input_dir).resolve()
    tree_files = sorted(list(input_path.glob("*.treefile")))

    if len(tree_files) < 2:
        print("[ERROR] Need at least two .treefile files to compute pairwise distances.")
        return

    # Load all trees
    trees = {f.stem: load_tree(str(f)) for f in tree_files}

    if 'reference' not in trees:
        print("[ERROR] Missing 'reference.treefile' in the input directory.")
        return

    reference_tree = trees.pop('reference')

    results = []
    # Pairwise comparison excluding reference
    for (name1, tree1), (name2, tree2) in combinations(trees.items(), 2):
        shared_tips = set(tree1.get_tip_names()) & set(tree2.get_tip_names())
        if len(shared_tips) < 3:
            print(f"[WARNING] Skipping {name1} vs {name2}: too few shared tips ({len(shared_tips)})")
            continue
        pruned1 = tree1.get_sub_tree(shared_tips)
        pruned2 = tree2.get_sub_tree(shared_tips)
        try:
            d = pruned1.tree_distance(pruned2, method="lin_rajan_moret")
            results.append((name1, name2, d))
        except Exception as e:
            print(f"[WARNING] Error comparing {name1} and {name2}: {e}")

    # Write pairwise results to output
    with open(output_file, "w") as out:
        for name1, name2, d in results:
            out.write(f"LRM between {name1} and {name2}: {d:.6f}\n")

        dists = [float(r[2]) for r in results]
        if dists:
            out.write("\n")
            out.write(f"Mean LRM: {mean(dists):.6f}\n")
            out.write(f"Std LRM: {stdev(dists):.6f}\n" if len(dists) > 1 else "Std LRM: N/A\n")
            out.write(f"Median LRM: {median(dists):.6f}\n")

        # Separator
        out.write("\n" + "="*40 + "\n\n")

        # Comparison to reference
        ref_results = []
        for name, tree in trees.items():
            shared_tips = set(tree.get_tip_names()) & set(reference_tree.get_tip_names())
            if len(shared_tips) < 3:
                print(f"[WARNING] Skipping {name} vs reference: too few shared tips ({len(shared_tips)})")
                continue
            pruned_tree = tree.get_sub_tree(shared_tips)
            pruned_ref = reference_tree.get_sub_tree(shared_tips)
            try:
                d = pruned_tree.tree_distance(pruned_ref, method="lin_rajan_moret")
                ref_results.append((name, d))
                out.write(f"LRM between {name} and reference: {d:.6f}\n")
            except Exception as e:
                print(f"[WARNING] Error comparing {name} and reference: {e}")

        ref_dists = [float(r[1]) for r in ref_results]
        if ref_dists:
            out.write("\n")
            out.write(f"Mean LRM to reference: {mean(ref_dists):.6f}\n")
            out.write(f"Std LRM to reference: {stdev(ref_dists):.6f}\n" if len(ref_dists) > 1 else "Std LRM to reference: N/A\n")
            out.write(f"Median LRM to reference: {median(ref_dists):.6f}\n")

    print(f"[INFO] LRM distances written to: {output_file}")

if __name__ == "__main__":
    args = parse_args()
    compute_lrm_distances(args.input_dir, args.output)
