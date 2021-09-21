#!/usr/bin/env python3
import sys
import json


def main(json_file):
    with open(json_file, "r") as f:
        data = json.load(f)
    if 'sha256sums' in data:
        for (k, v) in data['sha256sums'].items():
            print(k, v)


if __name__ == '__main__':
    main(sys.argv[1])
