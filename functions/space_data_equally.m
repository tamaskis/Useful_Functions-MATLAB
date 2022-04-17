%==========================================================================
%
% space_data_equally  Interpolates unequally spaced data to make it equally
% spaced in the independent variable.
%
%   [x_new,y_new] = space_data_equally(x,y,dx,method)
%
% See also interp1, interparc, interpshape.
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
%   x       - (1×m0 or m0×1 double) independent variable data
%   y       - (1×m0 or m0×1 double) dependent variable data
%   dx      - (1×1 double) desired uniform spacing
%   method  - (char) (OPTIONAL) interpolation method ('linear', 'nearest', 
%             'next', 'previous', 'pchip','cubic','v5cubic','makima',
%             or 'spline'; see interp1 documentation for explanation),
%             defaults to linear interpolation if not specified
%
% -------
% OUTPUT:
% -------
%   x_new   - (1×m or m×1 double) equally spaced independent variable data
%   y_new   - (1×m or m×1 double) equally spaced dependent variable data
%
% -----
% NOTE:
% -----
%   --> m0 = original number of data points
%   --> m = new number of data points
%   --> "Equally spaced" indicates equally spaced in the independent 
%       variable.
%   --> If "x" and "y" are input as row vectors, then "x_new" and "y_new"
%       are returned as column vectors, and vice-versa.
%   --> If the length of "x" is not an integer multiple of "dx", then the 
%       spacing between the last two points in "x_new" will NOT be equal to
%       "dx", as the function manually fixes the last element of "x" to be
%       equal to the last element of "x_new". The rest of the points will
%       still be equally spaced.
%
%==========================================================================
function [x_new,y_new] = space_data_equally(x,y,dx,method)

    % defaults "method" to 'linear' if not specified
    if (nargin < 4) || isempty(method)
        method = 'linear';
    end
    
    % booleans to store whether x and y are input as row or column vectors
    x_row = false;
    y_row = false;
    
    % transposes vectors to be column vectors if not already, and updates
    % boolean accordingly
    if size(x,2) > size(x,1)
        x = x';
        x_row = true;
    end
    if size(y,2) > size(y,1)
        y = y';
        y_row = true;
    end
    
    % equally spaced version of x
    x_new = (x(1):dx:x(end))';
    
    % forces new interval to have same last element as old interval (even
    % if not evenly spaced) if they are not already equal
    if x_new(end) ~= x(end)
        x_new = [x_new;x(end)];
    end
    
    % interpolates y at the new (equally spaced) x values
    y_new = interp1(x,y,x_new,method);
    
    % tranposes x_new and y_new to row vectors if needed
    if x_row, x_new = x_new'; end
    if y_row, y_new = y_new'; end
    
end