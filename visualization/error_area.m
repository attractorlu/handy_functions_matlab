function error_area( x, y, e, c )
% error_area( x, y, e, c ) 

x = x(:);
y = y(:);
e = e(:);

upper = y+e;
lower = y-e;
err_y = [upper; lower(end:-1:1)];
err_x = [x; x(end:-1:1)];
patch('XData', err_x, 'YData', err_y, 'FaceColor', c, 'EdgeColor', c);

end