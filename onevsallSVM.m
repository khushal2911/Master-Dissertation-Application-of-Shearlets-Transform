%# train one-against-all models
% run D:\OneDrive\Private\acads\DDP\libraries\libsvm-3.18\libsvm-3.18\windows\svmtrain.mexw64;
% run D:\OneDrive\Private\acads\DDP\libraries\libsvm-3.18\libsvm-3.18\windows\svmpredict.mexw64;
subjects = 40;
trainData = Train_data;
testData = Test_data;
trainLabel = Train_Labels;
testLabel = Test_Labels;

u=unique(Train_Labels);
asdf = no_test*subjects; % number of test images
numLabels=length(u);
model = cell(numLabels,1);
for k=1:numLabels
    model{k} = svmtrain(double(trainLabel==k), trainData, '-c 1 -g 0.2 -b 1');
end

%# get probability estimates of test instances using each model
prob = zeros(asdf,numLabels);
for k=1:numLabels
    [~,~,p] = svmpredict(double(testLabel==k), testData, model{k}, '-b 1');
    prob(:,k) = p(:,model{k}.Label==1);    %# probability of class==k
end

%# predict the class with the highest probability
[~,pred] = max(prob,[],2);
acc = sum(pred == testLabel)./numel(testLabel);
accuracy = acc*100