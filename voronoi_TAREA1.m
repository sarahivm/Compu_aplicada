%Número de pixeles solicitados. Se usa la imágen de Barry la abeja que
%tiene 256 pixeles. 
pixel_range = 256;
%El número de puntos que tendra el diagrama
num_points = 16;
%"IMREAD" lee la imágen de Barry y saca las tres matrices de rgb. 
img = imread('barry.jpg');
image(img);

len = size(img);
%Valores de 0 a 255 de rgb. Se ve la longitud de las matrices de la imágen.
len_1 = len(3); %3, tres dimensiones - rgb
len_2 = len(2); %256
len_3 = len(1); %256
%Para cada una de las dimensiones de la matriz. Se cambia el valor de cada
%pixel a 255 para volver la imágenm blanca y poder utilizarla en el
%voronoi. 
for k = 1:len_1
    for j = 1:len_2
        for i = 1:len_3
            img(i, j ,k) = 255;
        end
    end
end

image(img);
%Crea las coordenadas de los puntos que usará el diagrama de voronoi 
x = randi([1,pixel_range],num_points,1);
y = randi([1,pixel_range],num_points,1);
%Crea una matriz con los valores rgb (un color) para cada punto
rgb = randi([0,pixel_range]-1,num_points,3);
%Da el valor de cuanto mide la matriz de coordenadas
len_x = size(x);
len_x = len_x(1);
len_y = size(y);
len_y = len_y(1);
%Hace puntos negros en las coordenadas obtenidas anteriormente
for i = 1:len_x
    for k = 1:len_1
        img(x(i), y(i) ,k) = 0;
    end
end
%Se crean condiciones para las 16 coordenadas y se les asigna un color a
%los pixeles que se encuentren dentro de las condiciones. Se colorea de un
%color el pixel si su distancia es más corta a una coordenada, que en
%comparación a todas las demás. 
for j = 1:len_2 %Para j que va de 1 a 256 en X
    for i = 1:len_3 %Para i que va de 1 a 256 en Y
        %Utilizamos pitágoras para determinar la hipotenusa (distancia) de cada pixel a
        %todas las coordenadas y dependiendo de cuál es la distancia menor
        %se pondrá de un color ese pixel
        if sqrt((x(1)-j)^2+(y(1)-i)^2) < sqrt((x(2)-j)^2+(y(2)-i)^2) && sqrt((x(1)-j)^2+(y(1)-i)^2) < sqrt((x(3)-j)^2+(y(3)-i)^2) && sqrt((x(1)-j)^2+(y(1)-i)^2) < sqrt((x(4)-j)^2+(y(4)-i)^2) && sqrt((x(1)-j)^2+(y(1)-i)^2) < sqrt((x(5)-j)^2+(y(5)-i)^2) && sqrt((x(1)-j)^2+(y(1)-i)^2) < sqrt((x(6)-j)^2+(y(6)-i)^2) && sqrt((x(1)-j)^2+(y(1)-i)^2) < sqrt((x(7)-j)^2+(y(7)-i)^2) && sqrt((x(1)-j)^2+(y(1)-i)^2) < sqrt((x(8)-j)^2+(y(8)-i)^2) && sqrt((x(1)-j)^2+(y(1)-i)^2) < sqrt((x(9)-j)^2+(y(9)-i)^2) && sqrt((x(1)-j)^2+(y(1)-i)^2) < sqrt((x(10)-j)^2+(y(10)-i)^2) && sqrt((x(1)-j)^2+(y(1)-i)^2) < sqrt((x(11)-j)^2+(y(11)-i)^2) && sqrt((x(1)-j)^2+(y(1)-i)^2) < sqrt((x(12)-j)^2+(y(12)-i)^2) && sqrt((x(1)-j)^2+(y(1)-i)^2) < sqrt((x(13)-j)^2+(y(13)-i)^2) && sqrt((x(1)-j)^2+(y(1)-i)^2) < sqrt((x(14)-j)^2+(y(14)-i)^2) && sqrt((x(1)-j)^2+(y(1)-i)^2) < sqrt((x(15)-j)^2+(y(15)-i)^2) && sqrt((x(1)-j)^2+(y(1)-i)^2) < sqrt((x(16)-j)^2+(y(16)-i)^2)
            %Si se cumple que la distancia del pixel al punto 1 es menor
            %que a todas las demás coordenadas el pixel se color una
            %imágen
            %(i,j,1) es coordenada del pixel en la matriz r, g o b
            img(i,j, 1) = rgb(1,1); %Se tiene 3 img por nuestras tres matrices en rgb. Primer fila, primer columna R
            img(i,j, 2) = rgb(1,2); %Primer fila, segunda columna G 
            img(i,j, 3) = rgb(1,3); %Primer fila, tercer columna B
        elseif sqrt((x(2)-j)^2+(y(2)-i)^2) < sqrt((x(1)-j)^2+(y(1)-i)^2) && sqrt((x(2)-j)^2+(y(2)-i)^2) < sqrt((x(3)-j)^2+(y(3)-i)^2) && sqrt((x(2)-j)^2+(y(2)-i)^2) < sqrt((x(4)-j)^2+(y(4)-i)^2) && sqrt((x(2)-j)^2+(y(2)-i)^2) < sqrt((x(5)-j)^2+(y(5)-i)^2) && sqrt((x(2)-j)^2+(y(2)-i)^2) < sqrt((x(6)-j)^2+(y(6)-i)^2) && sqrt((x(2)-j)^2+(y(2)-i)^2) < sqrt((x(7)-j)^2+(y(7)-i)^2) && sqrt((x(2)-j)^2+(y(2)-i)^2) < sqrt((x(8)-j)^2+(y(8)-i)^2) && sqrt((x(2)-j)^2+(y(2)-i)^2) < sqrt((x(9)-j)^2+(y(9)-i)^2) && sqrt((x(2)-j)^2+(y(2)-i)^2) < sqrt((x(10)-j)^2+(y(10)-i)^2) && sqrt((x(2)-j)^2+(y(2)-i)^2) < sqrt((x(11)-j)^2+(y(11)-i)^2) && sqrt((x(2)-j)^2+(y(2)-i)^2) < sqrt((x(12)-j)^2+(y(12)-i)^2) && sqrt((x(2)-j)^2+(y(2)-i)^2) < sqrt((x(13)-j)^2+(y(13)-i)^2) && sqrt((x(2)-j)^2+(y(2)-i)^2) < sqrt((x(14)-j)^2+(y(14)-i)^2) && sqrt((x(2)-j)^2+(y(2)-i)^2) < sqrt((x(15)-j)^2+(y(15)-i)^2) && sqrt((x(2)-j)^2+(y(2)-i)^2) < sqrt((x(16)-j)^2+(y(16)-i)^2)
            img(i,j, 1) = rgb(2,1);
            img(i,j, 2) = rgb(2,2);
            img(i,j, 3) = rgb(2,3);
        elseif sqrt((x(3)-j)^2+(y(3)-i)^2) < sqrt((x(1)-j)^2+(y(1)-i)^2) && sqrt((x(3)-j)^2+(y(3)-i)^2) < sqrt((x(2)-j)^2+(y(2)-i)^2) && sqrt((x(3)-j)^2+(y(3)-i)^2) < sqrt((x(4)-j)^2+(y(4)-i)^2) && sqrt((x(3)-j)^2+(y(3)-i)^2) < sqrt((x(5)-j)^2+(y(5)-i)^2) && sqrt((x(3)-j)^2+(y(3)-i)^2) < sqrt((x(6)-j)^2+(y(6)-i)^2) && sqrt((x(3)-j)^2+(y(3)-i)^2) < sqrt((x(7)-j)^2+(y(7)-i)^2) && sqrt((x(3)-j)^2+(y(3)-i)^2) < sqrt((x(8)-j)^2+(y(8)-i)^2) && sqrt((x(3)-j)^2+(y(3)-i)^2) < sqrt((x(9)-j)^2+(y(9)-i)^2) && sqrt((x(3)-j)^2+(y(3)-i)^2) < sqrt((x(10)-j)^2+(y(10)-i)^2) && sqrt((x(3)-j)^2+(y(3)-i)^2) < sqrt((x(11)-j)^2+(y(11)-i)^2) && sqrt((x(3)-j)^2+(y(3)-i)^2) < sqrt((x(12)-j)^2+(y(12)-i)^2) && sqrt((x(3)-j)^2+(y(3)-i)^2) < sqrt((x(13)-j)^2+(y(13)-i)^2) && sqrt((x(3)-j)^2+(y(3)-i)^2) < sqrt((x(14)-j)^2+(y(14)-i)^2) && sqrt((x(3)-j)^2+(y(3)-i)^2) < sqrt((x(15)-j)^2+(y(15)-i)^2) && sqrt((x(3)-j)^2+(y(3)-i)^2) < sqrt((x(16)-j)^2+(y(16)-i)^2)
            img(i,j, 1) = rgb(3,1);
            img(i,j, 2) = rgb(3,2);
            img(i,j, 3) = rgb(3,3);
        elseif sqrt((x(4)-j)^2+(y(4)-i)^2) < sqrt((x(1)-j)^2+(y(1)-i)^2) && sqrt((x(4)-j)^2+(y(4)-i)^2) < sqrt((x(2)-j)^2+(y(2)-i)^2) && sqrt((x(4)-j)^2+(y(4)-i)^2) < sqrt((x(3)-j)^2+(y(3)-i)^2) && sqrt((x(4)-j)^2+(y(4)-i)^2) < sqrt((x(5)-j)^2+(y(5)-i)^2) && sqrt((x(4)-j)^2+(y(4)-i)^2) < sqrt((x(6)-j)^2+(y(6)-i)^2) && sqrt((x(4)-j)^2+(y(4)-i)^2) < sqrt((x(7)-j)^2+(y(7)-i)^2) && sqrt((x(4)-j)^2+(y(4)-i)^2) < sqrt((x(8)-j)^2+(y(8)-i)^2) && sqrt((x(4)-j)^2+(y(4)-i)^2) < sqrt((x(9)-j)^2+(y(9)-i)^2) && sqrt((x(4)-j)^2+(y(4)-i)^2) < sqrt((x(10)-j)^2+(y(10)-i)^2) && sqrt((x(4)-j)^2+(y(4)-i)^2) < sqrt((x(11)-j)^2+(y(11)-i)^2) && sqrt((x(4)-j)^2+(y(4)-i)^2) < sqrt((x(12)-j)^2+(y(12)-i)^2) && sqrt((x(4)-j)^2+(y(4)-i)^2) < sqrt((x(13)-j)^2+(y(13)-i)^2) && sqrt((x(4)-j)^2+(y(4)-i)^2) < sqrt((x(14)-j)^2+(y(14)-i)^2) && sqrt((x(4)-j)^2+(y(4)-i)^2) < sqrt((x(15)-j)^2+(y(15)-i)^2) && sqrt((x(4)-j)^2+(y(4)-i)^2) < sqrt((x(16)-j)^2+(y(16)-i)^2)
            img(i,j, 1) = rgb(4,1);
            img(i,j, 2) = rgb(4,2);
            img(i,j, 3) = rgb(4,3);
        elseif sqrt((x(5)-j)^2+(y(5)-i)^2) < sqrt((x(1)-j)^2+(y(1)-i)^2) && sqrt((x(5)-j)^2+(y(5)-i)^2) < sqrt((x(2)-j)^2+(y(2)-i)^2) && sqrt((x(5)-j)^2+(y(5)-i)^2) < sqrt((x(3)-j)^2+(y(3)-i)^2) && sqrt((x(5)-j)^2+(y(5)-i)^2) < sqrt((x(4)-j)^2+(y(4)-i)^2) && sqrt((x(5)-j)^2+(y(5)-i)^2) < sqrt((x(6)-j)^2+(y(6)-i)^2) && sqrt((x(5)-j)^2+(y(5)-i)^2) < sqrt((x(7)-j)^2+(y(7)-i)^2) && sqrt((x(5)-j)^2+(y(5)-i)^2) < sqrt((x(8)-j)^2+(y(8)-i)^2) && sqrt((x(5)-j)^2+(y(5)-i)^2) < sqrt((x(9)-j)^2+(y(9)-i)^2) && sqrt((x(5)-j)^2+(y(5)-i)^2) < sqrt((x(10)-j)^2+(y(10)-i)^2) && sqrt((x(5)-j)^2+(y(5)-i)^2) < sqrt((x(11)-j)^2+(y(11)-i)^2) && sqrt((x(5)-j)^2+(y(5)-i)^2) < sqrt((x(12)-j)^2+(y(12)-i)^2) && sqrt((x(5)-j)^2+(y(5)-i)^2) < sqrt((x(13)-j)^2+(y(13)-i)^2) && sqrt((x(5)-j)^2+(y(5)-i)^2) < sqrt((x(14)-j)^2+(y(14)-i)^2) && sqrt((x(5)-j)^2+(y(5)-i)^2) < sqrt((x(15)-j)^2+(y(15)-i)^2) && sqrt((x(5)-j)^2+(y(5)-i)^2) < sqrt((x(16)-j)^2+(y(16)-i)^2)
            img(i,j, 1) = rgb(5,1);
            img(i,j, 2) = rgb(5,2);
            img(i,j, 3) = rgb(5,3);
        elseif sqrt((x(6)-j)^2+(y(6)-i)^2) < sqrt((x(1)-j)^2+(y(1)-i)^2) && sqrt((x(6)-j)^2+(y(6)-i)^2) < sqrt((x(2)-j)^2+(y(2)-i)^2) && sqrt((x(6)-j)^2+(y(6)-i)^2) < sqrt((x(3)-j)^2+(y(3)-i)^2) && sqrt((x(6)-j)^2+(y(6)-i)^2) < sqrt((x(4)-j)^2+(y(4)-i)^2)&& sqrt((x(6)-j)^2+(y(6)-i)^2) < sqrt((x(5)-j)^2+(y(5)-i)^2) && sqrt((x(6)-j)^2+(y(6)-i)^2) < sqrt((x(7)-j)^2+(y(7)-i)^2)&& sqrt((x(6)-j)^2+(y(6)-i)^2) < sqrt((x(8)-j)^2+(y(8)-i)^2) && sqrt((x(6)-j)^2+(y(6)-i)^2) < sqrt((x(9)-j)^2+(y(9)-i)^2) && sqrt((x(6)-j)^2+(y(6)-i)^2) < sqrt((x(10)-j)^2+(y(10)-i)^2) && sqrt((x(6)-j)^2+(y(6)-i)^2) < sqrt((x(11)-j)^2+(y(11)-i)^2) && sqrt((x(6)-j)^2+(y(6)-i)^2) < sqrt((x(12)-j)^2+(y(12)-i)^2) && sqrt((x(6)-j)^2+(y(6)-i)^2) < sqrt((x(13)-j)^2+(y(13)-i)^2) && sqrt((x(6)-j)^2+(y(6)-i)^2) < sqrt((x(14)-j)^2+(y(14)-i)^2) && sqrt((x(6)-j)^2+(y(6)-i)^2) < sqrt((x(15)-j)^2+(y(15)-i)^2) && sqrt((x(6)-j)^2+(y(6)-i)^2) < sqrt((x(16)-j)^2+(y(16)-i)^2)
            img(i,j, 1) = rgb(6,1);
            img(i,j, 2) = rgb(6,2);
            img(i,j, 3) = rgb(6,3);
        elseif sqrt((x(7)-j)^2+(y(7)-i)^2) < sqrt((x(1)-j)^2+(y(1)-i)^2) && sqrt((x(7)-j)^2+(y(7)-i)^2) < sqrt((x(2)-j)^2+(y(2)-i)^2) && sqrt((x(7)-j)^2+(y(7)-i)^2) < sqrt((x(3)-j)^2+(y(3)-i)^2) && sqrt((x(7)-j)^2+(y(7)-i)^2) < sqrt((x(4)-j)^2+(y(4)-i)^2)&& sqrt((x(7)-j)^2+(y(7)-i)^2) < sqrt((x(5)-j)^2+(y(5)-i)^2) && sqrt((x(7)-j)^2+(y(7)-i)^2) < sqrt((x(6)-j)^2+(y(6)-i)^2) && sqrt((x(7)-j)^2+(y(7)-i)^2) < sqrt((x(8)-j)^2+(y(8)-i)^2) && sqrt((x(7)-j)^2+(y(7)-i)^2) < sqrt((x(9)-j)^2+(y(9)-i)^2) && sqrt((x(7)-j)^2+(y(7)-i)^2) < sqrt((x(10)-j)^2+(y(10)-i)^2) && sqrt((x(7)-j)^2+(y(7)-i)^2) < sqrt((x(11)-j)^2+(y(11)-i)^2) && sqrt((x(7)-j)^2+(y(7)-i)^2) < sqrt((x(12)-j)^2+(y(12)-i)^2) && sqrt((x(7)-j)^2+(y(7)-i)^2) < sqrt((x(13)-j)^2+(y(13)-i)^2) && sqrt((x(7)-j)^2+(y(7)-i)^2) < sqrt((x(14)-j)^2+(y(14)-i)^2) && sqrt((x(7)-j)^2+(y(7)-i)^2) < sqrt((x(15)-j)^2+(y(15)-i)^2) && sqrt((x(7)-j)^2+(y(7)-i)^2) < sqrt((x(16)-j)^2+(y(16)-i)^2)
            img(i,j, 1) = rgb(7,1);
            img(i,j, 2) = rgb(7,2);
            img(i,j, 3) = rgb(7,3);
        elseif sqrt((x(8)-j)^2+(y(8)-i)^2) < sqrt((x(1)-j)^2+(y(1)-i)^2) && sqrt((x(8)-j)^2+(y(8)-i)^2) < sqrt((x(2)-j)^2+(y(2)-i)^2) && sqrt((x(8)-j)^2+(y(8)-i)^2) < sqrt((x(3)-j)^2+(y(3)-i)^2) && sqrt((x(8)-j)^2+(y(8)-i)^2) < sqrt((x(4)-j)^2+(y(4)-i)^2)&& sqrt((x(8)-j)^2+(y(8)-i)^2) < sqrt((x(5)-j)^2+(y(5)-i)^2) && sqrt((x(8)-j)^2+(y(8)-i)^2) < sqrt((x(6)-j)^2+(y(6)-i)^2) && sqrt((x(8)-j)^2+(y(8)-i)^2) < sqrt((x(7)-j)^2+(y(7)-i)^2) && sqrt((x(8)-j)^2+(y(8)-i)^2) < sqrt((x(9)-j)^2+(y(9)-i)^2) && sqrt((x(8)-j)^2+(y(8)-i)^2) < sqrt((x(10)-j)^2+(y(10)-i)^2) && sqrt((x(8)-j)^2+(y(8)-i)^2) < sqrt((x(11)-j)^2+(y(11)-i)^2) && sqrt((x(8)-j)^2+(y(8)-i)^2) < sqrt((x(12)-j)^2+(y(12)-i)^2) && sqrt((x(8)-j)^2+(y(8)-i)^2) < sqrt((x(13)-j)^2+(y(13)-i)^2) && sqrt((x(8)-j)^2+(y(8)-i)^2) < sqrt((x(14)-j)^2+(y(14)-i)^2) && sqrt((x(8)-j)^2+(y(8)-i)^2) < sqrt((x(15)-j)^2+(y(15)-i)^2) && sqrt((x(8)-j)^2+(y(8)-i)^2) < sqrt((x(16)-j)^2+(y(16)-i)^2)
            img(i,j, 1) = rgb(8,1);
            img(i,j, 2) = rgb(8,2);
            img(i,j, 3) = rgb(8,3);
        elseif sqrt((x(9)-j)^2+(y(9)-i)^2) < sqrt((x(1)-j)^2+(y(1)-i)^2) && sqrt((x(9)-j)^2+(y(9)-i)^2) < sqrt((x(2)-j)^2+(y(2)-i)^2) && sqrt((x(9)-j)^2+(y(9)-i)^2) < sqrt((x(3)-j)^2+(y(3)-i)^2) && sqrt((x(9)-j)^2+(y(9)-i)^2) < sqrt((x(4)-j)^2+(y(4)-i)^2)&& sqrt((x(9)-j)^2+(y(9)-i)^2) < sqrt((x(5)-j)^2+(y(5)-i)^2) && sqrt((x(9)-j)^2+(y(9)-i)^2) < sqrt((x(6)-j)^2+(y(6)-i)^2) && sqrt((x(9)-j)^2+(y(9)-i)^2) < sqrt((x(7)-j)^2+(y(7)-i)^2) && sqrt((x(9)-j)^2+(y(9)-i)^2) < sqrt((x(8)-j)^2+(y(8)-i)^2) && sqrt((x(9)-j)^2+(y(9)-i)^2) < sqrt((x(10)-j)^2+(y(10)-i)^2) && sqrt((x(9)-j)^2+(y(9)-i)^2) < sqrt((x(11)-j)^2+(y(11)-i)^2) && sqrt((x(9)-j)^2+(y(9)-i)^2) < sqrt((x(12)-j)^2+(y(12)-i)^2) && sqrt((x(9)-j)^2+(y(9)-i)^2) < sqrt((x(13)-j)^2+(y(13)-i)^2) && sqrt((x(9)-j)^2+(y(9)-i)^2) < sqrt((x(14)-j)^2+(y(14)-i)^2) && sqrt((x(9)-j)^2+(y(9)-i)^2) < sqrt((x(15)-j)^2+(y(15)-i)^2) && sqrt((x(9)-j)^2+(y(9)-i)^2) < sqrt((x(16)-j)^2+(y(16)-i)^2)
            img(i,j, 1) = rgb(9,1);
            img(i,j, 2) = rgb(9,2);
            img(i,j, 3) = rgb(9,3);
        elseif sqrt((x(10)-j)^2+(y(10)-i)^2) < sqrt((x(1)-j)^2+(y(1)-i)^2) && sqrt((x(10)-j)^2+(y(10)-i)^2) < sqrt((x(2)-j)^2+(y(2)-i)^2) && sqrt((x(10)-j)^2+(y(10)-i)^2) < sqrt((x(3)-j)^2+(y(3)-i)^2) && sqrt((x(10)-j)^2+(y(10)-i)^2) < sqrt((x(4)-j)^2+(y(4)-i)^2)&& sqrt((x(10)-j)^2+(y(10)-i)^2) < sqrt((x(5)-j)^2+(y(5)-i)^2) && sqrt((x(10)-j)^2+(y(10)-i)^2) < sqrt((x(6)-j)^2+(y(6)-i)^2) && sqrt((x(10)-j)^2+(y(10)-i)^2) < sqrt((x(7)-j)^2+(y(7)-i)^2) && sqrt((x(10)-j)^2+(y(10)-i)^2) < sqrt((x(8)-j)^2+(y(8)-i)^2) && sqrt((x(10)-j)^2+(y(10)-i)^2) < sqrt((x(9)-j)^2+(y(9)-i)^2) && sqrt((x(10)-j)^2+(y(10)-i)^2) < sqrt((x(11)-j)^2+(y(11)-i)^2) && sqrt((x(10)-j)^2+(y(10)-i)^2) < sqrt((x(12)-j)^2+(y(12)-i)^2) && sqrt((x(10)-j)^2+(y(10)-i)^2) < sqrt((x(13)-j)^2+(y(13)-i)^2) && sqrt((x(10)-j)^2+(y(10)-i)^2) < sqrt((x(14)-j)^2+(y(14)-i)^2) && sqrt((x(10)-j)^2+(y(10)-i)^2) < sqrt((x(15)-j)^2+(y(15)-i)^2) && sqrt((x(10)-j)^2+(y(10)-i)^2) < sqrt((x(16)-j)^2+(y(16)-i)^2)
            img(i,j, 1) = rgb(10,1);
            img(i,j, 2) = rgb(10,2);
            img(i,j, 3) = rgb(10,3);
        elseif sqrt((x(11)-j)^2+(y(11)-i)^2) < sqrt((x(1)-j)^2+(y(1)-i)^2) && sqrt((x(11)-j)^2+(y(11)-i)^2) < sqrt((x(2)-j)^2+(y(2)-i)^2) && sqrt((x(11)-j)^2+(y(11)-i)^2) < sqrt((x(3)-j)^2+(y(3)-i)^2) && sqrt((x(11)-j)^2+(y(11)-i)^2) < sqrt((x(4)-j)^2+(y(4)-i)^2)&& sqrt((x(11)-j)^2+(y(11)-i)^2) < sqrt((x(5)-j)^2+(y(5)-i)^2) && sqrt((x(11)-j)^2+(y(11)-i)^2) < sqrt((x(6)-j)^2+(y(6)-i)^2) && sqrt((x(11)-j)^2+(y(11)-i)^2) < sqrt((x(7)-j)^2+(y(7)-i)^2) && sqrt((x(11)-j)^2+(y(11)-i)^2) < sqrt((x(8)-j)^2+(y(8)-i)^2) && sqrt((x(11)-j)^2+(y(11)-i)^2) < sqrt((x(9)-j)^2+(y(9)-i)^2) && sqrt((x(11)-j)^2+(y(11)-i)^2) < sqrt((x(10)-j)^2+(y(10)-i)^2) && sqrt((x(11)-j)^2+(y(11)-i)^2) < sqrt((x(12)-j)^2+(y(12)-i)^2) && sqrt((x(11)-j)^2+(y(11)-i)^2) < sqrt((x(12)-j)^2+(y(12)-i)^2) && sqrt((x(11)-j)^2+(y(11)-i)^2) < sqrt((x(14)-j)^2+(y(14)-i)^2) && sqrt((x(11)-j)^2+(y(11)-i)^2) < sqrt((x(15)-j)^2+(y(15)-i)^2) && sqrt((x(11)-j)^2+(y(11)-i)^2) < sqrt((x(16)-j)^2+(y(16)-i)^2)
            img(i,j, 1) = rgb(11,1);
            img(i,j, 2) = rgb(11,2);
            img(i,j, 3) = rgb(11,3);
        elseif sqrt((x(12)-j)^2+(y(12)-i)^2) < sqrt((x(1)-j)^2+(y(1)-i)^2) && sqrt((x(12)-j)^2+(y(12)-i)^2) < sqrt((x(2)-j)^2+(y(2)-i)^2) && sqrt((x(12)-j)^2+(y(12)-i)^2) < sqrt((x(3)-j)^2+(y(3)-i)^2) && sqrt((x(12)-j)^2+(y(12)-i)^2) < sqrt((x(4)-j)^2+(y(4)-i)^2)&& sqrt((x(12)-j)^2+(y(12)-i)^2) < sqrt((x(5)-j)^2+(y(5)-i)^2) && sqrt((x(12)-j)^2+(y(12)-i)^2) < sqrt((x(6)-j)^2+(y(6)-i)^2) && sqrt((x(12)-j)^2+(y(12)-i)^2) < sqrt((x(7)-j)^2+(y(7)-i)^2) && sqrt((x(12)-j)^2+(y(12)-i)^2) < sqrt((x(8)-j)^2+(y(8)-i)^2) && sqrt((x(12)-j)^2+(y(12)-i)^2) < sqrt((x(9)-j)^2+(y(9)-i)^2) && sqrt((x(12)-j)^2+(y(12)-i)^2) < sqrt((x(10)-j)^2+(y(10)-i)^2) && sqrt((x(12)-j)^2+(y(12)-i)^2) < sqrt((x(11)-j)^2+(y(11)-i)^2) && sqrt((x(12)-j)^2+(y(12)-i)^2) < sqrt((x(13)-j)^2+(y(13)-i)^2) && sqrt((x(12)-j)^2+(y(12)-i)^2) < sqrt((x(14)-j)^2+(y(14)-i)^2) && sqrt((x(12)-j)^2+(y(12)-i)^2) < sqrt((x(15)-j)^2+(y(15)-i)^2) && sqrt((x(12)-j)^2+(y(12)-i)^2) < sqrt((x(16)-j)^2+(y(16)-i)^2)
            img(i,j, 1) = rgb(12,1);
            img(i,j, 2) = rgb(12,2);
            img(i,j, 3) = rgb(12,3);
        elseif sqrt((x(13)-j)^2+(y(13)-i)^2) < sqrt((x(1)-j)^2+(y(1)-i)^2) && sqrt((x(13)-j)^2+(y(13)-i)^2) < sqrt((x(2)-j)^2+(y(2)-i)^2) && sqrt((x(13)-j)^2+(y(13)-i)^2) < sqrt((x(3)-j)^2+(y(3)-i)^2) && sqrt((x(13)-j)^2+(y(13)-i)^2) < sqrt((x(4)-j)^2+(y(4)-i)^2)&& sqrt((x(13)-j)^2+(y(13)-i)^2) < sqrt((x(5)-j)^2+(y(5)-i)^2) && sqrt((x(13)-j)^2+(y(13)-i)^2) < sqrt((x(6)-j)^2+(y(6)-i)^2) && sqrt((x(13)-j)^2+(y(13)-i)^2) < sqrt((x(7)-j)^2+(y(7)-i)^2) && sqrt((x(13)-j)^2+(y(13)-i)^2) < sqrt((x(8)-j)^2+(y(8)-i)^2) && sqrt((x(13)-j)^2+(y(13)-i)^2) < sqrt((x(9)-j)^2+(y(9)-i)^2) && sqrt((x(13)-j)^2+(y(13)-i)^2) < sqrt((x(10)-j)^2+(y(10)-i)^2) && sqrt((x(13)-j)^2+(y(13)-i)^2) < sqrt((x(11)-j)^2+(y(11)-i)^2) && sqrt((x(13)-j)^2+(y(13)-i)^2) < sqrt((x(12)-j)^2+(y(12)-i)^2) && sqrt((x(13)-j)^2+(y(13)-i)^2) < sqrt((x(14)-j)^2+(y(14)-i)^2) && sqrt((x(13)-j)^2+(y(13)-i)^2) < sqrt((x(15)-j)^2+(y(15)-i)^2) && sqrt((x(13)-j)^2+(y(13)-i)^2) < sqrt((x(16)-j)^2+(y(16)-i)^2)
            img(i,j, 1) = rgb(13,1);
            img(i,j, 2) = rgb(13,2);
            img(i,j, 3) = rgb(13,3);
        elseif sqrt((x(14)-j)^2+(y(14)-i)^2) < sqrt((x(1)-j)^2+(y(1)-i)^2) && sqrt((x(14)-j)^2+(y(14)-i)^2) < sqrt((x(2)-j)^2+(y(2)-i)^2) && sqrt((x(14)-j)^2+(y(14)-i)^2) < sqrt((x(3)-j)^2+(y(3)-i)^2) && sqrt((x(14)-j)^2+(y(14)-i)^2) < sqrt((x(4)-j)^2+(y(4)-i)^2)&& sqrt((x(14)-j)^2+(y(14)-i)^2) < sqrt((x(5)-j)^2+(y(5)-i)^2) && sqrt((x(14)-j)^2+(y(14)-i)^2) < sqrt((x(6)-j)^2+(y(6)-i)^2) && sqrt((x(14)-j)^2+(y(14)-i)^2) < sqrt((x(7)-j)^2+(y(7)-i)^2) && sqrt((x(14)-j)^2+(y(14)-i)^2) < sqrt((x(8)-j)^2+(y(8)-i)^2) && sqrt((x(14)-j)^2+(y(14)-i)^2) < sqrt((x(9)-j)^2+(y(9)-i)^2) && sqrt((x(14)-j)^2+(y(14)-i)^2) < sqrt((x(10)-j)^2+(y(10)-i)^2) && sqrt((x(14)-j)^2+(y(14)-i)^2) < sqrt((x(11)-j)^2+(y(11)-i)^2) && sqrt((x(14)-j)^2+(y(14)-i)^2) < sqrt((x(12)-j)^2+(y(12)-i)^2) && sqrt((x(14)-j)^2+(y(14)-i)^2) < sqrt((x(13)-j)^2+(y(13)-i)^2) && sqrt((x(14)-j)^2+(y(14)-i)^2) < sqrt((x(15)-j)^2+(y(15)-i)^2) && sqrt((x(14)-j)^2+(y(14)-i)^2) < sqrt((x(16)-j)^2+(y(16)-i)^2)
            img(i,j, 1) = rgb(14,1);
            img(i,j, 2) = rgb(14,2);
            img(i,j, 3) = rgb(14,3);
        elseif sqrt((x(15)-j)^2+(y(15)-i)^2) < sqrt((x(1)-j)^2+(y(1)-i)^2) && sqrt((x(15)-j)^2+(y(15)-i)^2) < sqrt((x(2)-j)^2+(y(2)-i)^2) && sqrt((x(15)-j)^2+(y(15)-i)^2) < sqrt((x(3)-j)^2+(y(3)-i)^2) && sqrt((x(15)-j)^2+(y(15)-i)^2) < sqrt((x(4)-j)^2+(y(4)-i)^2)&& sqrt((x(15)-j)^2+(y(15)-i)^2) < sqrt((x(5)-j)^2+(y(5)-i)^2) && sqrt((x(15)-j)^2+(y(15)-i)^2) < sqrt((x(6)-j)^2+(y(6)-i)^2) && sqrt((x(15)-j)^2+(y(15)-i)^2) < sqrt((x(7)-j)^2+(y(7)-i)^2) && sqrt((x(15)-j)^2+(y(15)-i)^2) < sqrt((x(8)-j)^2+(y(8)-i)^2) && sqrt((x(15)-j)^2+(y(15)-i)^2) < sqrt((x(9)-j)^2+(y(9)-i)^2) && sqrt((x(15)-j)^2+(y(15)-i)^2) < sqrt((x(10)-j)^2+(y(10)-i)^2) && sqrt((x(15)-j)^2+(y(15)-i)^2) < sqrt((x(11)-j)^2+(y(11)-i)^2) && sqrt((x(15)-j)^2+(y(15)-i)^2) < sqrt((x(12)-j)^2+(y(12)-i)^2) && sqrt((x(15)-j)^2+(y(15)-i)^2) < sqrt((x(13)-j)^2+(y(13)-i)^2) && sqrt((x(15)-j)^2+(y(15)-i)^2) < sqrt((x(14)-j)^2+(y(14)-i)^2) && sqrt((x(15)-j)^2+(y(15)-i)^2) < sqrt((x(16)-j)^2+(y(16)-i)^2) 
            img(i,j, 1) = rgb(15,1);
            img(i,j, 2) = rgb(15,2);
            img(i,j, 3) = rgb(15,3);
        elseif sqrt((x(16)-j)^2+(y(16)-i)^2) < sqrt((x(1)-j)^2+(y(1)-i)^2) && sqrt((x(16)-j)^2+(y(16)-i)^2) < sqrt((x(2)-j)^2+(y(2)-i)^2) && sqrt((x(16)-j)^2+(y(16)-i)^2) < sqrt((x(3)-j)^2+(y(3)-i)^2) && sqrt((x(16)-j)^2+(y(16)-i)^2) < sqrt((x(4)-j)^2+(y(4)-i)^2)&& sqrt((x(16)-j)^2+(y(16)-i)^2) < sqrt((x(5)-j)^2+(y(5)-i)^2) && sqrt((x(16)-j)^2+(y(16)-i)^2) < sqrt((x(6)-j)^2+(y(6)-i)^2) && sqrt((x(16)-j)^2+(y(16)-i)^2) < sqrt((x(7)-j)^2+(y(7)-i)^2) && sqrt((x(16)-j)^2+(y(16)-i)^2) < sqrt((x(8)-j)^2+(y(8)-i)^2) && sqrt((x(16)-j)^2+(y(16)-i)^2) < sqrt((x(9)-j)^2+(y(9)-i)^2) && sqrt((x(16)-j)^2+(y(16)-i)^2) < sqrt((x(10)-j)^2+(y(10)-i)^2) && sqrt((x(16)-j)^2+(y(16)-i)^2) < sqrt((x(11)-j)^2+(y(11)-i)^2) && sqrt((x(16)-j)^2+(y(16)-i)^2) < sqrt((x(12)-j)^2+(y(12)-i)^2) && sqrt((x(16)-j)^2+(y(16)-i)^2) < sqrt((x(13)-j)^2+(y(13)-i)^2) && sqrt((x(16)-j)^2+(y(16)-i)^2) < sqrt((x(14)-j)^2+(y(14)-i)^2) && sqrt((x(16)-j)^2+(y(16)-i)^2) < sqrt((x(15)-j)^2+(y(15)-i)^2)
            img(i,j, 1) = rgb(16,1);
            img(i,j, 2) = rgb(16,2);
            img(i,j, 3) = rgb(16,3);
        end
    end
end

image(img);
