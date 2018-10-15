for d in {1..4}; do
    for e in {2..5}; do
        for f in {1..5}; do
           sbatch runPMF-C_"$d"_"$e"_"$f".sh
           sleep 2 
        done 
    done
done
