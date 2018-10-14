function inv_image=Myifft(input_fft)
% disp('IFFT Calculating..')

%Estimate size of input image
[M,N] = size(input_fft);
%Calculate twiddle factor for both M and N
WN=exp(-2j*pi/N);
WM=exp(-2j*pi/M);
%Initialize twiddle matrices
twiddle_M=ones(M,M);
twiddle_N=ones(N,N);

%Calculate twiddle factor matrix for M
for i= 1:M
    for j=1:M
        twiddle_M(i,j)=WM^((i-1)*(j-1));
    end
end

%Calculate twiddle factor matrix for N
for i= 1:N
    for j=1:N
        twiddle_N(i,j)=WN^((i-1)*(j-1));
    end
end

%Calculate twiddle factor matrix inverse
inverse_M=(twiddle_M');
inverse_N=(twiddle_N');
%Finally Calculate inverse DFT
inv_image=(inverse_M*input_fft*inverse_N)./(M*N);
% imshow(inv_image);
