function [ number ] = Hand( I )
I= imread(I);
figure,imshow(I);
I = rgb2gray(I);
I = im2bw(I,0.9);
I = ~I;
se = strel('disk',30);
B=imerode(I,se);
bw=imdilate(B,se);
sub=I-bw;
s = strel('disk',10);
img=imerode(sub,s);
[L, num] = bwlabel(img);
number=num;
end

