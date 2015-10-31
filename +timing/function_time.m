function [t]=function_time(f)
% function_time Return the execution time for a single execution of f() in seconds
%
%  f : A function with no inputs
%
% The timing accuracy is 10% or better. So if the true time is
% "t" and the measured time is "m", it should attempt to ensure
% that abs((m-t)/t) < 0.1". This function supports
% execution times of f from micro-seconds to minutes
% efficiently.
%
% The user of this function takes on responsibility for
% making sure that the machine is not loaded, and that
% frequency scaling is turned off.
%
% Examples:
%
% > f=@()( sin(1) );  timing.function_time(f)
%
% > timing.function_time(@()( randn(1000)*randn(1000) ) )

% We measure the time for execution of the input function and we consider
% two cases: a slow function which takes more than 1ms to execute, and a 
% fast function which takes less than 1 ms to execute. in the slow case we
% execute the input function twice, and we return the time taken for the
% second execution as an output measurement of the function execution time.
% This way we ignore any cold-start overhead by not taking into consideration
% the first fucntion execution. In the fast case we loop through the
% function a 1000 times and we take the mean average of the time taken to
% execute the last 999 executions, again ignoring any overhead from the
% first function execution. We return the mean average as an output to the
% fucntion. Plus the end result avereges out any timing resolution
% inaccuracies in addition to compensationg for the start-up costs. In
% order to time "slow" fucntions efficiently we avoid taking the average of
% multiple function executions (as that will be relatively time consuming),
% and simlply take the second execution of the function, compensating for
% overhead. A threshhold of 1ms is taken so that when we consider the
% slowest possible "fast" function taking 1ms to execute, and we loop
% through it a 1000 times our timing function wouldn't take more than 1
% second overall to return the measured time. We can increase the threshold
% by decreasing the number of loops, but in those cases a mean aerage of
% the sample set of measurements often varies, above the 10% accuracy we
% are aiming for. 
t_test =tic;
f();
if toc(t_test) > 0.001
    %fprintf('Slow Function\n');
    n = 2;
    tset_slow(n) = zeros;
    for i = 1:n
        tic;
        f();
        tset_slow(i)=toc;    
        %fprintf('t =%12.7f\n', tset_slow(i));    
    end
    t = mean(tset_slow(2:n));
    %M = median(tset_slow(2:n));
    %plot(tset_slow);
else
    %fprintf('Fast Function\n');
    n = 1000;
    tset_fast(n) = zeros;
    
    for i = 1:n 
        tic;
        f();
        tset_fast(i)=toc;    
        %fprintf('t =%12.7f\n', tset_fast(i));    
    end
    
    t = mean(tset_fast(2:n));
    %M = median(tset_fast(2:n));
    %plot(tset_fast);
    %the first measured times of any given set of times of size n are 
    %substantially different from the rest of the running times, 
    %hence we can ignore it when averaging
end

end