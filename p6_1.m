clear;
n = 50;
num = xlsread('data');
M = 100; % M can be 100
sample = zeros(M, M);
sample_mean = zeros(1, M);
sample_variance = zeros(1, M);
for i = 1 : M
    for j = 1 : M
        index = randi(100);
        sample(i, j) = num(index);
    end
    sample_mean(i) = mean(sample(i, :));
    sample_variance(i) = var(sample(i, :));
end
m = mean(num);
var = var(num);
mse_m = sum(sum(( sample_mean-m).^2))/M;
mse_var = sum(sum(( sample_variance-var).^2))/M;
mse_m
mse_var
