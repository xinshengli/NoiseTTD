for f in {1..10}; do
    sbatch runPMF-C_1_5_"$f".sh
    sleep 2
done

for f in {1..10}; do
    sbatch runPMF-C_2_5_"$f".sh
    sleep 2
done

for f in {1..10}; do
    sbatch runPMF-C_3_5_"$f".sh
    sleep 2
done

for f in {1..10}; do
    sbatch runPMF-C_4_5_"$f".sh
    sleep 2
done
