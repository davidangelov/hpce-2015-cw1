% n = 1e6;
% x = randn(1, n);
% 
% tic 
% for t = 1:n
%     x(t) = x(t) * x(t);
% end
% toc
% 
% tic;
% x = x .* x;
% toc
% 
% R = 100;
% y = 2:R;
% o = y'*y;
% 
% mask = ismember(y,o);
% res = y(~mask);
% time(1000) = zeros;
% 
% for i = 1:1000
%     time(i) = timing.function_time(randn(i));
% end
% 
% plot(time);

% y1 = @()(randn(10));
% y3 = @()( sin(1) );
% y2 = @()( randn(1000)*randn(1000) );
% t1 = timing.function_time(y3);
% t2 = timing.function_time(y2);
% fprintf('Final result: ');
% fprintf('t =%12.7f\n', t1);
% fprintf('Final result median: ');
% fprintf('M =%12.7f\n', M);

% tic;
% t_test =tic;
% y1;
% if toc(t_test) > 0.0001
%     fprintf('Slow Function\n');
% else
%     fprintf('Fast Function\n');
% end
% toc;

% f1 = @(n)( randn(n).^2 );
% f2 = @(n)( inv(randn(n)));
% y1 = @(n)(randn(n));
% y3 = @()( sin(1) );
% y2 = @()( randn(1000)*randn(1000) );

%[ts,ns]=timing.function_time_against_n(f1, 1:1000, 5.00);
%[ts,ns]=timing.function_time_against_n(f1, 1:2:1000, 5.0);

%timing.plot_function_time_against_n(y1);

%timing.plot_function_time_against_n(@rand,round(10.^(0:0.25:4)),20.00);

% f1=@(n)( rand(n,1) );
% f2=@(n)( rand(n,n) );
% f3=@(n)( rand(n,n)^2 );
% f4=@(n)( rand(n)*rand(n) );
% timing.plot_function_time_against_n( { f1, f2, f3, f4 } );

% f=@(x,y)( randn(x)^y );
% f1=@(n)( f(100,n) );
% f2=@(n)( f(n,100) );
% timing.plot_function_time_against_n( { f1, f2 } );

% f1=@(n)( rand(n) );
% timing.plot_function_time_against_n( { f1, f1 } );

% figure(1);
% plot(ns, ts);
% 
% im= double(imread('cameraman.tif'))/256;
% im=render.apply_scalar(@effects.scharr_scalar, 1, im);
% imwrite(im,'+effects/cameraman_new.scharr.ref.png');
% 
% im1 = imread('+effects/cameraman.scharr.ref.png');
% im2 = imread('+effects/cameraman_new.scharr.ref.png');
% 
% %result = im2 - im1;
% 
% all(all( abs(im1-im2) < 0.01 ));
% 
% imshow(im1);
% imshow(im);
% 
% im= double(imread('cameraman.tif'))/256;
% im=render.apply_scalar(@effects.median_scalar, 3, im);
% 
% imwrite(im,'+effects/cameraman_new.median7x7.ref.png');
% 
% im1= (imread('+effects/cameraman.median7x7.ref.png'));
% im2= (imread('+effects/cameraman_new.median7x7.ref.png'));
% 
% result = im1 - im2;
% 
% imshow(im2);

im= double(rgb2gray(imread('pears.png')))/256;
% imshow( render.apply_scalar( @effects.median_scalar, 1, im ) );
% pause;
% imshow( render.apply_scalar( @effects.median_scalar, 6, im ) );
% 
% f1=@(n)( render.apply_scalar( @effects.median_scalar, n, rand(100) ) );
% f2=@(n)( render.apply_scalar( @effects.median_scalar, 4, rand(96+n) ) );
% timing.plot_function_time_against_n( {f1, f2}, 4:1000 )

%  [o1]=render.apply_scalar(@effects.blur_scalar, 1, im);
%  [o2]=effects.render_blur(im);
% 
%  result = o1 - o2;
% 
% f1=@(n)( render.apply_scalar( @effects.blur_scalar, 1, rand(n) ) );
% f2=@(n)( effects.render_blur( rand(n) ) );
% timing.plot_function_time_against_n( {f1, f2}, 10:10:1000 )
% 
% tic; render.apply_scalar_par_inner( @effects.invert_scalar, 0, rand(500) ); toc
% tic; render.apply_scalar( @effects.invert_scalar, 0, rand(500) ); toc
% 
% ftall=@(n)( render.apply_scalar_par_inner( @effects.invert_scalar, 0, rand(n,8) ));
% fwide=@(n)( render.apply_scalar_par_inner( @effects.invert_scalar, 0, rand(8,n) ));
% timing.plot_function_time_against_n({ftall,fwide}, 2.^(3:16), 5);

% f1=@(n)( render.apply_scalar( @effects.median_scalar, n, rand(50,50) ));
% f2=@(n)( render.apply_scalar_par_inner( @effects.median_scalar, n, rand(50,50) ));
% timing.plot_function_time_against_n({f1,f2}, 0:24, 60);

% ftall=@(n)( render.apply_scalar_par_outer( @effects.invert_scalar, 0, rand(n,8) ));
% fwide=@(n)( render.apply_scalar_par_outer( @effects.invert_scalar, 0, rand(8,n) ));
% timing.plot_function_time_against_n({ftall,fwide}, 2.^(3:16), 5);

% border=3;
% f1=@(n)( render.apply_scalar( @effects.median_scalar, border, rand(n,n) ) );
% f2=@(n)( render.apply_scalar_par_inner( @effects.median_scalar, border, rand(n,n) ) );
% f3=@(n)( render.apply_scalar_par_outer( @effects.median_scalar, border, rand(n,n) ) );
% timing.plot_function_time_against_n({f1,f2,f3}, 50:50:1000, 10);

% f1=@(n)( render.apply_scalar( @effects.invert_scalar, 0, rand(n,n) ) );
% f2=@(n)( render.apply_scalar_par_outer( @effects.invert_scalar, 0, rand(n,n) ) );
% timing.plot_function_time_against_n({f1,f2}, 50:50:1000, 10);

% im= double(rgb2gray(imread('pears.png')))/256;
% imshow( render.apply_vector_rows( @effects.invert_scalar, 0, im ) )

% f1=@(n)( render.apply_scalar( @effects.invert_scalar, 0, rand(n) ));
% f2=@(n)( render.apply_vector_rows( @effects.invert_scalar, 0, rand(n) ));
% f3=@(n)( render.apply_scalar_par_outer( @effects.invert_scalar, 0, rand(n) ));
% timing.plot_function_time_against_n({f1,f2,f3},round(10.^(0:0.25:6)), 10.00);

% m= double(rgb2gray(imread('pears.png')))/256;
% imshow( render.apply_vector_rows( @effects.blur_vector, 1, im ) );

% im= double(rgb2gray(imread('pears.png')))/256;
% imshow( render.apply_vector_rows( @effects.scharr_vector, 1, im ) );

% f1=@(n)( render.apply_scalar( @effects.scharr_scalar, 1, rand(n) ));
% f2=@(n)( render.apply_scalar( @effects.scharr_vector, 1, rand(n) ));
% f3=@(n)( render.apply_vector_rows( @effects.scharr_vector, 1, rand(n) ));
% timing.plot_function_time_against_n({f1,f2,f3}, 10:10:1000, 30);

% im=rand(100);
% out1=render.apply_scalar(@effects.median_scalar, 3, im);
% out2=render.apply_vector_rows(@effects.median_vector_fake, 3, im);
% assert(all(all(out1==out2)));
% 
% result = out1 - out2;
% 
% f1=@(n)( render.apply_scalar(@effects.median_scalar, 1, rand(n)) );
% f2=@(n)( render.apply_vector_rows(@effects.median_vector_fake, 1, rand(n)) );
% timing.plot_function_time_against_n({f1,f2}, 20:20:1000, 5);

% f1=@(n)( render.apply_scalar(@effects.median_scalar, n, rand(200)) );
% f2=@(n)( render.apply_vector_rows(@effects.median_vector_fake, n, rand(200)) );
% timing.plot_function_time_against_n({f1,f2},1:10, 20 );

% f1=@(n)( render.apply_vector_rows(@effects.scharr_vector, 1, rand(n)) );
% f2=@(n)( render.apply_scalar_par_outer(@effects.scharr_scalar, 1, rand(n)) );
% f3=@(n)( render.apply_vector_rows_par_outer(@effects.scharr_vector, 1, rand(n)) );
% timing.plot_function_time_against_n({f1,f2, f3}, 50:50:5000, 30);


% f1=@(n)( render.apply_vector_rows_par_outer(@effects.scharr_vector, 1, rand(n)) );
% f2=@(n)( render.apply_vector_rows_par_coarse(@effects.scharr_vector, 1, rand(n)) );
% timing.plot_function_time_against_n({f1,f2}, 50:50:5000, 10);
% 
% im= double(rgb2gray(imread('pears.png')))/256;
% out1=render.apply_vector_rows_par_outer(@effects.scharr_vector, 1, im);
% out2=render.apply_vector_rows_par_coarse(@effects.scharr_vector, 1, im);
% 
% result = out1 - out2;

% f1=@(n)( render.apply_vector_rows_par_outer(@effects.scharr_vector, 1, rand(n)) );
% f2=@(n)( render.apply_vector_rows_par_coarse(@effects.scharr_vector, 1, rand(n)) );
% timing.plot_function_time_against_n({f1,f2}, 50:50:5000, 10);

% out=render.apply_vector_rows_par_outer(@effects.median_vector, 7, rand(100));

% im= double(rgb2gray(imread('pears.png')))/256;
% out1=render.apply_vector_rows(@effects.median_vector, 1, im);
% out2=render.apply_vector_rows(@effects.median_vector_fake, 1, im);
% result = out1 - out2;
% y = max(max(result));
% imshow(out1);

% f1=@(n)( render.apply_vector_rows(@effects.median_vector_fake, 1, rand(n)) );
% f2=@(n)( render.apply_vector_rows(@effects.median_vector, 1, rand(n)) );
% timing.plot_function_time_against_n({f1,f2}, 20:20:1000);

% f1=@(n)( render.apply_vector_rows(@effects.median_vector_fake, n, rand(100)) );
% f2=@(n)( render.apply_vector_rows(@effects.median_vector, n, rand(100)) );
% timing.plot_function_time_against_n({f1,f2}, 1:50, 10);

f1=@(n)( render.apply_vector_opt(@effects.scharr_vector, 1, rand(n)) );
f2=@(n)( render.apply_vector_rows_par_coarse(@effects.scharr_vector, 1, rand(n)) );
timing.plot_function_time_against_n({f1,f2}, 50:50:5000, 20);