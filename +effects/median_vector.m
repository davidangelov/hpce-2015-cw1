function [out] = median_vector(in)

two_border = size(in,1) - 1;
wOut = size(in,2) - two_border;
fprintf('two_border = %12.7f\n', two_border);

out=zeros(1,wOut);

    vector_of_increments = 0:(two_border+1):(two_border+1)*(wOut-1);
    vector_of_new_height = (1:(two_border+1)^2).';
    
%     fprintf('size(vector_of_increments) = %12.7f\n', size(vector_of_increments));
%     fprintf('size(vector_of_new_height) = %12.7f\n', size(vector_of_new_height));
    
    new_increment_matrix = repmat(vector_of_increments, (two_border+1)^2, 1);
    new_height_matrix = repmat(vector_of_new_height, 1, wOut);
    
%     fprintf('size(new_increment_matrix) = %12.7f\n', size(new_increment_matrix));
%     fprintf('size(new_height_matrix) = %12.7f\n', size(new_height_matrix));
    
    nhood = new_increment_matrix + new_height_matrix;
%     fprintf('nhood_element = %12.7f\n', nhood);
    
    nhood(1:numel(nhood)) = in(nhood(1:numel(nhood)));
    
%     fprintf('vector_of_increments = %12.7f\n', vector_of_increments);
%     nhood(:, 1:wOut) = reshape(in((1:two_border^2)),[two_border^2, 1]);
    
    %nhood = in(:, 1:wOut);
%     fprintf('size(nhood) = %12.7f\n', size(nhood));
%     fprintf('size(out) = %12.7f\n', size(out));
    %out(1, 1:wOut) = median(nhood((1:(two_border+1)*two_border)*(1:wOut)));
    
    out(1, 1:wOut) = median(nhood);
    
end

