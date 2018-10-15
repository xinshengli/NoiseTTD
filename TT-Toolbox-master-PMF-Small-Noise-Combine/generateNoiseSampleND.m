function para = generateNoiseSampleND(noiseDensity)



nd = noiseDensity;
para = zeros(3,1);
for i = 1:3
    if(nd(i)>0.5)
        tmpVal1 = nd(i)*0.5;
    else
        tmpVal1 = nd(i);
    end
    if(nd(i+1)>0.5)
        tmpVal2 = nd(i+1)*0.5;
    else
        tmpVal2 = nd(i+1);
    end
    para(i) = tmpVal1+tmpVal2;
end

para = para./sum(para);
