#!/bin/bash

files=( $(cut -d ',' -f1 rmfiles.txt ) )

echo $files[1]

for i in "${!files[@]}"; do
    rm ${files[${i}]}
done