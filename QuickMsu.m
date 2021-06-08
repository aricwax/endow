%%% Simulation constants
% Endowment investment annual returns (%) to test and respective percentile
p = [5 10 25 50 75 90 95];
r = [3.7 4.0 4.5 5.2 6.1 7.3 8.1];
%r = [4.0 4.4 5.1 5.8 6.7 7.7 8.5];
nyr = 40;
cai = 3.25;

% Label as draft
isDraft = true;

% Absolute graphing limits
doGraphAbsolute = false;


%%% Specify Models
M = [];

Mk.title  = 'MSU 108k 10-yr Direct-only';
Mk.org    = 'Miss. State';
Mk.enable = false;
Mk.nyr    = nyr;
Mk.coa    = 25904.00;
Mk.ci     = cai;  % COA inflation expected (%)
Mk.cia    = 0*cai;  % Award self-adjusting level (%)
Mk.e0     = 0e6;  % Initial endowment principal
Mk.ein    = 1e3*[000*ones(10, 1); 0];
Mk.din    = 1e3*[108*ones(10, 1); 0];
Mk.eout   = 1e3*[000*ones(10, 1); 0];
M = [M Mk];

Mk.title  = 'MSU 48k 23-yr Direct-only';
Mk.org    = 'Miss. State';
Mk.enable = false;
Mk.nyr    = nyr;
Mk.coa    = 25904.00;
Mk.ci     = cai;  % COA inflation expected (%)
Mk.cia    = 0*cai;  % Award self-adjusting level (%)
Mk.e0     = 0e6;  % Initial endowment principal
Mk.ein    = 1e3*[000*ones(23, 1); 0];
Mk.din    = 1e3*[048*ones(23, 1); 0];
Mk.eout   = 1e3*[000*ones(23, 1); 0];
M = [M Mk];

Mk.title  = 'MSU 2-Step 48k/108k 10-yr Fixed (Proposed)';
Mk.org    = 'Miss. State';
Mk.enable = false;
Mk.nyr    = nyr;
Mk.coa    = 25904.00;
Mk.ci     = cai;  % COA inflation expected (%)
Mk.cia    = 0*cai;  % Award self-adjusting level (%)
Mk.e0     = 0e6;  % Initial endowment principal
Mk.ein    = 1e3*reshape([60 72 00 00 00 00 00 00] .* ones(5, 1), [], 1);
Mk.din    = 1e3*reshape([48 36 00 00 00 00 00 00] .* ones(5, 1), [], 1);
Mk.eout   = 1e3*reshape([00 12 48 48 48 48 48 48] .* ones(5, 1), [], 1);
M = [M Mk];

Mk.title  = 'MSU 4-Step 48k/108k 20-yr Fixed (Proposed-extended)';
Mk.org    = 'Miss. State';
Mk.enable = false;
Mk.nyr    = nyr;
Mk.coa    = 25904.00;
Mk.ci     = cai;  % COA inflation expected (%)
Mk.cia    = 0*cai;  % Award self-adjusting level (%)
Mk.e0     = 0e6;  % Initial endowment principal
Mk.ein    = 1e3*reshape([60 72 84 96 00 00 00 00] .* ones(5, 1), [], 1);
Mk.din    = 1e3*reshape([48 36 24 12 00 00 00 00] .* ones(5, 1), [], 1);
Mk.eout   = 1e3*reshape([00 12 24 36 48 48 48 48] .* ones(5, 1), [], 1);
M = [M Mk];

Mk.title  = 'SCU 4-Step 48k/108k 20-yr Fixed (Proposed-extended)';
Mk.org    = 'Miss. State';
Mk.enable = false;
Mk.nyr    = nyr;
Mk.coa    = 80224.00;
Mk.ci     = cai;  % COA inflation expected (%)
Mk.cia    = 0*cai;  % Award self-adjusting level (%)
Mk.e0     = 0e6;  % Initial endowment principal
Mk.ein    = 1e3*reshape([60 72 84 96 00 00 00 00] .* ones(5, 1), [], 1);
Mk.din    = 1e3*reshape([48 36 24 12 00 00 00 00] .* ones(5, 1), [], 1);
Mk.eout   = 1e3*reshape([00 12 24 36 48 48 48 48] .* ones(5, 1), [], 1);
M = [M Mk];

Mk.title  = 'SCU Flat 48k/100k 15-yr Fixed';
Mk.org    = 'Santa Clara';
Mk.enable = false;
Mk.nyr    = nyr;
Mk.coa    = 80224.00;
Mk.ci     = cai;  % COA inflation expected (%)
Mk.cia    = 0*cai;  % Award self-adjusting level (%)
Mk.e0     = 0e6;  % Initial endowment principal
Mk.ein    = 1e3*reshape([52 52 52 00 00 00 00 00] .* ones(5, 1), [], 1);
Mk.din    = 1e3*reshape([48 48 48 00 00 00 00 00] .* ones(5, 1), [], 1);
Mk.eout   = 1e3*reshape([00 00 00 48 48 48 48 48] .* ones(5, 1), [], 1);
M = [M Mk];

Mk.title  = 'AC Delayed 25k 16-yr Fixed';
Mk.org    = 'Austin College';
Mk.enable = false;
Mk.nyr    = nyr;
Mk.coa    = 55340.00;
Mk.ci     = cai;  % COA inflation expected (%)
Mk.cia    = 0*cai;  % Award self-adjusting level (%)
Mk.e0     = 100e3;  % Initial endowment principal
Mk.ein    = 1e3*[25*ones(16, 1); 00];
Mk.din    = 0;
Mk.eout   = 1e3*[00*ones(16, 1); 25];
M = [M Mk];

Mk.title  = 'ND Delayed 25k 15-yr Fixed';
Mk.org    = 'Notre Dame';
Mk.enable = false;
Mk.nyr    = nyr;
Mk.coa    = 78347.00;
Mk.ci     = cai;  % COA inflation expected (%)
Mk.cia    = 0*cai;  % Award self-adjusting level (%)
Mk.e0     = 109e3;  % Initial endowment principal
Mk.ein    = 1e3*[25*ones(15, 1); 00];
Mk.din    = 0;
Mk.eout   = 1e3*[00*ones(15, 1); 25];
M = [M Mk];

Mk.title  = 'MSU 4-Step 48k/108k 20-yr Variable';
Mk.org    = 'Miss. State';
Mk.enable = false;
Mk.nyr    = nyr;
Mk.coa    = 25904.00;
Mk.ci     = cai;  % COA inflation expected (%)
Mk.cia    = 1*cai;  % Award self-adjusting level (%)
Mk.e0     = 0e6;  % Initial endowment principal
Mk.ein    = 1e3*reshape([60 72 84 96 00 00 00 00] .* ones(5, 1), [], 1);
Mk.din    = 1e3*reshape([48 36 24 12 00 00 00 00] .* ones(5, 1), [], 1);
Mk.eout   = 1e3*reshape([00 12 24 36 48 48 48 48] .* ones(5, 1), [], 1);
M = [M Mk];

Mk.title  = 'MSU Ramp 48k/108k 20-yr Delayed Variable';
Mk.org    = 'Miss. State';
Mk.enable = false;
Mk.nyr    = nyr;
Mk.coa    = 25904.00;
Mk.ci     = cai;  % COA inflation expected (%)
Mk.cia    = 1*cai;  % Award self-adjusting level (%)
Mk.e0     = 0e6;  % Initial endowment principal
Mk.ein    = 1e3*[60 61 63 64 65 67 68 69 70 71 72 73 74 75 76 77 78 79 80 81 00]';
Mk.din    = 1e3*[48 47 45 44 43 41 40 39 38 37 36 35 34 33 32 31 30 29 28 27 00]';
Mk.eout   = 1e3*[zeros(1, 20), 27]';
M = [M Mk];

Mk.title  = 'MSU 4-Step 48k/160k 20-yr Variable';
Mk.org    = 'Miss. State';
Mk.enable = false;
Mk.nyr    = nyr;
Mk.coa    = 25904.00;
Mk.ci     = cai;  % COA inflation expected (%)
Mk.cia    = 1*cai;  % Award self-adjusting level (%)
Mk.e0     = 0e6;  % Initial endowment principal
Mk.ein    = 1e3*reshape([112 124 136 148 00 00 00 00] .* ones(5, 1), [], 1);
Mk.din    = 1e3*reshape([48 36 24 12 00 00 00 00] .* ones(5, 1), [], 1);
Mk.eout   = 1e3*reshape([00 12 24 36 48 48 48 48] .* ones(5, 1), [], 1);
M = [M Mk];


aw = 14;

Mk.title  = 'Notre Dame 27k (Class B, Option 1) 16-yr Direct-only';
Mk.org    = 'Notre Dame';
Mk.enable = true;
Mk.nyr    = nyr;
Mk.coa    = 78347.00;
Mk.ci     = cai;  % COA inflation expected (%)
Mk.cia    = 0*cai;  % Award self-adjusting level (%)
Mk.e0     = 1*109e3;  % Initial endowment principal
Mk.ein    = 0;
Mk.din    = 1e3*[27*ones(16, 1); 00];
Mk.eout   = 1e3*[00*ones(16, 1); 00];
M = [M Mk];

Mk.title  = 'Notre Dame 27k (Class B, Option 1) 16-yr Fixed';
Mk.org    = 'Notre Dame';
Mk.enable = true;
Mk.nyr    = nyr;
Mk.coa    = 78347.00;
Mk.ci     = cai;  % COA inflation expected (%)
Mk.cia    = 0.00;  % Award self-adjusting level (%)
Mk.e0     = 1*109e3;  % Initial endowment principal
Mk.ein    = 1e3*[27*ones(16, 1); 00];
Mk.din    = 0;
Mk.eout   = 1e3*[aw*ones(16, 1); aw];
M = [M Mk];

Mk.title  = 'Notre Dame 27k (Class B, Option 1) 16-yr Fixed 2';
Mk.org    = 'Notre Dame';
Mk.enable = true;
Mk.nyr    = nyr;
Mk.coa    = 78347.00;
Mk.ci     = cai;  % COA inflation expected (%)
Mk.cia    = 0.00;  % Award self-adjusting level (%)
Mk.e0     = 1*109e3;  % Initial endowment principal
Mk.ein    = 1e3*[(27-aw)*ones(16, 1); 00];
Mk.din    = 1e3*[aw*ones(16, 1); 00];
Mk.eout   = 1e3*[00*ones(16, 1); aw];
M = [M Mk];

Mk.title  = 'Notre Dame 27k (Class B, Option 1) 16-yr Variable';
Mk.org    = 'Notre Dame';
Mk.enable = true;
Mk.nyr    = nyr;
Mk.coa    = 78347.00;
Mk.ci     = cai;  % COA inflation expected (%)
Mk.cia    = cai;  % Award self-adjusting level (%)
Mk.e0     = 1*109e3;  % Initial endowment principal
Mk.ein    = 1e3*[27*ones(16, 1); 00];
Mk.din    = 0;
Mk.eout   = 1e3*[aw*ones(16, 1); aw];
M = [M Mk];


%%% Simulate each model
for km = 1:numel(M)

    % Skip if this model is disabled
    if ~M(km).enable
        continue;
    end

    % Get model variables
    nyr  = M(km).nyr;
    e0   = M(km).e0;
    ein  = M(km).ein;
    din  = M(km).din;
    eout = M(km).eout;

    % Truncate/pad model vectors
    ein  = cat(1, ein(1:min(nyr, length(ein))), ein(end)*ones(max(nyr-length(ein), 0), 1));
    din  = cat(1, din(1:min(nyr, length(din))), din(end)*ones(max(nyr-length(din), 0), 1));
    eout = cat(1, eout(1:min(nyr, length(eout))), eout(end)*ones(max(nyr-length(eout), 0), 1));

    % Year vector (academic year)
    yr = 20+(1:nyr)';

    % Endowment investment return multiplier vector
    mr = r/100+1;

    % COA inflation multiplier vector
    ci  = (M(km).ci/100+1).^(0:nyr)';
    cia = (M(km).cia/100+1).^(0:nyr)';

    % Init endowment `e` and awards `d` tracking vectors
    e = zeros(nyr+1, length(mr)) + e0*ones(1, length(mr));
    d = zeros(nyr+1, length(mr));

    % Run model by simulating each year
    for kyr = 1:nyr

        % Endowment draw
        %eout_k = (mr-1).*e(kyr,:);
        %eout_k = min(e(kyr,:), eout_k);
        eout_k = min(e(kyr,:), cia(kyr)*eout(kyr));

        % Direct award
        dout_k = cia(kyr)*din(kyr);

        % Endowment
        e(kyr+1,:) = mr.*(e(kyr,:) + ein(kyr) - eout_k);

        % Awards
        d(kyr+1,:) = dout_k + eout_k;
    end, clear kyr eout_k dout_k

    % Estimated COA
    c = M(km).coa*ci;

    % COA-normalized metrics
    en = e ./ c;
    dn = d ./ c;

    % Cumulative metrics
    ec = cumsum(e(2:end, :));
    enc = cumsum(en(2:end, :));
    dc = cumsum(d(2:end, :));
    dnc = cumsum(dn(2:end, :));

    % Save model and tracking vectors
    M(km).ein = ein;
    M(km).din = din;
    M(km).eout = eout;
    M(km).yr  = yr;
    M(km).e   = e(2:end, :);
    M(km).d   = d(2:end, :);
    M(km).c   = c(2:end, :);
    M(km).en  = en(2:end, :);
    M(km).dn  = dn(2:end, :);
    M(km).ec  = ec(1:end, :);
    M(km).enc = enc(1:end, :);
    M(km).dc  = dc(1:end, :);
    M(km).dnc = dnc(1:end, :);

end, clear km ein din eout nyr yr mr ci cia e d c en dn ec enc dc dnc


%%% Plot!
for km = 1:numel(M)
    
    %
    margins = [0.2 0.2];
    axx = 20+[0 M(km).nyr+0.5];
    axyCum = [0 200];
    axPosX = [4 24.5 45]+0;
    axPosY = [4 23 38];
    axPosYL = [4 21 39];
    axSizX = 17;
    axSizY = 19;
    axSizYL = 12;
    limRat     = 200e3;
    limCum     = 5e6;
    limRatNorm = 4;
    limCumNorm = 150;
    limPri     = 16e6;
    limPriNorm = 200;
    
    % Skip if this model is disabled
    if ~M(km).enable
        continue;
    end

    % Get color sets
    colBg        = get(0, 'defaultAxesColor');
    colFg        = get(0, 'defaultLineColor');
    colOrd       = get(0, 'defaultAxesColorOrder');
    colGrid      = 0.2*colFg + 0.8*colBg;
    colGridMinor = 0.1*colFg + 0.9*colBg;

    % Default axes parameters
    paramsAxes    = { 'XGrid',                  'off' ...
                    , 'XMinorGrid'              'off' ...
                    , 'YGrid',                  'on' ...
                    , 'YMinorGrid'              'on' ...
                    , 'GridColor',              colGrid ...
                    , 'GridAlpha',              1.0 ...
                    , 'MinorGridColor',         colGridMinor ...
                    , 'MinorGridAlpha',         1.0 ...
                    , 'XTick'         ,         axx(1):5:axx(2) ...
                    , 'TitleFontSizeMultiplier',1.20 ...
                    };
    
    % Default title parameters
    paramsTitle   = { 'Units',                  'normalized' ...
                    , 'Position',               [0.02 1.03 0] ...
                    , 'HorizontalAlignment',    'left' ...
                    , 'VerticalAlignment',      'bottom' ...
                    , 'BackgroundColor',        'none' ...
                    , 'FontWeight',             'normal' ...
                    };

    % Set up figure
    hf = figure(100+km);
    M(km).hf = hf;
    clf;
    set(hf, 'Units', 'inches');
    pos = get(hf, 'Position');
    set(hf, 'Position', [pos(1:2) [11 8.5]-margins*2]);
    set(hf, 'PaperOrientation', 'landscape')
    set(hf, 'PaperPositionMode', 'manual');
    set(hf, 'PaperPosition', [margins [11 8.5]-margins*2]);
    set(hf, 'PaperType', 'usletter');
    set(hf, 'PaperSize', [11 8.5]);
    set(hf, 'Toolbar', 'none');

    % Title
    hax = axes('Position', [0 60 64 4]/64);
    axis([0 1 0 1]);
    axis off;
    ht = text(2/64, 8/64, M(km).title, 'VerticalAlignment', 'bottom', 'FontSize', 22, 'FontWeight', 'normal');
    ht = text(62/64, 62/64, 'J.W. Bagley Foundation', 'HorizontalAlignment', 'right', 'VerticalAlignment', 'top', 'FontSize', 20, 'FontWeight', 'bold');
    ht = text(62/64, 6/64, 'College Endowment Projection', 'HorizontalAlignment', 'right', 'VerticalAlignment', 'bottom', 'FontSize', 16, 'FontWeight', 'normal');
    if isDraft
        ht = text(42/64, 8/64, 'DRAFT', 'Color', 0.3*[1 0 0]+0.7*colBg, 'VerticalAlignment', 'bottom', 'HorizontalAlignment', 'center', 'FontWeight', 'bold', 'FontSize', 16);
    end
    hl = line([2/64 62/64], [0 0], 'Color', 0.5*colFg+0.5*colBg, 'LineWidth', 3);

    % Footer
    hax = axes('Position', [0 0 64 1.5]/64);
    axis([0 1 0 1]);
    axis off;
    hl = line([2/64 62/64], [1 1], 'Color', 0.3*colFg+0.7*colBg, 'LineWidth', 2);
    ht = text(2/64, 8/64, ['College Endowment Projection: ', M(km).title], 'VerticalAlignment', 'bottom');
    ht = text(32/64, 8/64, datestr(now, 'mmm dd, yyyy'), 'VerticalAlignment', 'bottom', 'HorizontalAlignment', 'center');
    if isDraft
        ht = text(60/64, 60/64, 'DRAFT', 'Color', 0.3*[1 0 0]+0.7*colBg, 'VerticalAlignment', 'top', 'HorizontalAlignment', 'right', 'FontWeight', 'bold', 'FontSize', 16);
    end

    % Body background
    hax = axes('Position', [0 2 64 58]/64);
    axis([0 1 0 1]);
    axis off;
    hl = line([2/64 62/64], [1 1], 'Color', 0.3*colFg+0.7*colBg, 'LineWidth', 2);

    % Info box
    infoTitleParams = {'FontSize', 11, 'FontWeight', 'normal'};
    infoValueParams = {'FontSize', 11, 'FontWeight', 'normal'};
    infos = { 'Recepient' , M(km).org ...
            ; 'Timeframe' , sprintf('AY%d-AY%d', M(km).yr(1), M(km).yr(end)) ...
            ; 'Total giving (USD)', sprintf('$%s', bankFormat(sum(M(km).ein+M(km).din), true, 'M')) ...
            ; 'Total award (USD)', sprintf('$%s', bankFormat(M(km).dc(end, 2), true, 'M')) ...
            ; 'Avg. award rate (USD/yr)', sprintf('$%s/yr', bankFormat(mean(M(km).d(:, 2)), true, 'k')) ...
            ; 'Initial COA', sprintf('$%s', bankFormat(M(km).coa, true, 'k')) ...
            ; 'COA inflation', sprintf('%#3.3g%%', M(km).ci) ...
            ; 'Total award (COA)', sprintf('%#3.3g COA', round(M(km).dnc(end, 2)*10)/10) ...
            ; 'Avg. award rate (COA/yr)', sprintf('%#3.3g COA/yr', mean(M(km).dn(:, 2))) ...
            ; 'Efficiency', sprintf('%#3.3g COA/$100k', 1e5*M(km).dnc(end, 2) / sum(M(km).ein+M(km).din)) ...
            ; 'Effective Cost (USD/COA)', sprintf('$%s', bankFormat(sum(M(km).ein+M(km).din) / M(km).dnc(end, 2), true, 'k')) ...
            };
    hax = axes('Position', [2 axPosY(3)-2 19 axSizY+2]/64);
    title('\bfSummary');
    set(hax, paramsAxes{:});
    set(get(hax, 'Title'), paramsTitle{:});
    axis([0 1 0 1]);
    axis off;
    hl = line([0 1], [1 1], 'Color', 0.3*colFg+0.7*colBg, 'LineWidth', 4);
    for k = 1:size(infos, 1)
        h = 1/size(infos, 1);
        ky = 1 - (k-0.5)*h;
        kyp = ky - h*[-0.5 -0.5 +0.5 +0.5];
        if mod(k, 2)>0
            kcol = 0.02*colFg + 0.98*colBg;
        else
            kcol = 0.05*colFg + 0.95*colBg;
        end
        hp = patch([0 1 1 0], kyp, kcol, 'LineStyle', 'none');
        hl = line([0 1], kyp(3)*[1 1], 'Color', 0.5*colFg+0.5*colBg);
        ht = text(0.03, ky, infos(k,1), infoTitleParams{:});
        ht = text(0.55, ky, infos(k,2), infoValueParams{:});
    end
    %hl = line([0.42 0.42], [0 1], 'Color', 0.2*colFg+0.8*colBg, 'LineStyle', ':');
    box on


    % Giving rate
    hax = axes('Position', [axPosX(1) axPosYL(2) axSizX axSizYL]/64);
    haxdb = hax;
    hb = bar(M(km).yr, [M(km).ein, M(km).din], 'stacked', 1.0, 'LineStyle', 'none');
    set(hb(1), 'FaceColor', 0.8*colFg+0.2*colBg);
    set(hb(2), 'FaceColor', 0.4*colFg+0.6*colBg);
    title('\bfGiving Rate \rm(USD)');
    set(hax, paramsAxes{:});
    set(get(hax, 'Title'), paramsTitle{:});
    hl = legend('Endowed', 'Direct', 'Location', 'NorthEast');
    set(hl, 'TextColor', colFg);
    xlim(axx);
    if doGraphAbsolute
        ylim([0 limRat]);
    else
        axy = ylim;
        ylim([0 ceil(1.1*axy(2)/10e3)*10e3]);
    end
    formatShortYears(hax, 'X');
    formatDollars(hax, 'Y', 'k');

    % Giving cumulative
    hax = axes('Position', [axPosX(1) axPosYL(1) axSizX axSizYL]/64);
    hb = bar(M(km).yr, cumsum([M(km).ein, M(km).din]), 'stacked', 1.0, 'LineStyle', 'none');
    set(hb(1), 'FaceColor', 0.8*colFg+0.2*colBg);
    set(hb(2), 'FaceColor', 0.4*colFg+0.6*colBg);
    title('\bfCumulative Giving \rm(USD)');
    set(hax, paramsAxes{:});
    set(get(hax, 'Title'), paramsTitle{:});
    hl = legend('Endowed', 'Direct', 'Location', 'NorthEast');
    set(hl, 'TextColor', colFg);
    xlim(axx);
    if doGraphAbsolute
        ylim([0 limCum]);
    else
        axy = ylim;
        ylim([0 ceil(1.1*axy(2)/1e6)*1e6]);
    end
    formatShortYears(hax, 'X');
    formatDollars(hax, 'Y', 'M');

    % Prinicipal level, nominal
    hax = axes('Position', [axPosX(2) axPosY(3) axSizX axSizY]/64);
    pplot(M(km).yr, M(km).e);
    title('\bfPrinicipal Level \rm(USD)');
    set(hax, paramsAxes{:});
    set(get(hax, 'Title'), paramsTitle{:});
    xlim(axx);
    if doGraphAbsolute
        ylim([0 limPri]);
        set(hax, 'YTick', 0:2e6:limPri);
    else
        axy = ylim;
        ylim([0 ceil(1.1*axy(2)/1e6)*1e6]);
    end
    formatShortYears(hax, 'X');
    formatDollars(hax, 'Y', 'M');
    box on;

    % Prinicipal level, COA-normalized
    hax = axes('Position', [axPosX(3) axPosY(3) axSizX axSizY]/64);
    pplot(M(km).yr, M(km).en);
    title('\bfPrinicipal Level \rm(COA)');
    set(hax, paramsAxes{:});
    set(get(hax, 'Title'), paramsTitle{:});
    xlim(axx);
    if doGraphAbsolute
        ylim([0 limPriNorm]);
        set(hax, 'YTick', 0:20:limPriNorm);
    else
        axy = ylim;
        ylim([0 ceil(1.1*axy(2)/10)*10]);
    end
    formatShortYears(hax, 'X');
    box on;

    % Award rate, nominal
    hax = axes('Position', [axPosX(2) axPosYL(2) axSizX axSizYL]/64);
    pplot(M(km).yr, M(km).d);
    title('\bfAward Rate \rm(USD/yr)');
    set(hax, paramsAxes{:});
    set(get(hax, 'Title'), paramsTitle{:});
    xlim(axx);
    if doGraphAbsolute
        ylim([0 limRat]);
    else
        axy = ylim;
        ylim([0 ceil(1.1*axy(2)/10e3)*10e3]);
    end
    formatShortYears(hax, 'X');
    formatDollars(hax, 'Y', 'k');
    box on;

    % Award rate, COA-normalized
    hax = axes('Position', [axPosX(3) axPosYL(2) axSizX axSizYL]/64);
    pplot(M(km).yr, M(km).dn);
    title('\bfAward Rate\rm (COA/yr)');
    set(hax, paramsAxes{:});
    set(get(hax, 'Title'), paramsTitle{:});
    xlim(axx);
    if doGraphAbsolute
        ylim([0 limRatNorm]);
        set(hax, 'YTick', 0:1:4);
    else
        axy = ylim;
        ylim([0 ceil(1.1*axy(2)/1)*1]);
    end
    formatShortYears(hax, 'X');
    box on;

    % Award cumulative, nominal
    hax = axes('Position', [axPosX(2) axPosYL(1) axSizX axSizYL]/64);
    pplot(M(km).yr, M(km).dc);
    title('\bfCumulative Award \rm(USD)');
    set(hax, paramsAxes{:});
    set(get(hax, 'Title'), paramsTitle{:});
    xlim(axx)
    if doGraphAbsolute
        ylim([0 limCum]);
    else
        axy = ylim;
        ylim([0 ceil(1.1*axy(2)/1e6)*1e6]);
    end
    formatShortYears(hax, 'X');
    formatDollars(hax, 'Y', 'M');
    box on;

    % Award cumulative, COA-normalized
    hax = axes('Position', [axPosX(3) axPosYL(1) axSizX axSizYL]/64);
    pplot(M(km).yr, M(km).dnc);
    title('\bfCumulative Award \rm(COA)');
    set(hax, paramsAxes{:});
    set(get(hax, 'Title'), paramsTitle{:});
    xlim(axx);
    if doGraphAbsolute
        ylim([0 limCumNorm]);
    else
        axy = ylim;
        ylim([0 ceil(1.1*axy(2)/10)*10]);
    end
    formatShortYears(hax, 'X');
    box on;

    % Piston plot code fragment
    %col = [0.0 0.0 0.0];
    %plot(M(km).yr, M(km).e(:, 4)/1e6, 'square', 'Color', col, 'LineWidth', 2, 'MarkerSize', 4);
    %plot(M(km).yr'.*[1 1]', M(km).e(:, [3 5])'/1e6, '-', 'Color', col, 'LineWidth', 4);
    %plot(M(km).yr'.*[1 1]', M(km).e(:, [2 6])'/1e6, '-', 'Color', col, 'LineWidth', 2);
    %plot(M(km).yr'.*[1 1]', M(km).e(:, [1 7])'/1e6, '-', 'Color', col, 'LineWidth', 0.5);

    % % Endowment level (rainbow)
    %hax = axes('Position', [4 4 24 14]/64);
    %hold on;
    %title('Endowment Level');
    %col = get(hax, 'ColorOrder');
    %col = hsv2rgb([[0 1.5 2.5 4 5.5 8.5]'/18, ones(6, 1), 0.7*ones(6, 1)]);
    %plot(M(km).yr(2:end), M(km).e(2:end, 4)/1e6, 'Color', mean(col(3:4, :), 1), 'LineWidth', 2);
    %plot(M(km).yr(2:end)'.*[1 1]', M(km).e(2:end, [4 7])'/1e6, 'Color', col(6,:), 'LineWidth', 4);
    %plot(M(km).yr(2:end)'.*[1 1]', M(km).e(2:end, [4 1])'/1e6, 'Color', col(1,:), 'LineWidth', 4);
    %plot(M(km).yr(2:end)'.*[1 1]', M(km).e(2:end, [4 6])'/1e6, 'Color', col(5,:), 'LineWidth', 4);
    %plot(M(km).yr(2:end)'.*[1 1]', M(km).e(2:end, [4 2])'/1e6, 'Color', col(2,:), 'LineWidth', 4);
    %plot(M(km).yr(2:end)'.*[1 1]', M(km).e(2:end, [4 5])'/1e6, 'Color', col(4,:), 'LineWidth', 4);
    %plot(M(km).yr(2:end)'.*[1 1]', M(km).e(2:end, [4 3])'/1e6, 'Color', col(3,:), 'LineWidth', 4);
    %box on;
    %xlim(axx);
    %set(hax, 'XTick', axx(1):5:axx(2));
    %xlabel('AY');
    %ylabel('(USD millions)');


end, clear km
