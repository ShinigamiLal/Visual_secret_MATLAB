# Visual_secret_MATLAB
This exercise works with matrix arrays in MATLAB.

This exercise works with matrices, the points evaluated are: 
1) load the file stored in img4k.mat
2) Analyze each pixel of a binary image (consisting of 0's and 1's) and for each pixel two blocks of 2x2 pixels will be generated, the set of all blocks will form two output images twice the size of the original image.
The possible blocks to encode each pixel are:
[1, 1; 0, 0], [0, 0; 1, 1], [1, 0; 1, 0], [0, 1; 0, 1], [1, 0; 0, 1], [0, 1; 1, 0]
Note: The white color of each block will be represented as the value of 1 and black with 0. Each block has its complement, e.g., blocks 1 and 2 are complementary, as are blocks 3 and 4, and 5 and 5. 
blocks 3 and 4, and 5 and 6.
