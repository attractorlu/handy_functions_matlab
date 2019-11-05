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
else
    ave = nanmean(data);
    sem = std(data,'omitnan')./sqrt( sum(~isnan(data)) );
end

if hasx
    error_area(x, ave, sem, varargin{ix:end})
    hold on
    plot(x, ave, varargin{ix:end})
else
    error_area(ave, sem, varargin{ix:end})
    hold on
    plot(ave, varargin{ix:end})
end

alpha(0.5)
end

