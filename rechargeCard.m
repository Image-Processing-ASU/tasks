function [ mobinil ] = rechargeCard( img )
I = imread(img);
[h, w, c] = size(I);
d=fix(h/8);
I((2.*d)+1:end,:)=0;
s = zeros(h,w,c);
for i=1:h
    for j=1:w
        if I(i,j,1) > 135 &&I(i,j,2) > 150 && I(i,j,3) > 150
            s(i,j,:) = I(i,j,:);
        end
    end
end
se = strel('square',16);
B=imdilate(s,se);
B=rgb2gray(B);
[L, num] = bwlabel(B);
RGB = label2rgb(L);
[h, w, ~] = size(I);
smallRatio = h*w*0.06;
for i=1:num
    x = uint8(L==2);
    f = sum(sum(x==1));
    if(f < smallRatio)
        continue;
    end
    d = zeros(size(I));
    d(:,:,1) = uint8(x).*I(:,:,1);
    d(:,:,2) = uint8(x).*I(:,:,2);
    d(:,:,3) = uint8(x).*I(:,:,3);
    mobinil=uint8(d);
end

end

