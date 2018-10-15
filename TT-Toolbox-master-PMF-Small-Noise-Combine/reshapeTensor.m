function reshapeTensor(inputData)


load(inputData)


subs = spComTensor.subs;
vals = spComTensor.vals;
sizes = spComTensor.size;

subs = [subs(:,1) subs(:,3) subs(:,2) subs(:,4)]

sizes = [sizes(1) sizes(3) sizes(2) sizes(4)]

spComTensor = sptensor(subs, vals, sizes);



subs = noiseTensor.subs;
vals = noiseTensor.vals;
sizes = noiseTensor.size;

subs = [subs(:,1) subs(:,3) subs(:,2) subs(:,4)]

sizes = [sizes(1) sizes(3) sizes(2) sizes(4)]

noiseTensor = sptensor(subs, vals, sizes);

name = ['rev' inputData];

save()



randMisIdx = [randMisIdx(:,1) randMisIdx(:,3) randMisIdx(:,2) randMisIdx(:,4)];



noiseDensity = [noiseDensity(1) noiseDensity(3) noiseDensity(2) noiseDensity(4)];

save(name, 'spComTensor','noiseTensor','randMisIdx','noiseDensity');
