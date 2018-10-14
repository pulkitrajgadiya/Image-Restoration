function ssim_ret=Myssim(image,ground_truth)
%Calculating the mean of both the image
ux= mean(image(:)); 
uy= mean(ground_truth(:));
%Calculatevariance and covariace of the images
cxy=cov(image(:),ground_truth(:));
%cxy is 2x2 matrix containg variances and covariances.
sx=cxy(1);sy=cxy(4);
%L= dynamic range of the image
L=2.8103;
C1=(0.01*L).^2;C2=(0.03*L).^2;
%Apply formula for SSIM
ssim_ret=(2*ux*uy+C1)*(2*cxy(2)+C2)/((ux^2+uy^2+C1)*(sx+sy+C2));   
% ssim_ret=ssim(image,ground_truth );
end