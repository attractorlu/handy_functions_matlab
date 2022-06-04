function ylim_low( y )
% ylim_low( x ) 
% set the lower value of ylim.

yl = ylim;
yl(1) = y;
ylim(yl);

end

