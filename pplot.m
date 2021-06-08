%PPLOT  Percentile plot, for plots with 7 percentiles
% pplot(x, y)
%
% NOTES
%  + Assumed that is `x` is a N-by-1 vector and `y` is a N-by-7 matrix
%    (collection of vectors), where each vector in `y` represents the
%    5th, 10th, 25th, 50th, 75th, 90th, and 95th percentiles in that order.
%

% Aric Wax, 2021-05-21
%

function pplot(x, y)

    % Inherit colors from deafults
    colfg = get(0, 'defaultLineColor');
    colbg = get(0, 'defaultAxesColor');

    % Create false transparency colors
    col1 = 0.1*colfg + 0.9*colbg;
    col2 = 0.2*colfg + 0.8*colbg;
    col3 = 0.3*colfg + 0.7*colbg;

    % Force `x` to be a column vector
    x = x(:);

    % Reformat `x` for patches
    xp = cat(1, x, flip(x, 1));

    % Get patch coordinates
    y1p = cat(1, y(:, 1), flip(y(:, 7), 1));
    y2p = cat(1, y(:, 2), flip(y(:, 6), 1));
    y3p = cat(1, y(:, 3), flip(y(:, 5), 1));

    % Get line coordinates
    y2l = y(:, 2);
    y4l = y(:, 4);

    % Clear axes
    cla;

    % Draw patches
    patch(xp, y1p, col1, 'LineStyle', 'none');
    patch(xp, y2p, col2, 'LineStyle', 'none');
    patch(xp, y3p, col3, 'LineStyle', 'none');

    % Draw lines
    line(x, y4l, 'Color', colfg, 'LineWidth', 0.5, 'LineStyle', '--');
    line(x, y2l, 'Color', colfg, 'LineWidth', 0.5, 'LineStyle', '-');


end
