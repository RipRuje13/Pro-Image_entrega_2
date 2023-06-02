function f_morfo(img_RANL)
img_gray_RANL = rgb2gray(img_RANL);

% se aplica un umbral adaptativo
umbral_RANL = adaptthresh(img_gray_RANL, 1);
% se cambia la imagen binaria y se invierte para poder obtener les ciculos 
img_bin_RANL = imcomplement(imbinarize(img_gray_RANL, umbral_RANL)); 

% se obtiene la matriz estructurada 
elem_struct_RANL = strel('disk', 20);
% se erosiona la imagen orginal para quitar el ruido 
img_erodada_RANL = imerode(img_bin_RANL, elem_struct_RANL);
% se dilatan los circulos para que tengan un contorno mas unifrme 
img_dilatada_RANL = imdilate(img_erodada_RANL, elem_struct_RANL);
% la imagen resultante se pasa a negativo para que los circulos se
% mantengan negros
img_neg_RANL = imcomplement(img_dilatada_RANL);

% se detectan los círculos en la imagen utilizando la transformada de Hough circular
[centros, radios, metricas] = imfindcircles(img_neg_RANL, [20 50], 'ObjectPolarity', 'dark', 'Sensitivity', 0.9);

% se conta el número de círculos detectados
num_cir_RANL = length(radios);

% se mostra la imagen original y la imagen modificada con los círculos
% encontrados
%se imprime la imagen original
subplot(1,3,1);
imshow(img_RANL);
title('Imagen Original');

%se imprime la imagen modificada 
subplot(1,3,2);
imshow(img_neg_RANL);
title('imagen modificada')

%se imrpime la imagen modificada con los circuilos resaltados
subplot(1,3,3);
imshow(img_neg_RANL);
%funsion para resaltar los circulos encontrados
viscircles(centros, radios, 'Color', 'r');
title('circulos encontrados');

% imprime la cantidad de circulos encontrados 
fprintf('Número de círculos detectados: %d\n', num_cir_RANL);
