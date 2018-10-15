for f in {1..10}; do
    sbatch runPMF-C_3_2_"$f".sh
    sleep 2
done

for f in {1..10}; do
    sbatch runPMF-C_3_3_"$f".sh
    sleep 2
done

for f in {1..10}; do
    sbatch runPMF-C_3_4_"$f".sh
    sleep 2
done

for f in {1..10}; do
    sbatch runPMF-C_3_5_"$f".sh
    sleep 2
done
