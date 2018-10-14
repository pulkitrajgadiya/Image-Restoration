function deblurred_image=FullInverseFilt(kernal_fft,orig_image_fft)

for i=1:3
%     G(:,:,i)=Myfft(orig_image(:,:,i));
    F(:,:,i)= orig_image_fft(:,:,i)./kernal_fft;
    deblurred_image(:,:,i)=abs((Myifft(F(:,:,i))));
end