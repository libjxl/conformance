#!/usr/bin/env python3
import sys
import json


def main(filename, sha, json_file):
    with open(json_file, "r") as f:
        data = json.load(f)
    data.setdefault('sha256sums', dict())[filename] = sha
    with open(json_file, "w") as f:
        json.dump(data, f, indent=2)


if __name__ == '__main__':
    main(sys.argv[1], sys.argv[2], sys.argv[3])
