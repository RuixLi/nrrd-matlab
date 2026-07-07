---
kind: report
name: functionality-tests
status: passed
description: "Outcome of the tests-first MATLAB read/write functionality recovery."
created: "2026-07-07T12:36"
updated: "2026-07-07T12:36"
effort: "../efforts/20260707-functionality-tests.md"
plan: "../plans/20260707-functionality-tests.md"
log: "../logs/20260707-functionality-tests.md"
---
# Functionality Tests Report

## Verdict

Passed. The missing private writer helper was the blocking cause for public `nrrd.write_data` round-trip behavior.

## Oracle Results

- RED: `matlab -batch "addpath('src'); run('tests/test_read_write_roundtrip.m')"` failed before production recovery with `Unrecognized function or variable 'nhdr_nrrd_write'`.
- GREEN: the same round-trip test passed after restoring `nhdr_nrrd_write.m` to `src/+nrrd/private/`.
- Regression surface: `matlab -batch "addpath('src'); run('tests/smoke_api_surface.m')"` passed.

## Related Files

- [tests/test_read_write_roundtrip.m](../../tests/test_read_write_roundtrip.m)
- [src/+nrrd/private/nhdr_nrrd_write.m](../../src/+nrrd/private/nhdr_nrrd_write.m)
- [CHANGELOG.md](../../CHANGELOG.md)

## Residual Risk

- The new test covers a small raw standalone `.nrrd` round-trip with `uint16` data. It does not cover detached `.nhdr`, gzip/text encodings, diffusion metadata, or unsupported-format error paths.

## Next Actions

- Add broader fixtures for detached headers and alternate encodings when those behaviors become release blockers.
