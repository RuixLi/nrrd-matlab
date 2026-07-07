function write_data(info,data)
     % if data is included in the info
    if ~exist('data','var') && ~isempty(info.data)
        path = info.path;
        name = info.name;
        name = [name '.nrrd'];
        info = rmfield(info,'path');
        info = rmfield(info,'name');
        nhdr_nrrd_write(fullfile(path,name),info,true);
        return;
    end
    
    % if data is provided
    if exist('data','var') && ~isempty(data)
        info.data = data;
        info.sizes = size(data);
        path = info.path;
        name = info.name;
        name = [name '.nrrd'];
        info = rmfield(info,'path');
        info = rmfield(info,'name');
        nhdr_nrrd_write(fullfile(path,name),info,true);
        return;
    end

    % if data is not provided and not included in the info
    % write header only
    if ~exist('data','var') && isempty(info.data)
        disp('write header only');
        path = info.path;
        name = info.name;
        name = [name '.nhdr'];
        info = rmfield(info,'path');
        info = rmfield(info,'name');
        nhdr_nrrd_write(fullfile(path,name),info,false);
    end
end