% Limpiar la ventana de comandos, cerrar todas las figuras y limpiar la memoria
clear;
close all;
clc;

% Leer la imagen 'rei.jpeg'
img=imread('rei.jpg');
% Definir el ángulo de rotación en grados
ang1=45;
ang2=90;
ang3=180;

rot1 = f_rotar(img,ang1);
rot2 = f_rotar(img,ang2);
rot3 = f_rotar(img,ang3);
% Mostrar la imagen rotada
subplot(2,2,1), imshow(img), title('Imagen original');
subplot(2,2,2), imshow(rot1), title('rotación 45°');
subplot(2,2,3), imshow(rot2), title('rotación 90°');
subplot(2,2,4), imshow(rot3), title('rotación 180°');
