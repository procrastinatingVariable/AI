function output = vizualizare_imagini_hibrid(imagini_hibrid)
%vizualizam o imagine hibrid prin miscorarea progresiva a imaginii
% la scala normala - vedem detaliile (frecventele inalte)
% la scara mica - vedem continutul (frecventele joase)
scales = 5; %
scale_factor = 0.5; 
padding = 5; 

original_height = size(imagini_hibrid,1);
num_colors = size(imagini_hibrid,3);
output = imagini_hibrid;
cur_image = imagini_hibrid;

for i = 2:scales    
    output = cat(2, output, ones(original_height, padding, num_colors));    
    %redimensionare - micsorarea imaginii
    cur_image = imresize(cur_image, scale_factor, 'bilinear');    
    tmp = cat(1,ones(original_height - size(cur_image,1), size(cur_image,2), num_colors), cur_image);
    output = cat(2, output, tmp);    
end