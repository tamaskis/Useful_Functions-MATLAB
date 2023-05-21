%==========================================================================
%
% list_folder_contents  Lists the contents of a folder. A list of file 
% extensions can be specified to only list specific file types.
%
%   files = list_folder_contents
%   files = list_folder_contents(path)
%   files = list_folder_contents(path,extensions)
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
%   path        - (OPTIONAL) (1✕1 string) path of folder to list contents 
%                 of (defaults to current working directory)
%   extensions  - (OPTIONAL) (n✕1 or 1✕n string) file extensions to
%                 consider (NOT including the "." on the extension)
%
% -------
% OUTPUT:
% -------
%   files       - (1✕n string) lists of file contents
%
%==========================================================================
function files = list_folder_contents(path,extensions)
    
    % list of file contents to ignore
    contents_to_ignore = [".","..",".DS_Store","thumbs.db,desktop.ini"];
    
    % defaults path to current working directory
    if (nargin < 1) || isempty(path)
        path = pwd;
    end
    
    % determines if extensions specified
    extensions_specified = (nargin == 2) && ~isempty(extensions);
    
    % returns empty string if folder is empty
    if isempty(path)
        files = "";
        return;
    end
    
    % determines number of files in folder
    num_files = size(dir(path),1);
    
    % initializes string array
    files = strings(1,num_files);
    
    % returns list of all file names matching a certain file type if 
    % extensions are specified
    if extensions_specified
        
        % loops through all extensions
        for extension = extensions
            
            % loads structure of files with specified extension
            files_struct = dir(fullfile(path,"*."+extension));
            
            % adds file name to list of file names if it is not one of the
            % contents to ignore
            for i = 1:length(files_struct)
                if ~ismember(files_struct(i).name,contents_to_ignore)
                    files(i) = files_struct(i).name;
                end
            end
            
        end
        
    % returns list of all file names if extensions are not specified
    else
        files_struct = dir(path);
        for i = 1:length(files_struct)
            if ~ismember(files_struct(i).name,contents_to_ignore)
                files(i) = files_struct(i).name;
            end
        end
    end
    
    % deletes empty strings (from files that were skipped)
    files = files(files ~= "");
    
end