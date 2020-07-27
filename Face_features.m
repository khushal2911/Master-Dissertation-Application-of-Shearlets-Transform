function Feature = Face_features(nScales, subjects, images,rows,cols)
faces = subjects*images;
%% load images and shearlet decomposition
% directionalFilter = modulate2(dfilters('cd','d'),'c');
shearletSystem = SLgetShearletSystem2D(0,rows,cols,nScales);
n = shearletSystem.nShearlets;
thepath = 'D:\OneDrive\Private\acads\DDP\STAGE II\orl-faces\';
Feature = cell(faces);
for i = 1:subjects
    for j=1:images
       fname = [thepath 's' num2str(i) '/' num2str(j) '.pgm'];
       X = imread(fname);
       ST = SLsheardec2D(X,shearletSystem);      
       H((i-1)*images+j,:) = hsc(n,rows,cols,ST);
%        hsc gives very low accuracy with svm      
    end
end
end




        