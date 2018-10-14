function deblurred_image=LMS(kernel_fft,orig_image_fft,gamma)
%Estimate size of input image fft
[m, n, z]=size(orig_image_fft);

%initialize the estimate of Image
F=ones(m,n,z);
deblurred_image=ones(m,n,z);
%Laplacian operator matrix
P=[0 -1 0 ; -1 4 -1 ; 0 -1 0];
%calculate fft of Laplacian operator
P_fft=Myfft(P,m,n);
%Calculate the multiplication factor matrix in LMS
F_1=conj(kernel_fft)./(kernel_fft.*conj(kernel_fft)+P_fft*gamma);

for i=1:z
    %Estimated image's FFT
    F(:,:,i)= F_1.*orig_image_fft(:,:,i);
    %Calculate IFFT for restored image
    deblurred_image(:,:,i)=abs(Myifft(F(:,:,i)));
end


end