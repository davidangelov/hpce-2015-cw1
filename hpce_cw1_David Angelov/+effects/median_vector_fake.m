function [out] = median_vector_fake(in)

two_border = size(in,1) - 1;
wOut = size(in,2) - two_border;

out=zeros(1,wOut);

for x=1:wOut    
    nhood = in(:, x:x + two_border);
    out(1,x) = median(nhood(1:numel(nhood)));       
end
end

