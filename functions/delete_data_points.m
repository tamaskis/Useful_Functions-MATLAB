%==========================================================================
%
% delete_data_points  Deletes data points based on a specified condition.
%
%   [x_new,y_new] = delete_data_points(x,y,condition)
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
%   x           - (1×m0 or m0×1 double) independent variable data
%   y           - (1×m0 or m0×1 double) dependent variable data
%   condition   - (1×m0 logical) logical array that defines which data
%                 points should be deleted
%                   --> Should be input as a logical expression that
%                       describes what you want to delete.
%                   --> For example, inputting "x > y" would create a 
%                       logical array with "true" at all the elements where
%                       x(i) > y(i).
%
% -------
% OUTPUT:
% -------
%   x_new       - (1×m or m×1 double) modified independent variable data
%   y_new       - (1×m or m×1 double) modified dependent variable data
%
% -----
% NOTE:
% -----
%   --> m0 = original number of data points
%   --> m = new number of data points
%   --> Element-wise multiplication, division, and power should be used
%       when defining "condition" (i.e. use "x.*y" instead of "x*y", "x./y"
%       instead of "x/y", and "x.^y" instead of "x^y").
%
%==========================================================================
function [x_new,y_new] = delete_data_points(x,y,condition)

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
    
    % combines x and y into a single array
    xy = [x,y];
    
    % deletes data
    xy = xy(~condition,:);
    
    % separates xy back into x and y
    x_new = xy(:,1);
    y_new = xy(:,2);
    
    % tranposes x_new and y_new back to row vectors if needed
    if x_row, x_new = x_new'; end
    if y_row, y_new = y_new'; end
    
end