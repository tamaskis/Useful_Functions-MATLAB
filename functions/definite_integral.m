%==========================================================================
%
% definite_integral  Definite integration of data (i.e. arrays) over 
% the domain of the data.
%
%   I = definite_integral(x,y)
%
% See also trapz.
%
% Copyright © 2022 Tamas Kis
% Last Update: 2022-04-16
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
%   I       - ((N+1)×1 or 1×(N+1) double) definite integral of y = f(x)
%             w.r.t. x evaluated over the interval defined by x
%
% -----
% NOTE:
% -----
%   --> N = number of data points (i.e. length of "y" and "x")
%
%==========================================================================
function I = definite_integral(x,y)
    
    % number of subintervals
    N = length(x)-1;
    
    % initializes definite integral
    I = 0;

    % evaluates definite integral using the trapezoidal rule
    for i = 1:N
        I = I+(y(i+1)+y(i))*((x(i+1)-x(i)))/2;
    end
    
end