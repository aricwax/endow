%FORMATSHORTYEARS  Format abbreviated short year axis labels
% formatShortYears(hax, ax)
%
% USAGE
%  formatShortYear(hax, ax)
%    Format abbreviated short year labels (2020 is '20) on axes `hax` on axis
%    ruler `ax` (either 'x', 'y', or 'z')
%

% Aric Wax, 2021-06-02
%

function formatShortYears(hax, ax)

    % Get tick values
    switch lower(ax)
        case 'x'
            xt = get(hax, 'XTick');
        case 'y'
            xt = get(hax, 'YTick');
        case 'z'
            xt = get(hax, 'ZTick');
        otherwise
            error('Unknown axis ruler ''%s''.', ax);
    end

    % Subtract century away from years
    xt = xt-100*floor(xt(1)/100);

    % Create formatted labels
    cstr = cell(1, numel(xt));
    for k = 1:numel(xt)
        cstr{k} = sprintf('''%d', floor(xt(k)));
    end

    % Apply labels
    switch lower(ax)
        case 'x'
            set(hax, 'XTickLabel', cstr);
        case 'y'
            set(hax, 'YTickLabel', cstr);
        case 'z'
            set(hax, 'ZTickLabel', cstr);
        otherwise
            error('Unknown axis ruler ''%s''.', ax);
    end

end
