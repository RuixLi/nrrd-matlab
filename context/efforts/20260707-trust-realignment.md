---
kind: effort
name: trust-realignment
status: done
description: "Realign the repository to the all-you-need-is-trust project scaffold without changing MATLAB behavior."
created: "2026-07-07T12:05"
updated: "2026-07-07T12:11"
---
# Trust Realignment

## Goal

Realign this MATLAB package repository with the vendored all-you-need-is-trust conventions while preserving the existing MATLAB implementation state.

## Assumptions

- The repo is a package archetype, not a study.
- The importable MATLAB namespace is `nrrd`.
- Existing dirty changes in the MATLAB implementation are user work and must be preserved.
- The all-you-need-is-trust source is available locally at `D:\code\all-you-need-is-trust`.

## Decisions

- Vendor the conventions into `context/` with the framework tool.
- Move the MATLAB package to `src/+nrrd`, the expected package layout.
- Use a language-agnostic `ENVIRONMENT.md` instead of a Python or conda manifest.

## Oracle

The effort passes when:

- `check-project` reports no failures for the repo.
- `check-conventions` reports no failures for the vendored bundle and manifest.
- The MATLAB smoke test in `tests/smoke_api_surface.m` passes.
- Git status shows the MATLAB package moved into `src/+nrrd` without semantic edits to the existing implementation files.
