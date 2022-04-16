%==========================================================================
%
% interprgb  Interpolate a new color between two colors (in RGB color
% space).
%
%   c = interprgb(c1,c2,p)
%
% See also shade_tint_rgb.
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
%   c1      - (1×3 double) lower bound color [RGB]
%   c2      - (1×3 double) upper bound color [RGB]
%   p       - (1×1 double) proportion (between 0 and 1) [-]
%
% -------
% OUTPUT:
% -------
%   c       - (1×3 double) interpolated color [RGB]
%
% -----
% NOTE:
% -----
%   --> c is (p)x(100%) from c1 and (1-p)x(100%) from c2
%
%==========================================================================
function c = interprgb(c1,c2,p)
    c = (c2-c1)*p+c1;
end