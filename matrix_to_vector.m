function vector = matrix_to_vector(matrix)
% this function converts an image matrix to 1D vector for processing or
% reconstruction
    [rows,cols] = size(matrix);
    vector = zeros(rows*cols,1);
    for i = 1:rows
        for j = 1:cols
            k = cols*(i-1) + j;
            vector(k,1) = matrix(i,j);
        end
    end    
end
