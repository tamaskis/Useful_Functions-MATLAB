%==========================================================================
%
% order_of_magnitude  Determines the order(s) of magnitude of a (set of) 
% number(s) for a specific base.
%
%   N = order_of_magnitude(num,base)
%
% Copyright © 2021 Tamas Kis
% Last Update: 2022-04-16
% Website: https://tamaskis.github.io
% Contact: tamas.a.kis@outlook.com
%
% REFERENCES:
%   [1] https://www.mathworks.com/matlabcentral/fileexchange/28559-order-of-magnitude-of-number
%
%--------------------------------------------------------------------------
%
% ------
% INPUT:
% ------
%   num     - (double array of any size) number(s)
%   base    - (1×1 double) specified base
%
% -------
% OUTPUT:
% -------
%   N       - (double array of same size as num) order of magnitude of 
%             "num"
%
% -----
% NOTE:
% -----
%   --> If "num" is an array, "N" is an array of the same size that stores 
%       the order of magnitude of each element of "num" in its 
%       corresponding location in "N".
%
%==========================================================================
function N = order_of_magnitude(num,base)

    % defaults to base 10 if "base" not specified
    if nargin < 2 || isempty(base)
        base = 10;
    end
    
    % calculates order(s) of magnitude
    N = floor(log(abs(num))./log(base));
    
end