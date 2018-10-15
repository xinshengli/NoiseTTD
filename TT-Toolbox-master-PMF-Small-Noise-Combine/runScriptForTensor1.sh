for f in {1..10}; do
    sbatch runPMF-C_1_2_"$f".sh
    sleep 2
done

for f in {1..10}; do
    sbatch runPMF-C_1_3_"$f".sh
    sleep 2
done

for f in {1..10}; do
    sbatch runPMF-C_1_4_"$f".sh
    sleep 2
done
