# Visual_secret_MATLAB
This exercise works with matrix arrays in MATLAB.

This exercise works with matrices, the points evaluated are: 
1) load the file stored in img4k.mat
2) Analyze each pixel of a binary image (consisting of 0's and 1's) and for each pixel two blocks of 2x2 pixels will be generated, the set of all blocks will form two output images twice the size of the original image.
The possible blocks to encode each pixel are:
[1, 1; 0, 0], [0, 0; 1, 1], [1, 0; 1, 0], [0, 1; 0, 1], [1, 0; 0, 1], [0, 1; 1, 0]
Note: The white color of each block will be represented as the value of 1 and black with 0. Each block has its complement, e.g., blocks 1 and 2 are complementary, as are blocks 3 and 4, and 5 and 5. 
blocks 3 and 4, and 5 and 6.

The rules for assigning the blocks to the output image are:
- When a white pixel (255) is involved, one of the possible blocks will be randomly chosen and will be 
The rules for assigning the blocks to the output image are as follows
- In the case of a black pixel (0) one of the possible blocks will be randomly chosen and written to image 1 and its corresponding position in both output images. 
will be written in image 1 and its complementary block in image 2.
For example, the following figure shows a possible choice of output blocks for a white pixel (row 1) and a black pixel (row 2). white pixel (row 1) and a black pixel (row 2).

The basic idea of the algorithm is to "stack" both images, which can be printed on transparencies or, in our case, apply an AND operation in such a way that the following combinations allow us to 
apply an AND operation in such a way that the following combinations allow us to recover the original 
recover the value of the original image:
- Black AND black gives us black (same block).
- Black AND white gives us black (complementary blocks)
- White AND white gives us white (same block)
