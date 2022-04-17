%==========================================================================
%
% scale_data  Linearly scales data to start and end between specified
% points.
%
%   [x_new,y_new] = scale_data(x,y,[x1,y1],[x2,y2])
%
% Copyright © 2021 Tamas Kis
% Last Update: 2022-04-16
% Website: https://tamaskis.github.io
% Contact: tamas.a.kis@outlook.com
%
%--------------------------------------------------------------------------
%
% ------
% INPUT:
% ------
%   x       - (1×m or m×1 double) independent variable data
%   y       - (1×m or m×1 double) dependent variable data
%   [x1,y1] - (1×2 double) new starting point for scaled data
%   [x2,y2] - (1×2 double) new ending point for scaled data
%
% -------
% OUTPUT:
% -------
%   x_new   - (1×m or m×1 double) scaled independent variable data
%   y_new   - (1×m or m×1 double) scaled dependent variable data
%
% -----
% NOTE:
% -----
%   --> Scaling is linear.
%   --> m = number of data points
%
%==========================================================================
function [x_new,y_new] = scale_data(x,y,point1,point2)
    
    % extracts (x1,y1) and (x2,y2) from point1 and point 2
    x1 = point1(1);
    y1 = point1(2);
    x2 = point2(1);
    y2 = point2(2);
    
    % scales data
    x_new = ((x2-x1)*(x-x(1)))/(x(end)-x(1))+(x1-x(1));
    y_new = ((y2-y1)*(y-y(1)))/(y(end)-y(1))+(y1-y(1));
    
end