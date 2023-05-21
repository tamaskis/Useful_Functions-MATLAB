%==========================================================================
%
% empty_folders  Deletes all contents from a set of folders.
%
%   empty_folders(paths)
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
%   paths   - (1✕n or n✕1 string) paths to folders to empty
%
%==========================================================================
function empty_folders(paths)
    
    % loops over all paths
    for path = paths
        
        % only attempts to empty a folder if it exists
        if isfolder(path)
            
            % determines contents of folder on current path
            files = list_folder_contents(path);
            
            % deletes all files in folder
            for file = files
                delete(fullfile(path,file));
            end
            
        end
        
    end
    
end