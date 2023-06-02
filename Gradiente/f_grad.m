function f_grad(img_RANL)

% Convertir la imagen a escala de grises
img_gray_RANL = rgb2gray(img_RANL);

% Definir los filtros de Sobel en x e y
sobel_x_RANL = [-1 0 1; -2 0 2; -1 0 1];
sobel_y_RANL = [-1 -2 -1; 0 0 0; 1 2 1];

% Aplicar la convolución con los filtros de Sobel
grad_x_RANL = conv2(double(img_gray_RANL), sobel_x_RANL, 'same');
grad_y_RANL = conv2(double(img_gray_RANL), sobel_y_RANL, 'same');

% Calcular la magnitud del gradiente
grad_mag_RANL = sqrt(grad_x_RANL.^2 + grad_y_RANL.^2);

% Mostrar la imagen original y el gradiente calculado
figure;
subplot(1,2,1);
imshow(img_RANL);
title('Imagen original');
subplot(1,2,2);
imshow(grad_mag_RANL, []);
title('Gradiente de la imagen');
