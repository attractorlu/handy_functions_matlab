function TF = is_strings_containing_substr(strings, substr)
% TF = is_strings_containing_substr(strings, substr)
% INPUT: strings: cell array of strings

TF = cellfun(@(x) ~isempty(strfind(x, substr)), strings);