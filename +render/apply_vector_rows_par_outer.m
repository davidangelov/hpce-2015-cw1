function [out] = apply_vector_rows_par_outer(f, border, in)
% apply_scalar_vector_rows Applies a pixel-by-pixel effect to an image.
%
% f - A function taking a 2*border+1 x 2*border+w row of pixels,
%     and producing a 1 x w row of output pixels
% border - How much extra surrounding input is needed to produce one pixel
% in - Input image as a gray-scale double-precision matrix
%
% Given an input image of width=size(in,2) and height=size(in,1), this
% produces an image of size (height-2*border) x (width-2*border).
%
% Ensures that for all border<y<=height-border and border<x<=width-border
%  out(y-border,1:end) = f( in(y-border:y+border,:) )
%
% > [out]=render.apply_vector_rows(@(x)(1-x), 0, image); % invert an image

hIn=size(in,1);
wIn=size(in,2);

hOut=hIn-2*border;
wOut=wIn-2*border;

assert(hOut>=1);
assert(wOut>=1);

out=zeros(hOut,wOut);
%fprintf('wOut =%12.7f\n', wOut);
parfor y=1:hOut
    %for x=1:wOut
        nhood = in(y:y+2*border ,:);
        out(y,:) = f(nhood);
    %end
end

