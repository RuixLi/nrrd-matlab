---
kind: plan
name: functionality-tests
status: done
description: "Tests-first plan for public NRRD read/write functionality."
created: "2026-07-07T12:33"
updated: "2026-07-07T12:36"
effort: "../efforts/20260707-functionality-tests.md"
---
# Functionality Tests Plan

## Steps

1. Inspect the public reader/writer code and the deleted writer helper from `HEAD`.
2. Add `tests/test_read_write_roundtrip.m` for a temporary raw `.nrrd` write/read/header round-trip through public functions.
3. Run the new test and confirm it fails for the expected missing writer helper.
4. Restore `nhdr_nrrd_write.m` into `src/+nrrd/private/` from the trusted `HEAD` version.
5. Re-run the new round-trip test and the API-surface smoke test.
6. Update the log, report, job board, and generated indexes.
