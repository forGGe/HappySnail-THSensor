#!/usr/bin/env python3

import sys
import json
import time
import argparse
import csv

parser = argparse.ArgumentParser()
parser.add_argument("input", help="input BOM file",
                    type=str)
parser.add_argument("output", help="PartsBox output file",
                    type=str)
args = parser.parse_args()

fieldnames = [ 'Id', 'Designator', 'Package', 'Quantity', 'Designation', 'Supplier and ref', '' ]

with open(args.input) as csv_file:
    with open(args.output, 'w') as out_file:
        csv_reader = csv.DictReader(csv_file, delimiter=',')

        csv_writer = csv.DictWriter(out_file, delimiter=';', fieldnames=fieldnames)
        csv_writer.writeheader()

        for row in csv_reader:
            new_row = {
                'Id': row['Component'],
                'Designator': row['References'],
                'Package': row['Footprint'],
                'Quantity': row['Quantity Per PCB'],
                'Designation': row['MPN'],
                'Supplier and ref': '',
                '': ''
            }
            csv_writer.writerow(new_row)



