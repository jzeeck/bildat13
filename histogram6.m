ret = histeq(nallo256,256,1)
figure('name','histeg nallo');
showgray(ret);

%{
ret = histeq(nallo256what,256,1)
figure('name','histeg nallowhat');
showgray(ret);
figure('name','3th root of nallow what');
showgray(nallo256what.^(1/3));
%}
%what = phonecalc256;
%ret = histeq(what,256,1)
%figure('name','histeg phone');
%showgray(ret);
