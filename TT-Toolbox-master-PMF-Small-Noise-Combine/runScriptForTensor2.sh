for f in {1..10}; do
    sbatch runPMF-C_2_2_"$f".sh
    sleep 2
done

for f in {1..10}; do
    sbatch runPMF-C_2_3_"$f".sh
    sleep 2
done

for f in {1..10}; do
    sbatch runPMF-C_2_4_"$f".sh
    sleep 2
done

for f in {1..10}; do
    sbatch runPMF-C_2_5_"$f".sh
    sleep 2
done
