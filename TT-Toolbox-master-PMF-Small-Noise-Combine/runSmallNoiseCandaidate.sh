for f in {1..5}; do
    sbatch runSmallClean_candidateData_10_"$f".sh
    sleep 2 
done 

for f in {1..5}; do
    sbatch runSmallClean_candidateData_11_"$f".sh
    sleep 2 
done

for f in {1..5}; do
    sbatch runSmallClean_candidateData_2_"$f".sh
    sleep 2
done

for f in {1..5}; do
    sbatch runSmallClean_candidateData_9_"$f".sh
    sleep 2
done
 
