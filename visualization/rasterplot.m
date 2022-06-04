function rasterplot(x,y,h,linespec)
% rasterplot(x,y,h,linespec)
% x: spike time
% y: y position
% h: height of spike
% linespec: line style specification string eg: color
if nargin<4
    linespec = '-';
end

n=length(x);
xx=nan(n*3,1);
xx(1:3:end)=x;
xx(2:3:end)=x;

yy=nan(n*3,1);
yy(1:3:end)=y-h/2;
yy(2:3:end)=y+h/2;

plot(xx,yy,linespec);

end