function [ subtitle ] = subtitles( I )
I = imread(I);
[h, w, c] = size(I);
v=I;
I=im2bw(I,0.75);
figure,imshow(I),title('1-black and white image');
se = strel('square',7);
B=imerode(I,se);
sub=I-B;
figure,imshow(sub),title('2-erode');
s = strel('square',11);
B=imdilate(sub,s);
sub=B-I;
figure,imshow(sub),title('3-dilate');
e = strel('square',1);
B=imerode(sub,e);
figure,imshow(B),title('4-erode');
[L, num] = bwlabel(B);
RGB = label2rgb(L);
figure,imshow(RGB),title('5-bwlabel');
[h, w, ~] = size(I);
x = uint8(L==12);
f = sum(sum(x==1));    
d = zeros(size(v));
d(:,:,1) = uint8(x).*v(:,:,1);
d(:,:,2) = uint8(x).*v(:,:,2);
d(:,:,3) = uint8(x).*v(:,:,3);
figure,imshow(d),title('6-extract subtitle part');
s = strel('square',7);
b=imdilate(d,s);
figure,imshow(b),title('7-dilate');
region=regionprops(L,'BoundingBox');
r=region(12).BoundingBox;
final=imcrop(v,[r(1),r(2),r(3),r(4)]);
subtitle=final;
end

