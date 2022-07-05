%==========================================================================
%
% cumulative_integral  Cumulative integration of data (i.e. arrays) over 
% the domain of the data.
%
%   CI = cumulative_integral(x,y)
%
% See also cumtrapz.
%
% Copyright © 2022 Tamas Kis
% Last Update: 2022-07-05
% Website: https://tamaskis.github.io
% Contact: tamas.a.kis@outlook.com
%
% TECHNICAL DOCUMENTATION:
% https://tamaskis.github.io/documentation/Integration_and_Differentiation_of_Univariate_Data.pdf
%
%--------------------------------------------------------------------------
%
% ------
% INPUT:
% ------
%   x       - ((N+1)×1 or 1×(N+1) double) independent variable data
%   y       - ((N+1)×1 or 1×(N+1) double) dependent variable data
%
% -------
% OUTPUT:
% -------
%   CI      - ((N+1)×1 or 1×(N+1) double) cumulative integral of y = f(x)
%             w.r.t. x evaluated over the interval defined by x
%
% -----
% NOTE:
% -----
%   --> N = number of subintervals (1 less than the number of data points)
%
%==========================================================================
function CI = cumulative_integral(x,y)
    
    % number of subintervals
    N = length(x)-1;
    
    % preallocates vector to store cumulative integral
    CI = zeros(size(x));
    
    % evaluates cumulative integral using the trapezoidal rule
    for i = 1:N
        CI(i+1) = CI(i)+(y(i+1)+y(i))*((x(i+1)-x(i)))/2;
    end
    
end