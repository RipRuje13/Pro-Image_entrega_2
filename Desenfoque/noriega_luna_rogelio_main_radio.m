clear;
close all;
clc;
% Cargar la imagen en Matlab utilizando la función imread():
img = imread('rei.png');

% Definir el radio del kernel de difuminado como una variable.
rad1 = 4;
rad2 = 8;
rad3 = 12;

%enviamos la imagen original con el radio deseado 
img_r1_RANL= f_rad(img,rad1);
img_r2_RANL= f_rad(img,rad2);
img_r3_RANL= f_rad(img,rad3);

% 6. Visualizar la imagen original y las imagens difuminadas utilizando la función imshow():
subplot(2,2,1), imshow(img), title('Imagen original');
subplot(2,2,2), imshow(img_r1_RANL), title(sprintf('Imagen difuminada a = %d', rad1));
subplot(2,2,3), imshow(img_r2_RANL), title(sprintf('Imagen difuminada a = %d', rad2));
subplot(2,2,4), imshow(img_r3_RANL), title(sprintf('Imagen difuminada a = %d', rad3));


