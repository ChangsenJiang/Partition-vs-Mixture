#!/usr/bin/env python3
import re
import sys

def convert_sci_to_decimal(match):
    sci_num = match.group(0)
    dec_num = format(float(sci_num), '.20f').rstrip('0').rstrip('.')
    conversions.append((sci_num, dec_num))
    return dec_num

def convert_file(input_path, output_path):
    sci_pattern = re.compile(r'[-+]?\d+(?:\.\d+)?[eE][-+]?\d+')

    with open(input_path, 'r') as infile:
        content = infile.read()

    converted_content = sci_pattern.sub(convert_sci_to_decimal, content)

    with open(output_path, 'w') as outfile:
        outfile.write(converted_content)

    # Print the list of conversions
    if conversions:
        print("\nConverted numbers:")
        for original, converted in conversions:
            print(f"{original} -> {converted}")
    else:
        print("\nNo numbers in scientific notation were found.")

if __name__ == "__main__":
    conversions = []
    if len(sys.argv) != 3:
        print("Usage: python convert_sci_to_decimal.py <input_file> <output_file>")
    else:
        input_file = sys.argv[1]
        output_file = sys.argv[2]
        convert_file(input_file, output_file)
