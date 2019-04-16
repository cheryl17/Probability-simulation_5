clear;

fid = fopen('data');
data_in = textscan(fid, '%f');
data = cell2mat(data_in);

% (a)
sample_mean = mean(data); % m
sample_variance = var(data, 0); % s^2
fprintf("(a) sample mean: %.2f, sample variance: %.2f\n", ...
        sample_mean, sample_variance);

% (b)
sorted_data = sort(data);
len = length(data); % len is supposed to be 100
count = (1:1:100)./100;
figure(1);
plot(sorted_data, count);
title('(b) The CDF of the empirical distribution');

% (c)
maxData = sorted_data(len);
num_intervals = ceil(maxData / 5);
% [0,5) [5,10) ... 
pmf = zeros(1, num_intervals);
for i = 1 : len
    index = ceil(data(i) / 5);
    pmf(index) = pmf(index) + 1;
end
figure(2);
plot(pmf);
title('(c) The PMF of the discrete approximation');

% (d)
M = 50; % M can be 50 or 100
bootstrap_samples = zeros(M, len);
boot_sample_mean = zeros(1, M);
boot_sample_variance = zeros(1, M);
for i = 1 : M
    for j = 1 : len
        index = randi(100);
        bootstrap_samples(i, j) = data(index);
    end
    boot_sample_mean(i) = mean(bootstrap_samples(i, :));
    boot_sample_variance(i) = var(bootstrap_samples(i, :));
end

% (f)
% the population variance of the empirical distribution
population_variance = var(data, 1);
MSE = MSE_calc(boot_sample_variance, population_variance);
fprintf("(f) MSE of the sample variance: %.2f\n", MSE);
