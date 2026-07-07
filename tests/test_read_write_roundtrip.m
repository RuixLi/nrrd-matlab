projectRoot = fileparts(fileparts(mfilename('fullpath')));
srcDir = fullfile(projectRoot, 'src');
addpath(srcDir);

workDir = tempname;
mkdir(workDir);
cleanup = onCleanup(@() cleanup_temp_dir(workDir));

data = uint16(reshape(1:24, [3, 4, 2]));
info = nrrd.gen_info();
info.path = workDir;
info.name = 'roundtrip';
info.type = 'uint16';
info.dimension = ndims(data);
info.sizes = size(data);

nrrd.write_data(info, data);

outputPath = fullfile(workDir, 'roundtrip.nrrd');
assert(isfile(outputPath), 'Expected roundtrip.nrrd to be written');

[readData, readInfo] = nrrd.read(outputPath);
assert(isequal(readData, data), 'Round-tripped data differs from input');
assert(isequal(readInfo.sizes, size(data)), 'Read sizes differ from input data size');
assert(strcmp(readInfo.type, 'uint16'), 'Read type differs from written type');

headerOnlyInfo = nrrd.info(outputPath);
assert(~isfield(headerOnlyInfo, 'data') || isempty(headerOnlyInfo.data), ...
    'nrrd.info should not read data payload');
assert(isequal(headerOnlyInfo.sizes, size(data)), ...
    'Header-only sizes differ from input data size');

function cleanup_temp_dir(pathToRemove)
if isfolder(pathToRemove)
    rmdir(pathToRemove, 's');
end
end
