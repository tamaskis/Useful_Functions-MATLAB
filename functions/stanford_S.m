%==========================================================================
%
% stanford_S  Returns coordinates for drawing the Stanford S with
% (approximately) the specified number of points.
%
%   [x,y] = stanford_S
%   [x,y] = stanford_S(n)
%   [x,y,xi,yi,xo,yo] = stanford_S
%   [x,y,xi,yi,xo,yo] = stanford_S(n)
%
% Copyright © 2022 Tamas Kis
% Last Update: 2022-04-16
% Website: https://tamaskis.github.io
% Contact: tamas.a.kis@outlook.com
%
%--------------------------------------------------------------------------
%
% ------
% INPUT:
% ------
%   n       - (1×1 double) (OPTIONAL) number of points to use
%
% -------
% OUTPUT:
% -------
%   x       - (m×1 double) x coordinates
%   y       - (m×1 double) y coordinates
%   xi      - ((m/2)×1 double) x coordinates of inner portion
%   yi      - ((m/2)×1 double) y coordinates of inner portion
%   xo      - ((m/2)×1 double) x coordinates of outer portion
%   yo      - ((m/2)×1 double) y coordinates of outer portion
%
% -----
% NOTE:
% -----
%   --> T+1 = length of time vector
%
%==========================================================================
function [x,y,xi,yi,xo,yo] = stanford_S(n)

    % defaults n to 48 if not input
    if nargin == 0
        n = 48;
    end

    % coordinates of upper half
    x_upper = [1.91;1.17;-0.42;-0.42;0.42;0.42;1.91;1.91;1.07;-1.07;...
        -1.91;-1.91];
    y_upper = [0;0.7;0.7;1.49;1.49;0.96;0.96;2.11;2.93;2.93;2.11;0];
    
    % coordinates of lower half
    x_lower = -x_upper;
    y_lower = -y_upper;
    
    % concatenates coordinates to create "outer" line
    xo = [x_upper;x_lower];
    yo = [y_upper;y_lower];
    
    % offsets for upper half of "inner" line
    o = 0.1;
    dx = [-o;-o*cosd(60);-o;-o;o;o;-o;-o;-o*cosd(60);o*cosd(60);o;o];
    dy = [-o*sind(30);-o;-o;o;o;o;o;-o*sind(30);-o;-o;-o*sind(30);o*...
        sind(30)];
    
    % offsets for both halves of "inner" line
    dx = [dx;-dx];
    dy = [dy;-dy];
    
    % coordinates for "inner" line
    xi = xo+dx;
    yi = yo+dy;

    % number of points to add between each existing point (48 = original
    % number of points, 2*22 = 44 = original number of edges)
    l = round((n-48)/44);

    % increases number of points through interpolation
    [xo,yo] = interpshape(xo,yo,l);
    [xi,yi] = interpshape(xi,yi,l);
    
    % groups all points together and adds six extra points
    x = [xo;xi];
    y = [yo;yi];
    
end