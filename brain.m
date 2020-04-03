a=imread('input.jpg');
disp('111.jpg'); I=rgb2gray(a);
%imshow(a);
disp('Checkpoint'); %Filtering
s=medfilt2(I);
%imshow(s)
disp('public/t1.jpg'); imwrite(s,'public/t1.jpg')
%Segmentation %figure
s2=im2bw(s,0.58);
%imshow(s2)
disp('public/t2.jpg');
imwrite(s2,'public/t2.jpg');
%Erosion
se = strel('disk',13); erodeI =
imerode(s2,se);
%figure %k means algo:cform =
makecform('srgb2lab'); lab_he =
applycform(s,cform); b =
double(lab_he(:,:,2:3)); nrows =
size(ab,1); ncols = size(ab,2); ab =
reshape(ab,nrows*ncols,2); nColors = 3;
% repeat the clustering 3 times to avoid local minima
[cluster_idx, cluster_center] = kmeans(ab,nColors,'distance','sqEuclidean', ...
 'Replicates',3);
pixel_labels = reshape(cluster_idx,nrows,ncols);
imshow(pixel_labels,[]), title('image labeled by cluster index');
segmented_images = cell(1,3); rgb_label =
repmat(pixel_labels,[1 1 3]); for k = 1:nColors
color = he; color(rgb_label ~= k) = 0;
segmented_images{k} = color;
end
%k means algo ends
%imshow(erodeI)
disp('public/t3.jpg'); imwrite(erodeI,'public/t3.jpg');