function data_smooth = gaussian_smooth_1d( data, stdev )
% data_smooth = gaussion_smooth_1d( data, std )
% stdev: in unit of data points

N = ceil(3*stdev);
x = -N:N;
y = exp(-1/2*(x/stdev).^2)/(sqrt(2*pi)*stdev) ;

data_smooth = data;
n = size(data,1);
for i=1:n
    data_smooth(i,:) = conv(data(i,:), y, 'same');
end

end

