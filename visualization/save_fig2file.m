function save_fig2file(hfig, filename, format)
% save_fig2file(hfig, filename, format)

switch format
    case 'pdf'
        figure2pdf(hfig, filename);
        
    case 'png'
        save_fig(hfig, filename);
            
    otherwise
end

end


