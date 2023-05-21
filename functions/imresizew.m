%==========================================================================
%
% imresizew  Resizes an image to a specified width (in pixels).
%
%   B = imresizew(A,w)
%
% Copyright © 2023 Tamas Kis
% Last Update: 2023-05-21
% Website: https://tamaskis.github.io
% Contact: tamas.a.kis@outlook.com
%
%--------------------------------------------------------------------------
%
% ------
% INPUT:
% ------
%   A       - (numeric array) original image
%   w       - (1×1 double) desired image width (in pixels)
%
% -------
% OUTPUT:
% -------
%   B       - (numeric array) resized image
%
%==========================================================================
function B = imresizew(A,w)
    
    % determines number of rows and columns of pixels
    num_rows = size(A,1);
    num_cols = size(A,2);
    
    % desired number of columns
    num_cols_new = w;
    
    % desired number of rows
    num_rows_new = round((num_cols_new/num_cols)*num_rows);
    
    % resized thumbnail image
    B = imresize(A,[num_rows_new,num_cols_new]);
    
end