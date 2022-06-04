function error_area( varargin )
% error_area( y, e ) 
% error_area( x, y, e) 
% error_area( y, e, c ) 
% error_area( x, y, e, c ) 

if nargin == 1
    error('Not enough input arguments')
    
elseif nargin == 2
    y = varargin{1}(:);
    e = varargin{2}(:);
    x = (1:numel(y))';
    c = [];
    
elseif nargin == 3
    if ischar(varargin{3}) || any(size(varargin{3}) ~= size(varargin{2}))
        y = varargin{1}(:);
        e = varargin{2}(:);
        x = (1:numel(y))';
        c = varargin{3};
    else
        x = varargin{1}(:);
        y = varargin{2}(:);
        e = varargin{3}(:);
        c = [];
    end
    
elseif nargin == 4
    x = varargin{1}(:);
    y = varargin{2}(:);
    e = varargin{3}(:);
    c = varargin{4};

end

if all(e==0)
    e = max(y)*1e-6;
end

upper = y+e;
lower = y-e;
err_y = [upper; lower(end:-1:1)];
err_x = [x; x(end:-1:1)];

if isempty(c)
    patch('XData', err_x, 'YData', err_y, 'EdgeColor', 'none');
%     hold on
%     plot(x, y, 'k')
else
    patch('XData', err_x, 'YData', err_y, 'FaceColor', c, 'EdgeColor', 'none');
%     hold on
%     plot(x, y, 'Color', c)
end

alpha(0.5)

end