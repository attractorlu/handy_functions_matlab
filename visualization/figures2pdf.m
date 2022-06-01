function figures2pdf(hfigs, filename)
% convert all figs to a combined pdf file
%

if nargin<1
    hfigs = findobj('Type', 'figure');
    hfigs = flipud(hfigs);
end

if nargin<2
    filename = 'combined.pdf';
end

file_format = 'pdf';
tmp_dir = 'tmp';
create_dir(tmp_dir);

%
figfiles = cell(size(hfigs));
for i = 1:length(hfigs)
        output_fig_file = fullfile(tmp_dir, sprintf('%03d.%s', i, file_format) );
        save_fig2file(hfigs(i), output_fig_file, file_format)
        figfiles{i}=output_fig_file;
end

combine_pdf_files(filename, figfiles)

delete(figfiles{:});
rmdir(tmp_dir);

