%==========================================================================
%
% rmse  Calculates the root-mean-square error between a set of values and
% a set of estimates of those values.
%
%   RMSE = rmse(x,x_hat)
%
% Copyright © 2021 Tamas Kis
% Last Update: 2022-04-16
% Website: https://tamaskis.github.io
% Contact: tamas.a.kis@outlook.com
%
% REFERENCES:
%   [1] https://en.wikipedia.org/wiki/Root-mean-square_deviation
%
%--------------------------------------------------------------------------
%
% ------
% INPUT:
% ------
%   x       - (double array of any size) true values (data)
%   x_hat   - (double array of same size as "x") estimated values
%
% -------
% OUTPUT:
% -------
%   RMSE    - (1×1 double) root-mean-square error of the estimate
%
%==========================================================================
function RMSE = rmse(x,x_hat)
    RMSE = sqrt(sum((x(:)-x_hat(:)).^2)/numel(x));
end