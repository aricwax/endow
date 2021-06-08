%LoadHistCost  Load MSU historical cost data
% aricwax, 2021-04-07
%

% NOTES:
%  + Data taken from <https://www.collegetuitioncompare.com/trends/mississippi-state-university/cost-of-attendance/>
%  + Data is in-state costs

% Academic year
yr = 2011:2020;

% In-state total cost of attendance (COA)
c.coa = [19975, 20902, 21670, 22620, 22924, 23582, 24370, 24957 ...
        ,25904, 25904];

% In-state tutition and fees
c.tut = [5805, 6264, 6772, 7140, 7502, 7780, 8318, 8650, 8910, 8910];

