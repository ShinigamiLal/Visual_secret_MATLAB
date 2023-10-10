% Cargar la imagen desde el archivo 'img4k.mat'
load('img4k.mat');

%Definiciion de la variable que nos permitira binarizar la imagen 
umbral = 128;

% Crear una matriz de ceros con las mismas dimensiones que la imagen
[filas, columnas] = size(K);
imagen_binaria = zeros(filas, columnas);

% Binarizar la imagen manualmente usando el umbral
for i = 1:filas
    for j = 1:columnas
        if K(i, j) > umbral
            imagen_binaria(i, j) = 1;
        else
            imagen_binaria(i, j) = 0;
        end
    end
end
% Definir las matrices 2x2
matrices = cat(6, [1, 1; 0, 0], [0, 0; 1, 1], [1, 0; 1, 0], [0, 1; 0, 1], [1, 0; 0, 1], [0, 1; 1, 0]);

% Obtener las dimensiones de la imagen
[filas, columnas] = size(imagen_binaria);

% Inicializar las matrices de salida
matrix_out_1 = zeros(filas * 2, columnas * 2);
matrix_out_2 = zeros(filas * 2, columnas * 2);

% Recorrer la imagen binaria
for i = 1:filas
    for j = 1:columnas
        if imagen_binaria(i, j) == 1
            % Genera un índice aleatorio para seleccionar una matriz
            indice_aleatorio = randi(size(matrices, 6));
            % Obtiene la matriz seleccionada
            matriz_seleccionada = matrices(:, :, indice_aleatorio);

            % Calcula las coordenadas en la matriz de salida
            x_start = (i - 1) * 2 + 1;
            x_end = x_start + 1;
            y_start = (j - 1) * 2 + 1;
            y_end = y_start + 1;

            % Asigna la matriz seleccionada a las posiciones correspondientes en la matriz de salida 1
            matrix_out_1(x_start:x_end, y_start:y_end) = matriz_seleccionada;

            % Asigna la matriz complementaria a las posiciones correspondientes en la matriz de salida 2
            matrix_out_2(x_start:x_end, y_start:y_end) = matriz_seleccionada;
        else
            % Genera un índice aleatorio para seleccionar una matriz
            indice_aleatorio = randi(size(matrices, 6));
            % Obtiene la matriz seleccionada
            matriz_seleccionada = matrices(:, :, indice_aleatorio);

            % Calcula las coordenadas en la matriz de salida
            x_start = (i - 1) * 2 + 1;
            x_end = x_start + 1;
            y_start = (j - 1) * 2 + 1;
            y_end = y_start + 1;

            % Asigna la matriz seleccionada a las posiciones correspondientes en la matriz de salida 1
            matrix_out_1(x_start:x_end, y_start:y_end) = matriz_seleccionada;

            % Calcula el complemento de la matriz seleccionada
            matriz_complementaria = 1 - matriz_seleccionada;

            % Asigna la matriz complementaria a las posiciones correspondientes en la matriz de salida 2
            matrix_out_2(x_start:x_end, y_start:y_end) = matriz_complementaria;
        end
    end
end
%Aplicacion de la operaciion AND 
resultado_and = matrix_out_1 & matrix_out_2;
figure;
imshow(matrix_out_1);
title("Primer imagen de salida")
figure;
imshow(matrix_out_2);
title("Segunda imagen de salida")
figure;
imshow(resultado_and);
title("Aplicación AND")