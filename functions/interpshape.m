%==========================================================================
%
% interpshape  Increases the number of points defining a shape by placing n
% uniformly spaced points along each line segment connecting existing
% points.
%
%   [x_new,y_new] = interpshape(x,y,n)
%
% See also interparc.
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
%   x       - (1×N or N×1 double) x-coordinates of points defining shape
%   y       - (1×N or N×1 double) y-coordinates of points defining shape
%   n       - (1×1 double) number of equally-spaced interpolated points per
%             line segment of shape
%
% -------
% OUTPUT:
% -------
%   x_new   - ((N+(N-1)n)×1 or 1×(N+(N-1)n) double) new x-coordinates of 
%             points defining shape
%   y_new   - ((N+(N-1)n)×1 or 1×(N+(N-1)n) double) new y-coordinates of 
%             points defining shape
%
% -----
% NOTE:
% -----
%   --> N = original number of points
%   --> Use interpshape if:
%           • you want to add the same number of points along each line 
%             segment connecting existing points
%           • you want the set of new coordinates defining the shape to 
%             contain the original set of coordinates
%   --> Use interparc if:
%           • you want the shape to be defined using a specific number of 
%             points spaced evenly around the perimeter
%           • you want to use a different type of interpolation (such as 
%             spline interpolation)
%   
%==========================================================================
function [x_new,y_new] = interpshape(x,y,n)
    
    % original number of points
    N = length(x);
    
    % preallocates arrays
    x_interp = zeros(n*(N-1),1);
    y_interp = zeros(n*(N-1),1);
    
    % calculates interpolated points
    for i = 1:(N-1)
        
        % first point forming line
        x1 = x(i);
        y1 = y(i);
        
        % second point forming line
        x2 = x(i+1);
        y2 = y(i+1);
        
        % angle between two points
        theta = atan2(y2-y1,x2-x1);
        
        % distance between two points
        l = sqrt((x2-x1)^2+(y2-y1)^2);
        
        % interpolated points
        for j = 1:n
            x_interp(n*(i-1)+j) = x1+(j/(n+1))*l*cos(theta);
            y_interp(n*(i-1)+j) = y1+(j/(n+1))*l*sin(theta);
        end
        
    end
    
    % "fuses" arrays (places interpolated points at correct indices)
    x_new = zeros(N+length(x_interp),1);
    y_new = zeros(size(x_new));
    for i = 1:(N-1)     
        k = 2+(i-1)*(n+1);
        x_new(k-1) = x(i);
        y_new(k-1) = y(i);
        for j = 1:n
            x_new(k+j-1) = x_interp(k+j-i-1);
            y_new(k+j-1) = y_interp(k+j-i-1);
        end
    end
    x_new(end) = x(end);
    y_new(end) = y(end);

end