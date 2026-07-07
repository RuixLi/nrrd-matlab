---
kind: plan
name: trust-realignment
status: done
description: "Execution plan for the initial all-you-need-is-trust realignment."
created: "2026-07-07T12:05"
updated: "2026-07-07T12:11"
effort: "../efforts/20260707-trust-realignment.md"
---
# Trust Realignment Plan

## Steps

1. Read the framework entry skill, relevant conventions, project templates, and repo state.
2. Run `check-project` for a baseline.
3. Vendor the conventions bundle into `context/`.
4. Move the MATLAB package from `+nrrd` to `src/+nrrd`.
5. Add root orientation files: `AGENTS.md`, `ENVIRONMENT.md`, `CHANGELOG.md`, updated `README.md`, and updated `.gitignore`.
6. Add package API-surface support with `src/+nrrd/Contents.m` and `tests/smoke_api_surface.m`.
7. Generate work-document gate indexes.
8. Run the project, convention, and MATLAB smoke checks.
9. Write the report and update `context/jobs.md`.
