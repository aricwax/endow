%FORMATDOLLARS  Format dollars axis labels
% formatDollars(hax, ax, den)
%
% USAGE
%  formatDollars(hax, ax, den)
%    Format dollars axis labels on axes `hax` on
%    axis ruler `ax` (either 'x', 'y', or 'z') in multiples of
%    denomination (either '', 'k', or 'M')
%

% Aric Wax, 2021-06-02
%

function formatDollars(hax, ax, den)

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

    % Create formatted labels
    cstr = cell(1, numel(xt));
    for k = 1:numel(xt)
        if any(strcmpi(den, {'m','b','t'}))
            cstr{k} = sprintf('$%s', bankFormat(xt(k), true, den));
        else
            cstr{k} = sprintf('$%s', bankFormat(xt(k), false, den));
        end
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
