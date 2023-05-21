%==========================================================================
%
% create_folders  Creates a set of folders.
%
%   create_folders(paths)
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
%   paths   - (1✕n or n✕1 string) paths of folders to create
%
%==========================================================================
function create_folders(paths)
    
    % loops over all paths
    for path = paths
        
        % creates folder if it does not exist
        if ~isfolder(path)
            mkdir(path);
        end
        
    end
    
end