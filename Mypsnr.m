function peaksnr = Mypsnr(image,ground_truth )
%%Find the maximum dynamic range of the images
% Max=max(max(max(max(image))),max(max(max(ground_truth))));
Max=1;
%Size of the is being calculated
[m,n,z]=size(image);
%variable sum0 is the summation of mean square error
sum0=0;
%Three for loops iterates over each and every pixel of the image
for kk=1:z
    for ii=1:m
        for jj=1:n
            sum0=sum0+(image(ii,jj,kk)-ground_truth(ii,jj,kk))^2;
        end
    end
end
% Formula for PSNR is applied
peaksnr=10 *log10(3*m*n*(Max^2)/(sum0));