function MSE = MSE_calc(sample, population)
    len = length(sample);
    sum = 0;
    for i = 1 : len
       sum = sum + (sample(i) - population)^2;
    end
    MSE = sum / len;
end