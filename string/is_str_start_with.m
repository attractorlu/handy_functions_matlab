function TF = is_str_start_with(str, start_str)
% TF = is_str_start_with(str, start_str)

n = length(start_str);
TF = length(str) >= n && strcmp(str(1:n), start_str);

end