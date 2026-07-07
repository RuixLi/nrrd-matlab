---
kind: effort
name: functionality-tests
status: done
description: "Add executable MATLAB functionality coverage for NRRD read/write behavior."
created: "2026-07-07T12:33"
updated: "2026-07-07T12:36"
---
# Functionality Tests

## Goal

Add a real MATLAB functionality test for the public `nrrd.*` API and restore the missing writer helper only if the test proves that is the blocking cause.

## Assumptions

- The staged trust realignment is the boundary for the previous work.
- Functional verification should use the public namespace from `src/+nrrd`, not call private helpers directly.
- A small temporary raw `.nrrd` round-trip is enough to prove that `write_data`, `read`, and `info` are wired together.

## Decisions

- Keep this work unstaged until the test/recovery slice is complete, so it stays separate from the staged realignment.
- Use a script-style MATLAB test under `tests/`, matching the existing smoke test style.

## Oracle

The effort passes when:

- `tests/test_read_write_roundtrip.m` fails before any production recovery because the writer helper is missing.
- After the minimal recovery, `matlab -batch "addpath('src'); run('tests/test_read_write_roundtrip.m')"` passes.
- `matlab -batch "addpath('src'); run('tests/smoke_api_surface.m')"` still passes.
- The report records any residual functionality gaps beyond this raw NRRD round-trip.
