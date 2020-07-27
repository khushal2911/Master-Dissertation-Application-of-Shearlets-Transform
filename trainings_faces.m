rows = 112;
cols = 92;
nScales = 1;
shearletSystem = SLgetShearletSystem2D(0,rows,cols,nScales);
n = shearletSystem.nShearlets;
thepath = 'D:\OneDrive\Private\acads\DDP\STAGE II\orl-faces\';
no_train = 5; % number of training images from 1
no_test = 10 - no_train;

Train_data = [];
Test_data = [];
Train_Labels = [];
Test_Labels = [];

for i = 1:40
    for j = 1:10
        l = i;
        num = j;
        fname = [thepath 's' num2str(i) '/' num2str(j) '.pgm'];
        X = imread(fname);
        ST = SLsheardec2D(X,shearletSystem);
        feat_vect = feature2(n,rows,cols,ST);       
    if num <= no_train    
        Train_data = [Train_data;feat_vect];
        Train_Labels= [Train_Labels;l];
    else
        Test_data = [Test_data;feat_vect];
        Test_Labels = [Test_Labels;l];
    end 
    [i j]
    end
end










