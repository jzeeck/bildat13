subplot(1,3,1)
showgrey(pow2image(phonecalc128, 0.0000000001))
subplot(1,3,2)
showgrey(pow2image(few128, 0.0000000001))
subplot(1,3,3)
showgrey(pow2image(nallo128, 0.0000000001))

figure;
subplot(1,3,1)
showgrey(randphaseimage(phonecalc128))
subplot(1,3,2)
showgrey(randphaseimage(few128))
subplot(1,3,3)
showgrey(randphaseimage(nallo128))