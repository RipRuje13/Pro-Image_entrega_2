function mat2_RANL = f_rotar(img_RANL, ang_RANL)

% Obtener el tamaño de la imagen original
[rowsi_RANL,colsi_RANL,z]= size(img_RANL);



% Convertir el ángulo de grados a radianes
rads_RANL=2*pi*ang_RANL/360;

% Calcular las dimensiones de la imagen rotada
fil_RANL=ceil(rowsi_RANL*abs(cos(rads_RANL))+colsi_RANL*abs(sin(rads_RANL)));                      
col_RANL=ceil(rowsi_RANL*abs(sin(rads_RANL))+colsi_RANL*abs(cos(rads_RANL)));

% Crear una matriz C de ceros con las nuevas dimensiones
mat2_RANL=uint8(zeros([fil_RANL col_RANL 3 ]));

% Calcular las coordenadas del centro de la imagen original
xc_RANL=ceil(rowsi_RANL/2);                                                            
yc_RANL=ceil(colsi_RANL/2);

% Calcular las coordenadas del centro de la imagen rotada
midx_RANL=ceil((size(mat2_RANL,1))/2);
midy_RANL=ceil((size(mat2_RANL,2))/2);

% Iterar sobre todas las coordenadas de la imagen rotada
for i=1:size(mat2_RANL,1)
    for j=1:size(mat2_RANL,2)

        % Calcular las coordenadas correspondientes en la imagen original
        x= (i-midx_RANL)*cos(rads_RANL)+(j-midy_RANL)*sin(rads_RANL);                                       
        y= -(i-midx_RANL)*sin(rads_RANL)+(j-midy_RANL)*cos(rads_RANL);

        % Ajustar las coordenadas para que estén dentro de los límites de la imagen original
        x=round(x)+xc_RANL;
        y=round(y)+yc_RANL;

        % Copiar el valor de los píxeles de la imagen original a la imagen rotada
        if (x>=1 && y>=1 && x<=size(img_RANL,1) &&  y<=size(img_RANL,2) ) 
            mat2_RANL(i,j,:)=img_RANL(x,y,:);  
        end

    end
end



end