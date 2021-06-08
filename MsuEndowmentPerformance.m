%MsuEndowmentPerformance  Analysis of MSU endowment performance
% Aric Wax, 2021-05-02
%

% MSU annual return data (AY12-AY20), in percent
msuper = [-2.6 11.9 15.9 3.4 -4.9 6.0 9.4 -5.8 17.1]';

% Convert to log-points
msupts = log(msuper/100+1)/log(1.01);

% Run 3-year average of MSU data (recently things oscillate with 3-yr period)
msupts_3 = conv(msupts, 1/3*ones(3, 1), 'valid');
msuper_3 = 1.01.^msupts_3;

% Load NACUBO historical data
LoadEndowmentData;

% Estimate 10th and 90th percentile levels through linear regression
tidx = find(term==3);  % use 3-yr terms
pts.p10(:,tidx) = pts.p50(:,tidx) + 0.85*(pts.p25(:,tidx)-pts.p75(:,tidx));
pts.p90(:,tidx) = pts.p50(:,tidx) + 1.03*(pts.p75(:,tidx)-pts.p25(:,tidx));

% Plot 3-yr MSU data against historical 3-yr percentiles
cla
title 'MSU 3-yr Averaged Endowment Performance'
ylabel({'Annual endowment return', '3-yr lagging average (1% points)'})
xlabel('Academic year')
hax = gca;
hold on
LineProps = {'Color', 'k', 'LineWidth', 1.5};
w = 0.7;
col = [102 0 0]/255;
for k = 1:numel(year)
    line(year(k)+[-w +w]/2, pts.p10(k, tidx)*[1 1], 'LineStyle', ':', LineProps{:});
    line(year(k)+[-w +w]/2, pts.p25(k, tidx)*[1 1], 'LineStyle', '--', LineProps{:});
    line(year(k)+[-w +w]/2, pts.p50(k, tidx)*[1 1], 'LineStyle', '-', LineProps{:});
    line(year(k)+[-w +w]/2, pts.p75(k, tidx)*[1 1], 'LineStyle', '--', LineProps{:});
    line(year(k)+[-w +w]/2, pts.p90(k, tidx)*[1 1], 'LineStyle', ':', LineProps{:});
end
legend({'90^{th} percentile', '75^{th} percentile', 'Median', '25^{th} percentile', '10^{th} percentile'}, 'Location', 'EastOutside')
plot(2014:2020, msupts_3, '-o', 'MarkerSize', 18, 'Color', col, 'MarkerFaceColor', col, 'LineWidth', 0.5);
for k = 1:numel(msupts_3)
    text(k+2013, msupts_3(k), num2str(round(10*msupts_3(k))/10, '%2.1f') ...
        , 'HorizontalAlignment', 'center', 'VerticalAlignment', 'middle' ...
        , 'FontSize', 10, 'Color', get(hax, 'Color'), 'BackgroundColor', 'none')
end
axis([2013.5 2020.5 0 14]);
set(hax, 'YTick', [0:14]);
set(hax, 'YGrid', 'on');
set(hax, 'FontSize', 12);
set(legend, 'FontSize', 12);
