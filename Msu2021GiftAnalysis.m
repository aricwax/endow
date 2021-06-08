%Msu2021GiftAnalysis  Predicting performance of 2021 MSU JWB Foundation Endowment gift
% aricwax, 2021-04-07
%

% NOTES:
% + Years refer to academic years, with year 1 starting over summer 2021
% + All dollar amounts are in units of nominal USD, unless otherwise stated


%%% Parameters: Global

% Average annual capital return rate, in percent
r = [4 5 6 4 5 6]; % 7.5, 8.0

% Average annual scholarship cost increase, in percent
% An analysis of historical MSU costs shows average increases of:
%  + Total COA: 3.30%
%  + Tuition, fees: 5.50%
d = [3 3 3 4 4 4];

% Initial cost per student per academic year
% MSU costs are:
%  + Total COA: $25904
%  + Tuition, fees: $8910
c0 = 25904;

% Analysis timeframe (years)
t = 10;


%%% Parameters: J.W. Bagley Foundation Scholarship (S1)

% Deposit (gift) schedule
S1.deposit = [48e3*ones(5, 1); 36e3*ones(5, 1)];

% Scholarship award schedule
S1.award   = [48e3*ones(5, 1); 36e3*ones(5, 1)];


%%% Parameters: J.W. Bagley Foundation Endowed Scholarship (S2)

% Initial principal
S2.p0 = 0.00;

% Deposit (gift) schedule
S2.deposit = [60e3*ones(5, 1); 72e3*ones(5, 1)];

% Scholarship award schedule
S2.award   = [00e3*ones(5, 1); 12e3*ones(5, 1)];


%%% Preprocess

% Number of analyses
n = max(numel(r), numel(d));

% Initialize year vector
yr = 2021 + (0:(t-1))';

% Initialize endowment principle tracking vectors
S2.p = zeros(t, n);

% Calculate cost vector
c = c0*(1+d/100).^((0:(t-1))');

% Initialize total award vector
a = zeros(t, n);

% Pad deposit and award vectors
S1.deposit = [S1.deposit; zeros(t-size(S1.deposit, 1), size(S1.deposit, 2))];
S2.deposit = [S2.deposit; zeros(t-size(S2.deposit, 1), size(S2.deposit, 2))];
S1.award   = [S1.award; zeros(t-size(S1.award, 1), size(S1.award, 2))];
S2.award   = [S2.award; zeros(t-size(S2.award, 1), size(S2.award, 2))];


%%% Simulate

% Initial conditions
S2.p(1, :) = S2.p0;

% Main loop
for kn = 1:n
    for kt = 1:t

        % Year-start principle
        pk = S2.p(max(kt-1, 1), kn);

        % Add deposits
        pk = pk + S2.deposit(kt);

        % Remove awards
        pk = pk - S2.award(kt);

        % Compound the interest
        pk = pk * (1+r(kn)/100);

        % Year-end principle
        S2.p(kt, kn) = pk;

    end
end

% Total awards
a = S1.award + S2.award;

% Full cost of attendance students (COAS) funding level
y = a ./ c;
