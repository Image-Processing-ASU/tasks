function [ trafficLight ] = Traffic( I )
I = imread(I);
[h, w, c] = size(I);
figure,imshow(I);
color='';
for i=1:h
    for j=1:w
        if I(i,j,1)>230 && (I(i,j,2)<3 && I(i,j,3)<20)
         color='red';
         num=1;
        end
        if I(i,j,1)<40 && (I(i,j,2)>150 && I(i,j,3)<5)
             color='green';
             num=2;
        end
        if I(i,j,1)>230 && I(i,j,2)>180 && I(i,j,3)<30 
            color='yellow';
            num=3;
        end   
    end
end
trafficLight=color;
end

