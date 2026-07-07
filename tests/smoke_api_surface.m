projectRoot = fileparts(fileparts(mfilename('fullpath')));
srcDir = fullfile(projectRoot, 'src');
addpath(srcDir);

contentsPath = fullfile(srcDir, '+nrrd', 'Contents.m');
assert(isfile(contentsPath), 'Missing package Contents.m');
contentsText = fileread(contentsPath);

publicFunctions = {'gen_info', 'info', 'read', 'write_data'};
for idx = 1:numel(publicFunctions)
    functionName = publicFunctions{idx};
    qualifiedName = ['nrrd.' functionName];

    functionPath = which(qualifiedName);
    assert(~isempty(functionPath), 'Missing public function on path: %s', qualifiedName);

    helpText = help(qualifiedName);
    assert(~isempty(strtrim(helpText)), 'Missing help text: %s', qualifiedName);
    assert(contains(contentsText, functionName), ...
        'Contents.m does not mention public function: %s', functionName);
end
