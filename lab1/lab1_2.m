ninepic = indexpic9;
figure('name', 'nine raw0');
image(ninepic);
figure('name', 'nine raw1');
temp = rawsubsample(ninepic);
image(temp);
figure('name', 'nine raw2');
temp = rawsubsample(temp);
image(temp);



p = phonecalc256;
figure('name','phone raw2');
showgray(rawsubsample(rawsubsample(p)),256);

figure('name','phone bin2');
showgray(binsubsample(binsubsample(p)),256);


