function info = gen_info(info)
% generate a default struct of nrrd headerInfo
% headerInfo (struct): structure containing all the required and optional
% NRRD fields, such as produced by nhdr_nrrd_read.m, as well as the data. 
% List of accepted structure field names with corresponding NRRD fields in
% parentheses:
%   - byteskip (byte skip: <desc>): scalar integer. For now, can only
%       accept -1 with raw encoding and 0 with all other encodings;
%	- content (content: <desc>): string;
%	- data (~): numerical array containing the raw data;
%	- datafiles (data file: <desc>): cell array of strings containing the
%       paths to detached data files relative to the header file. This can 
%       be a simple string if there is only one detached data file;
% 	- detached_header (~): Matlab structure containing all the fields 
%       required to write valid detached NRRD files containing the data. 
%       All detached NRRD data files are assumed to have the same header;
% 	- dimension (dimension: <desc>): scalar integer;
%   - encoding (encoding: <desc>): string;
%   - kinds (kinds: <desc>): cell array of strings;
%   - lineskip (line skip: <desc>): scalar integer. For now, can only be 
%       set to zero unless raw encoding is used and byte skip is set to -1
%       (which cancels the effect of line skip altogether);
%   - measurementframe (measurement frame: <desc>): matrix of size 
%       [Ns, Ns], where Ns in the number of space dimensions;
%   - sizes (sizes: <desc>): matrix of size [1, d] or [d, 1] where d is the
%       dimension;
%   - space (space: <desc>): string;
%   - spacedimension (space dimension: <desc>): scalar integer;
%   - spacedirections (space directions: <desc>): cell array of strings 
%       for code compatibility, e.g. 
%       {'(1,0,0)' '(0,2,0.1)' 'none'  '(0.1,0.1,1.1)'} for 3 
%       world space dimensions;
%   - spacedirections_matrix (~): matrix of size [Ns, Ns] where Ns is the 
%       number of space dimensions. Should match the string description 
%       contained in spacedirections, if specified;
%   - spaceorigin (space origin: <desc>): matrix of size [1, Ns] or [Ns, 1]
%       where Ns is the number os space dimensions;
%   - spaceunits (space units: <desc>): cell array of strings;
%   - type (type: <desc>): string.
%  
%   - bvalue (bvalue:=<value>): floating-point scalar (nominal b-value);
%   - modality (modality:=<value>): string
%   - gradients (DWMRI_gradient_%04d:=<value>): matrix of size [Ng, 3] 
%       where Ng is the number of gradients in a PGSE-type 
%       diffusion-weighted MRI protocol. Note that the b-value associated 
%       with each gradient [g_x, g_y, g_z] is computed as 
%       b = b_nom*(g_x^2 + g_y^2 + g_z^2), where b_nom is the
%       nominal b-value, so the gradients must be scaled accordingly;

if nargin < 1
    info = struct();
end

% create a struct of nrrd header info
info = set_field(info, 'content', 'matlab generated nrrd');
info = set_field(info, 'type', 'unsigned int');
info = set_field(info, 'dimension', 3);
info = set_field(info, 'sizes', [0 0 0]);
info = set_field(info, 'encoding', 'raw');
info = set_field(info, 'kinds', {'domain' 'domain' 'domain'});
info = set_field(info, 'spacedimension', 3);
info = set_field(info, 'spacedirections', {'(1,0,0)' '(0,1,0)' '(0,0,1)'});
info = set_field(info, 'spacedirections_matrix', eye(3));
info = set_field(info, 'spaceorigin', [0 0 0]);
info = set_field(info, 'spaceunits', {'mm' 'mm' 'mm'});
info = set_field(info, 'data', []);
%info = set_field(info, 'datafiles', '');
%info = set_field(info, 'detached_header', '');
%info = set_field(info, 'bvalue', 0);
%info = set_field(info, 'modality', 'N/A');
%info = set_field(info, 'gradients', [0 0 0]);

end

function s = set_field(s, field, value)
% set default value for a field if it does not exist
if ~isfield(s, field)
    s.(field) = value;
end
end
