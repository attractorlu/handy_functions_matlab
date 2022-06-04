function colors = get_default_color_order()
% get_default_color_order()
% get matlab's default color order

h = figure('visible', 'off');
a = axes;
colors = a.ColorOrder;
close(h);