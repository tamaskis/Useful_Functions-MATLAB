%==========================================================================
%
% circle  Returns the coordinates for plotting a circle.
%
%   [x,y] = circle(xc,yc,r)
%
% Copyright © 2022 Tamas Kis
% Last Update: 2022-07-05
% Website: https://tamaskis.github.io
% Contact: tamas.a.kis@outlook.com
%
%--------------------------------------------------------------------------
%
% ------
% INPUT:
% ------
%   xc      - (1×1 double) x-coordinate of circle's center
%   yc      - (1×1 double) y-coordinate of circle's center
%   r       - (1×1 double) radius of circle
%
% -------
% OUTPUT:
% -------
%   x       - (1×1001 double) x-coordinates of circle
%   y       - (1×1001 double) y-coordinates of circle
%
%==========================================================================
function [x,y] = circle(xc,yc,r)
    theta = 0:(2*pi/1000):(2*pi);
    x = xc+r*cos(theta);
    y = yc+r*sin(theta);
end