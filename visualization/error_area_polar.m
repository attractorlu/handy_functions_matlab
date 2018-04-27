function error_area_polar( theta, rho, e, color )
% error_area_polar( theta, rho, e, color )

theta = theta(:);
theta = [theta; theta(1)];
rho = rho(:);
rho = [rho; rho(1)];
e = e(:);
e = [e; e(1)];

polar(theta, rho)

hold on
upper = rho+e;
lower = rho-e;

err_rho = [upper; lower(end:-1:1)];
err_theta = [theta; theta(end:-1:1)];
x = err_rho.*cos(err_theta);
y = err_rho.*sin(err_theta);
patch('XData', x, 'YData', y, 'FaceColor', color, 'EdgeColor', color);


end

