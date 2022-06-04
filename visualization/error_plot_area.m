function error_plot_area(varargin) 
% error_plot_area(data) 
% error_plot_area(x, data) 
% error_plot_area(data, color) 
% error_plot_area(x, data, color) 

if nargin == 1
    hasx = false;
    data = varargin{1};
    ix = 2; % extra arg index

elseif nargin == 2
    if ischar(varargin{2})
        hasx = false;
        data = varargin{1};
        ix = 2;
        
    else
        hasx = true;
        x = varargin{1};
        data = varargin{2};
        ix = 3;
    end
    
elseif nargin > 2
    hasx = true;
    x = varargin{1};
    data = varargin{2};
    ix = 3;
        
end

if iscell(data)
    ave = cellfun(@nanmean, data);
    sem = cellfun(@(x) std(x, 'omitnan')/sqrt( sum(~isnan(x))) , data);
%     sem = cellfun(@(x) std(x, 'omitnan'), data);
else
    ave = nanmean(data);
    sem = std(data,'omitnan')./sqrt( sum(~isnan(data)) );
%     sem = std(data,'omitnan');
end

if hasx
    %remove nan
    rm = isnan(x) | isnan(ave) | isnan(sem);
    error_area(x(~rm), ave(~rm), sem(~rm), varargin{ix:end})
else
    rm = isnan(ave) | isnan(sem);
    error_area(ave(~rm), sem(~rm), varargin{ix:end})
end

alpha(0.5)
end

