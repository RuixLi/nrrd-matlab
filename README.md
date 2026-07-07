# nrrd-matlab

MATLAB package for reading and writing NRRD/NHDR files.

## Setup

Add the package source folder to the MATLAB path from the repo root:

```matlab
addpath(fullfile(pwd, 'src'))
```

## Usage

```matlab
[data, info] = nrrd.read("volume.nrrd");
header = nrrd.info("volume.nrrd");
```

The package source lives in `src/+nrrd`, so callers use the `nrrd.*` namespace.

## Verification

```powershell
matlab -batch "addpath('src'); run('tests/smoke_api_surface.m')"
```

## Source

Modified from:

https://www.mathworks.com/matlabcentral/fileexchange/66645-nrrd-nhdr-reader-and-writer
