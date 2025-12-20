#!/usr/bin/env python3

import os
import argparse
import re


def parse_nexus(nexus_path):
    with open(nexus_path, 'r') as file:
        lines = file.readlines()

    header, matrix, footer = [], [], []
    in_matrix = False

    for line in lines:
        if line.strip().lower() == 'matrix':
            in_matrix = True
            header.append(line)
            continue

        if in_matrix:
            if line.strip() == ';':
                in_matrix = False
                footer.append(line)
            else:
                matrix.append(line)
        elif not in_matrix and not matrix:
            header.append(line)
        else:
            footer.append(line)

    return header, matrix, footer


def get_base_filename(nexus_file):
    base = os.path.basename(nexus_file)
    name = re.sub(r'\.nex$|\.nexus$', '', base, flags=re.IGNORECASE)
    return name


def update_ntax_in_header(header, new_ntax):
    updated_header = []
    for line in header:
        if 'dimensions' in line.lower() and 'ntax=' in line.lower():
            updated_line = re.sub(
                r'(ntax\s*=\s*)\d+',
                lambda m: m.group(1) + str(new_ntax),
                line,
                flags=re.IGNORECASE
            )
            updated_header.append(updated_line)
        else:
            updated_header.append(line)
    return updated_header


def write_sub_nexus(base_output_dir, removed_seq_name, header, matrix, footer, output_name, original_count):
    # Define the folder structure
    dirs = [
        os.path.join(base_output_dir, 'partition', 'p'),
        os.path.join(base_output_dir, 'partition', 'Q'),
        os.path.join(base_output_dir, 'c60')
    ]

    # Create directories if not exist
    for d in dirs:
        os.makedirs(d, exist_ok=True)

    # Update ntax using the original sequence count (stable)
    new_ntax = original_count - 1
    updated_header = update_ntax_in_header(header, new_ntax)

    # Generate nexus content without the removed sequence (blank-line safe)
    filtered_matrix = []
    for line in matrix:
        if not line.strip():
            # Keep blank lines as-is to preserve formatting
            filtered_matrix.append(line)
            continue

        parts = line.split()
        # Safety: if somehow the line has no tokens, keep it
        if not parts:
            filtered_matrix.append(line)
            continue

        taxon = parts[0]
        if taxon != removed_seq_name:
            filtered_matrix.append(line)

    # Write files into each specified directory
    for d in dirs:
        output_file = os.path.join(d, output_name)
        with open(output_file, 'w') as f:
            f.writelines(updated_header)
            f.writelines(filtered_matrix)
            f.writelines(footer)


def main(nexus_file):
    header, matrix, footer = parse_nexus(nexus_file)

    # Extract sequence names from non-empty lines only
    sequence_names = [line.split()[0] for line in matrix if line.strip()]
    original_count = len(sequence_names)

    base_name = get_base_filename(nexus_file)
    base_name = re.sub(r'^\d+_', '', base_name)

    base_dir = os.path.dirname(os.path.abspath(nexus_file))

    for seq_name in sequence_names:
        output_dir = os.path.join(base_dir, seq_name)
        output_name = f"{original_count - 1}_{base_name}.nex"
        write_sub_nexus(output_dir, seq_name, header, matrix, footer, output_name, original_count)


if __name__ == '__main__':
    parser = argparse.ArgumentParser(
        description='Generate sub-alignments from a nexus file by removing each sequence.'
    )
    parser.add_argument('nexus_file', help='Path to the input nexus file')

    args = parser.parse_args()
    main(args.nexus_file)
