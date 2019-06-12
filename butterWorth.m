function filtered_image_final = butterWorth(input_image,d0,order)
%estimate size of nput image
[m, n, z] = size(input_image);
disp('ButterWorth!!')
M=2*m-1;
N=2*n-1;

% Initialize filter
butter_filt = ones(M,N);
%Estimate Butter filter
for i = 1:M
    for j =1:N
        %Calculate distance of each factor from origin(center)
        D = sqrt((i-m)^2+(j-n)^2);
        %Calculate value of butter filter on given cutoff
        butter_filt(i,j)= 1./(1 + (D/d0)^(2*order));
    end
end
% Initialize all the required matrices to speed up the process not ness.
fftI=ones(M,N,z);
filtered_image_fft=ones(M,N,z);
filtered_image=ones(M,N,z);
filtered_image_final=ones(m,n,z);

for i = 1:z
    %Calculate fft of the image and shift the fft in center
   fftI(:,:,i) = fftshift(Myfft(input_image(:,:,i),M,N));
   %Apply the butter worth filter and again shift the image
   filtered_image_fft(:,:,i) = ifftshift( butter_filt.*fftI(:,:,i));
   % Calculate IFFT of the bigger image
   filtered_image(:,:,i) = abs(Myifft(filtered_image_fft(:,:,i)));
   %truncate the image to original size
   filtered_image_final(:,:,i) = filtered_image(1:m,1:n,i);
end

end
