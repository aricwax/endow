%LoadEndowmentData  Load the NACUBO-TIAA Study of Endowments data
% aricwax, 2020-04-21
%

% Load data from file
data = csvread('~/data/nacubo-endowment-returns.csv');

% Prune non-entries
data = data(data(:,1)!=0, :);

% Fold data to dim1=YEAR, dim2=TERM, dim3 = metric
nTerms = 4;
data = reshape(data, [nTerms, size(data, 1)/nTerms, size(data, 2)]);
data = permute(data, [2 1 3]);

% Compute log-points (log-1.01) data
datal = log(data/100+1)./log(1.01);

% Extract data vectors and matricies
yr     = data(:, 1, 1);
term   = data(1, :, 2);

% Extract percent data matricies
per.avg    = data(:, :, 03);
per.p25    = data(:, :, 04);
per.p50    = data(:, :, 05);
per.p75    = data(:, :, 06);
per.avg_c1 = data(:, :, 07);
per.avg_c2 = data(:, :, 08);
per.avg_c3 = data(:, :, 09);
per.avg_c4 = data(:, :, 10);
per.avg_c5 = data(:, :, 11);
per.avg_c6 = data(:, :, 12);
per.sp500  = data(:, :, 13);
per.r3000  = data(:, :, 14);
per.abi    = data(:, :, 15);
per.cpiu   = data(:, :, 16);
per.hepi   = data(:, :, 17);

% Extract log-points data matricies
pts.avg    = datal(:, :, 03);
pts.p25    = datal(:, :, 04);
pts.p50    = datal(:, :, 05);
pts.p75    = datal(:, :, 06);
pts.avg_c1 = datal(:, :, 07);
pts.avg_c2 = datal(:, :, 08);
pts.avg_c3 = datal(:, :, 09);
pts.avg_c4 = datal(:, :, 10);
pts.avg_c5 = datal(:, :, 11);
pts.avg_c6 = datal(:, :, 12);
pts.sp500  = datal(:, :, 13);
pts.r3000  = datal(:, :, 14);
pts.abi    = datal(:, :, 15);
pts.cpiu   = datal(:, :, 16);
pts.hepi   = datal(:, :, 17);

% Clear temp variables
clear data datal nTerms
