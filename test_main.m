orig_image=im2double(imread('Blurry1_1.jpg'));
% [M,N]=size(orig_image);
% subplot(2,2,1);
% imshow(orig_image);
time=tic;
orig_kernel=im2double(imread('Kernel3G.png'));
% sub_kernel=orig_kernel(1:74,1:64);
% imshow(sub_kernel)
% sub_kernel=orig_kernel(31:46,30:40);%kernel 1

sub_kernel=orig_kernel(27:34,36:41);%kernel 3
imwrite(sub_kernel,'kernel3.png');
sub_kernel=sub_kernel./sum(sum(sub_kernel));
kernal_fft=(Myfft(sub_kernel,800,800));
% kernal_fft2=(fft2(padorNot(sub_kernel,800,800)));
for i=1:3
orig_image_fft(:,:,i)=Myfft(orig_image(:,:,i));
end
deblurred_image=FullInverseFilt(kernal_fft,orig_image_fft);
image=deblurred_image;
% image=butterWorth(deblurred_image,50,2);
% image=LMS(kernal_fft,orig_image_fft,0.3);
% image=WeinerFilter(kernal_fft,orig_image_fft,0.2);

tEnd=toc(time)

subplot(2,2,4);
imshow(((image)));
ground_truth=im2double(imread('GroundTruth1_1_1.jpg'));
ssim1=Myssim(image,ground_truth );
ssimo=Myssim(orig_image,ground_truth );
peaksnr1 = Mypsnr(image,ground_truth );
peaksnr0 = Mypsnr(orig_image,ground_truth );

