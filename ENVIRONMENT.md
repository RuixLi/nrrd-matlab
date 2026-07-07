# Environment

## Toolchain

- MATLAB R2019b or newer - run the package and support future `arguments`-block API work.
- Git - version control and change review.
- Python 3.11 or newer, optional - run the `aynit` framework tools from an all-you-need-is-trust checkout.

## Dependencies

- MATLAB: no toolbox dependencies are known from the current source.
- Python: no package runtime dependency for this repo; `aynit` is used only for framework checks when available.

## Setup

1. Clone the repo.
2. In MATLAB, run `addpath(fullfile(pwd, 'src'))` from the repo root.
3. Call package functions as `nrrd.read(...)`, `nrrd.info(...)`, `nrrd.gen_info(...)`, and `nrrd.write_data(...)`.

## Verification

Run the MATLAB API-surface smoke test:

```powershell
matlab -batch "addpath('src'); run('tests/smoke_api_surface.m')"
```

When the all-you-need-is-trust tools are available from a sibling checkout, run:

```powershell
python -c "import sys; sys.path.insert(0, r'D:\code\all-you-need-is-trust\tools\src'); from aynit.cli import main; raise SystemExit(main(['check-project', r'D:\code\nrrd-matlab', '--format', 'text']))"
python -c "import sys; sys.path.insert(0, r'D:\code\all-you-need-is-trust\tools\src'); from aynit.cli import main; raise SystemExit(main(['check-conventions', r'D:\code\nrrd-matlab\context', '--manifest', r'D:\code\nrrd-matlab\context\conventions-bundle.json', '--format', 'text']))"
```

## Notes

- The repo keeps source under `src/`; add that folder to the MATLAB path rather than adding the repo root.
- Large generated outputs should stay out of git and be linked or manifested according to the vendored conventions.
