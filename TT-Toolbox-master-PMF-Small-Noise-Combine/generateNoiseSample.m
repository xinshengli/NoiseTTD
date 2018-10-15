function para = generateNoiseSample(noiseDensity)



nd = noiseDensity;
para = zeros(3,1);
for i = 1:3
    tmpVal = 0;
    for k = i+1:4
        tmp = 1;
        for j = k:4
            tmp = tmp*nd(j);
        end
        if(tmp > 0.5)
            tmp = tmp*0.5;
        end
        tmpVal = tmpVal + tmp;
    end
    tmpVal1 = nd(i);
    if(tmpVal1>0.5)
        tmpVal1 = tmpVal1*0.5;
    end
    para(i) = tmpVal1+tmpVal;
end

para = para./sum(para);