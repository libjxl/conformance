#!/bin/bash
cd "$(dirname "$(realpath $0)")/.."

ln -s ../../scripts/upload_and_symlink.sh .git/hooks/pre-commit
ln -s ../../scripts/download_and_symlink.sh .git/hooks/post-checkout
