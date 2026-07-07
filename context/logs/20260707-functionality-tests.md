---
kind: log
name: functionality-tests
status: done
description: "Chronological trail for MATLAB NRRD functionality testing."
created: "2026-07-07T12:33"
updated: "2026-07-07T12:36"
effort: "../efforts/20260707-functionality-tests.md"
plan: "../plans/20260707-functionality-tests.md"
---
# Functionality Tests Log

## 2026-07-07T12:33

- Staged the completed trust realignment with `git add -A`; the index now contains the realignment and the pre-existing deletion of `+nrrd/private/nhdr_nrrd_write.m`.
- Opened a separate functionality-testing effort so any helper recovery and behavior tests remain a distinct unstaged slice.
- Inspected `nrrd.write_data`, `nrrd.read`, `nrrd.info`, `nrrd.gen_info`, and the deleted `nhdr_nrrd_write.m` from `HEAD`.
- Added `tests/test_read_write_roundtrip.m` before changing production code.
- Ran `matlab -batch "addpath('src'); run('tests/test_read_write_roundtrip.m')"`; RED result: failed in `nrrd.write_data` with `Unrecognized function or variable 'nhdr_nrrd_write'`.
- Restored `nhdr_nrrd_write.m` mechanically from `HEAD` and moved it into `src/+nrrd/private/nhdr_nrrd_write.m`.
- Re-ran `matlab -batch "addpath('src'); run('tests/test_read_write_roundtrip.m')"`; GREEN result: pass.
- Ran `matlab -batch "addpath('src'); run('tests/smoke_api_surface.m')"`; result: pass.
