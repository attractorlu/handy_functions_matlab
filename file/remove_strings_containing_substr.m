function strings = remove_strings_containing_substr(strings, substr)
% files = remove_strings_containing_substr(strings, substr)
% INPUT: strings: cell array of strings
% 

finding = strfind(strings, substr);
ind = cellfun(@isempty, finding);
strings = strings(ind);