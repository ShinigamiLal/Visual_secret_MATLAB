load('img4k.mat');

umbral = 128;

[filas, columnas] = size(K);
imagen_binaria = zeros(filas, columnas);

for i = 1:filas
    for j = 1:columnas
        if K(i, j) > umbral
            imagen_binaria(i, j) = 1;
        else
            imagen_binaria(i, j) = 0;
        end
    end
end

matrices = cat(6, [1, 1; 0, 0], [0, 0; 1, 1], [1, 0; 1, 0], [0, 1; 0, 1], [1, 0; 0, 1], [0, 1; 1, 0]);

[filas, columnas] = size(imagen_binaria);

matrix_out_1 = zeros(filas * 2, columnas * 2);
matrix_out_2 = zeros(filas * 2, columnas * 2);

for i = 1:filas
    for j = 1:columnas
        indice_aleatorio = randi(size(matrices, 6));
        matriz_seleccionada = matrices(:, :, indice_aleatorio);

        x_start = (i - 1) * 2 + 1;
        x_end = x_start + 1;
        y_start = (j - 1) * 2 + 1;
        y_end = y_start + 1;

        matrix_out_1(x_start:x_end, y_start:y_end) = matriz_seleccionada;

        if imagen_binaria(i, j) == 1
            matrix_out_2(x_start:x_end, y_start:y_end) = matriz_seleccionada;
        else
            matriz_complementaria = 1 - matriz_seleccionada;
            matrix_out_2(x_start:x_end, y_start:y_end) = matriz_complementaria;
        end
    end
end

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
