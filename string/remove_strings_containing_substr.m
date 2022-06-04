function strings = remove_strings_containing_substr(strings, substr)
% strings = remove_strings_containing_substr(strings, substr)
% INPUT: strings: cell array of strings
% 

TF = is_strings_containing_substr(strings, substr);
strings = strings(~TF);