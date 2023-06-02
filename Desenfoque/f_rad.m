function img_difum_RANL = f_rad(img_RANL, rad_RANL)
%Convertir la imagen a tipo double para poder realizar cálculos con decimales:
img_RANL = im2double(img_RANL);

% Obtener el tamaño de la imagen utilizando la función size():
[m, n, ~] = size(img_RANL);

% Generar un kernel de difuminado aleatorio utilizando la función rand():
kernel_RANL = rand(rad_RANL*2+1, rad_RANL*2+1);

% Normalizar el kernel para que sume 1 utilizando la función sum():
kernel_RANL = kernel_RANL / sum(kernel_RANL(:));

% Inicializar una matriz para almacenar la imagen difuminada:
img_difum_RANL = zeros(m, n, 3);

% Aplicar la convolución de la imagen con el kernel de difuminado (aplicando a las 3 capas RGB 
% utilizando un bucle for:
for i = 1:3
    img_difum_RANL(:,:,i) = conv2(img_RANL(:,:,i), kernel_RANL, 'same');
end

% Convertir la imagen difuminada a tipo uint8 para poder visualizarla:
img_difum_RANL = im2uint8(img_difum_RANL);

end

