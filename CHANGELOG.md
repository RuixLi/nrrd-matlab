# Changelog

## [Unreleased]

## [0.1.0] - 2026-07-07

### Changed

- Adopted the all-you-need-is-trust project scaffold: vendored conventions, agent entry point, context board, environment manifest, and MATLAB source under `src/+nrrd`.

### Fixed

- Restored the private NRRD writer helper in the new `src/+nrrd/private` layout and added a MATLAB round-trip test for public read/write behavior.
