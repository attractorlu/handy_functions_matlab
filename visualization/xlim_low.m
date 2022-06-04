function xlim_low( x )
% xlim_low( x ) 
% set the lower value of xlim.

xl = xlim;
xl(1) = x;
xlim(xl);

end

