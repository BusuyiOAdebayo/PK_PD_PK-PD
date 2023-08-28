% Here is an example of a MATLAB code that uses quantitative structure-activity relationships (QSAR) to predict the pKa values of a set of compounds:

% Load the data
data = readtable('pKa_data.csv');
X = data{:, 1:end-1}; % features
y = data{:, end}; % pKa values

% Standardize the data
X_std = zscore(X);

% Split the data into training and testing sets
rng(1); % for reproducibility
[X_train, X_test, y_train, y_test] = train_test_split(X_std, y, 0.8);

% Train the QSAR model
model = fitrlinear(X_train, y_train);

% Predict the pKa values on the testing set
y_pred = predict(model, X_test);

% Calculate the prediction error
error = y_test - y_pred;
mean_error = mean(abs(error));

% This code begins by loading the data from a CSV file using the readtable function and splitting it into features (X) and pKa values (y). It then standardizes the data using the zscore function and splits it into training and testing sets using the train_test_split function.

% Next, it trains the QSAR model using the fitrlinear function and the training data, and predicts the pKa values on the testing set using the predict function. Finally, it calculates the prediction error by comparing the predicted and actual pKa values and calculates the mean absolute error.

% This code can be modified to include different QSAR models or to incorporate additional features or constraints on the model. You can also use the fitrlinear function to train a regularized model, by setting the Lambda parameter to a non-zero value. This can help to reduce overfitting and improve the generalization performance of the model.
