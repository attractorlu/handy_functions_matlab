function save_fig( hfig, filename )
% save_fig( hfig, filename )
% save figure as is

F = getframe(hfig);
imwrite( F.cdata, filename);

end

