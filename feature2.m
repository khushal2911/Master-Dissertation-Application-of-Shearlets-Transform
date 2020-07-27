function feat_vect = feature2(n,rows,cols,ST)
% possibly try separating horizontal and vertical shearlets' coefficients.
sum = zeros(rows,cols);
    for k=1:n
       sum = sum + abs(ST(:,:,k));
    end
    feat_vect = sum;
%     feat_vect = matrix_to_vector(sum); commented for use with
%     orldata_train.m and facerecog2.m
end