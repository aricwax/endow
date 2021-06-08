%BANKFORMAT  Format value(s) as string or cellstring of US currency
% str = bankFormat(x, dec, den)
%
% USAGE
%  str = bankFormat(x)
%    Format value(s) `x` as string or cellstring `str` of US currency
%
%  str = bankFormat(x, dec)
%    Format value(s) `x` as string or cellstring `str` of US currency
%    with decimals `dec` (either `true` or `false`)
%
%  str = bankFormat(x, dec, den)
%    Format value(s) `x` as string or cellstring `str` of US currency
%    in denominations `den` (either '', 'k', 'M', 'B', or 'T')
%    with decimals `dec` (either `true` or `false`)
%

% Aric Wax, 2021-06-02
%

function str = bankFormat(x, dec, den)

%%% Handle arguments
    % Get decimals
    if nargin>1
        switch dec
            case {true, 'true'}
                doDec = true;
            case {false, 'false'}
                doDec = false;
            otherwise
                error('Unknown decimal specification.');
        end
    else
        doDec = true;
    end

    % Get denomination
    if nargin>2
        switch lower(den)
            case ''
                dstr = '';
                dfac = 1e0;
            case 'k'
                dstr = 'k';
                dfac = 1e3;
            case 'm'
                dstr = 'M';
                dfac = 1e6;
            case 'b'
                dstr = 'B';
                dfac = 1e9;
            case 't'
                dstr = 'T';
                dfac = 1e12;
            otherwise
                error('Unknown denomination ''%s''.', den);
        end
    else
        dstr = '';
        dfac = 1e0;
    end

    % Create formatted labels
    str = cell(1, numel(x));
    for k = 1:numel(x)

        % Get this value
        xk = x(k);

        % Divide by denomination factor
        xk = xk / dfac;

        % Round to nearest hundreth
        xk = round(100*xk)/100;

        % Create round value string
        rvstr = sprintf('%d', floor(xk));

        % Create decimal value string
        decstr = sprintf('%02d', 100*(xk-floor(xk)));


        %%% Add commas

        % Pad left side of numbers with nulls so number of characters is a
        % integer multiple of 3
        rvstr = [char(zeros(1, 3*ceil(numel(rvstr)/3)-numel(rvstr))), rvstr];

        % Reshape string to 3-by-N matrix of characters
        rvstr = reshape(rvstr', 3, []);

        % Affix commas to matrix so every three characters is followed by
        % a comma
        rvstr = cat(1, rvstr, repmat(',', 1, size(rvstr, 2)));

        % Reshape string back to 1-by-N vector of characters (normal string)
        rvstr = rvstr(:)';

        % Remove last comma
        rvstr = rvstr(1:end-1);

        % Remove nulls
        rvstr = rvstr(rvstr~=0);


        % Format final string
        if doDec
            str{k} = sprintf('%s.%s%s', rvstr, decstr, dstr);
        else
            str{k} = sprintf('%s%s', rvstr, dstr);
        end

    end

    % Convert single element or empty cellstring to string
    if numel(str)==1
        str = str{1};
    elseif isempty(str)
        str = '';
    end

end
