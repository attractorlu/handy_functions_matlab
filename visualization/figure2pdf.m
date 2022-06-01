function figure2pdf(fig, filename)
% figure2pdf(fig, filename)

set(fig,'Units','Inches');
pos = get(fig,'Position');
set(fig,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize', [pos(3), pos(4)])
print(fig, filename,'-dpdf','-r0')