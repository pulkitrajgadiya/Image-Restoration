% image=[magic(5), [13 6  7 9 20]' [5 6  17 19 2]' ];
function my_fft=Myfft(image_input,size_M,size_N)
[M, N]=size(image_input);
%Check if input arguments are less the 3 or not
if nargin < 3
    %Default values of new sizes
    size_M=M;size_N=N;
end
% disp('FFT Calculating..')
%Initialize the Padded image
image=image_input;
% Check the need for padding
if size_M == M && size_N == N
    disp('No padding required');
elseif size_M < M || size_N <= N
    disp('aliasing in computing FFT');
elseif size_M >=M  && size_N >= N
    %Need of Padding
    %Calculate difference is the original and required
    diff_M=size_M-M;
    diff_N=size_N-N;
    %create zero matrices
    image2=zeros(M,diff_N);
    image3=zeros(diff_M,size_N);
    %finally pad zero to the image
    image=[image_input,image2;image3];
else 
    disp('There is some error');
end

%Resize input image parameters
M=size_M;
N=size_N;
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

%Finally Calculate DFT
my_fft=twiddle_M*image*twiddle_N;


end
