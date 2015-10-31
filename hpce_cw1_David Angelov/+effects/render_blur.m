function [out] = render_blur(in)
% render_blur Directly blurs an image
%
%  This function is defined by equivalence with apply_scalar and blur_scalar:
%  > [o1]=render.apply_scalar(@effects.blur_scalar, 1, im);
%  > [o2]=effects.render_blur(im);
%  > assert(all(all(o1==o2)));
%
%  As much as possible this should be a simple de-abstraction, with the
%  body of effects.blur_scalar inserted directly into render.apply_scalar,
%  with no further optimisations.

border = 1;

hIn=size(in,1);
wIn=size(in,2);

hOut=hIn-2*border;
wOut=wIn-2*border;

assert(hOut>=1);
assert(wOut>=1);

out=zeros(hOut,wOut);

for y=1:hOut
    for x=1:wOut
        nhood = in(y:y+2*border , x:x+2*border );
        out(y,x) = (nhood(1,2)+nhood(2,1)+4*nhood(2,2)+nhood(2,3)+nhood(3,2))/8;
    end
end


