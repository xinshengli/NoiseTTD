for f in {1..10}; do
    sbatch runPMF-C_4_2_"$f".sh
    sleep 2
done

for f in {1..10}; do
    sbatch runPMF-C_4_3_"$f".sh
    sleep 2
done

for f in {1..10}; do
    sbatch runPMF-C_4_4_"$f".sh
    sleep 2
done

for f in {1..10}; do
    sbatch runPMF-C_4_5_"$f".sh
    sleep 2
done
