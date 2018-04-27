function error_area( x, y, e, c )
%ERROR_AREA 

upper = y+e;
lower = y-e;
err_area = [upper lower(end:-1:1)];
err_x = [x x(end:-1:1)];
patch('XData', err_x, 'YData', err_area, 'FaceColor', c, 'EdgeColor', c);
hold on
plot(x,y,'Color',c);

end

