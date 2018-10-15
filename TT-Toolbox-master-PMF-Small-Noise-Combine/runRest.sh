for f in {1..10}; do
    sbatch runPMF-C_1_5_"$f".sh
    sleep 2
done
