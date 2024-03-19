function [data,info] = read(filename)
% read a nrrd file
info = nhdr_nrrd_read(filename, true);
data = info.data;
info = rmfield(info,'data');
end