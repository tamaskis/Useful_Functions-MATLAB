%==========================================================================
%
% shade_tint_rgb  Shade and tint RGB colors.
%
%   c_shade = shade_tint_rgb(c,p,'shade')
%   c_tint = shade_tint_rgb(c,p,'tint')
%
% See also interprgb.
%
% Copyright © 2022 Tamas Kis
% Last Update: 2022-04-16
% Website: https://tamaskis.github.io
% Contact: tamas.a.kis@outlook.com
%
% REFERENCES:
%   [1] https://en.wikipedia.org/wiki/Tint,_shade_and_tone
%
%--------------------------------------------------------------------------
%
% ------
% INPUT:
% ------
%   c       - (1×3 double) original color [RGB]
%   p       - (1×1 double) proportion to shade or tint by [-]
%   method  - (char) 'shade' or 'tint' [-]
%
% -------
% OUTPUT:
% -------
%   c_new   - (1×3 double) new (shaded/tinted) color [RGB]
%
%==========================================================================
function c_new = shade_tint_rgb(c,p,method)

    % defines color (white for tint, black for shade) to linearly 
    % interpolate between
    if strcmpi(method,'shade')
        c_interp = [0,0,0];
    elseif strcmpi(method,'tint')
        c_interp = [1,1,1];
    end
    
    % linearly interpolates for c_new between c and c_interp
    c_new = (c_interp-c)*p+c;
    
end