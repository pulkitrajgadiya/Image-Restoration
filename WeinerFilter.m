function deblurred_image=WeinerFilter(kernel_fft,orig_image_fft,K)
%Extimate image size
[m, n, z]=size(orig_image_fft);

%F_2 is intermediate matrix( Initialization)
F_2=ones(m,n,z);
deblurred_image=ones(m,n,z);
%Calculate the multiplication factor matrix in weiner
% i.e H^2/(H^2+K)
F_1=kernel_fft.*conj(kernel_fft)./(kernel_fft.*conj(kernel_fft)+K);

for i=1:z
    F_2(:,:,i)= orig_image_fft(:,:,i)./kernel_fft;
    % F  is the weiner estimate of the image
    F(:,:,i)=F_1.*F_2(:,:,i);
    % Image after IDFT
    deblurred_image(:,:,i)=abs(Myifft(F(:,:,i)));
end

end