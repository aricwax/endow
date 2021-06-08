%FVAR  Compute the frequency-separated variance of each vector of `x`
% [X, f] = fvar(x)
%

% Aric Wax, 2021-05-25
%


function [X, f] = fvar(x);

% Sequence length
n = size(x, 1);

% Window function
w = ones(n, 1);

% Subtract mean
x = x - mean(x, 1);

% Convert to freq via FFT
X = fft(x);

% Scale to energy-per-bin (by dividing by cumulative energy of window function)
X = abs(X).^2 ./ sum(w.^2);

% Truncate `X` to positive freqs, scale, and produce freq vector `f`
isEven = mod(size(x, 1), 2)~=1;
if isEven

    % Truncate
    X = X(2:end/2+1, :);

    % Scale
    X(1:end-1, :) = 2*X(1:end-1, :);

    % Normalized freq (freq divided by sample rate) vector
    f = (1:size(X, 1))/n;

else

    % Truncate
    X = X(2:ceil(end/2), :);

    % Scale
    X(1:end, :) = 2*X(1:end, :);

    % Normalized freq (freq divided by sample rate) vector
    f = (1:size(X, 1))/(n+1);

end

% Use Bessel's correction to compute unbiased variance from energy
X = X / max(n-1, 1);

end
