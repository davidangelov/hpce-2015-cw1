function [out]=scharr_scalar(in)

G_x = -3*in(1,1) +3*in(1,3) -10*in(2,1) +10*in(2,3) -3*in(3,1) + 3*in(3,3);
  
G_y = -3*in(1,1) -10*in(1,2) -3*in(1,3) +3*in(3,1) +10*in(3,2) + 3*in(3,3);

G = sqrt(G_x^2+G_y^2);
out = min(G/8, 1);
end