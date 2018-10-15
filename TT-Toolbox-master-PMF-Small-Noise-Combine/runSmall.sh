#!/bin/bash
for f in {1..10}; do
    sbatch runClean_"$1"_29_"$2"_"$f".sh
    sleep 2 
done 
