# AGENTS.md

You are reading `AGENTS.md`, the entry point for agents working on this project. Read it fully at the start of each session. It provides the project overview, essential project-level instructions, and pointers to deeper context to load when relevant.

## Project

- **What:** MATLAB package for reading and writing NRRD/NHDR files.
- **Purpose:** Keep a small, reusable `nrrd.*` package that can be added to the MATLAB path and called from other projects.
- **Outputs:** MATLAB package source in [`src/+nrrd`](src/+nrrd/) and package-level documentation.
- **Primary language:** MATLAB.
- **Archetype:** Package. Status: released.

## How to work here

- **Conventions:** Follow the vendored [all-you-need-is-trust conventions](context/conventions.md), sealed by [context/conventions-bundle.json](context/conventions-bundle.json).
- **Setup:** Add [`src`](src/) to the MATLAB path before calling package functions.
- **Verification:** After package layout or API-surface changes, run `matlab -batch "addpath('src'); run('tests/smoke_api_surface.m')"`. For framework alignment, also run the `aynit` project and convention checks noted in [ENVIRONMENT.md](ENVIRONMENT.md).
- **Source safety:** Preserve pre-existing dirty MATLAB changes unless the user explicitly asks to change or revert them.

### Deviations from the conventions

- None declared for the current scaffold.

## Current work

- Current work is tracked in [context/jobs.md](context/jobs.md).

## Where to look

| need | file |
| --- | --- |
| conventions | [context/conventions.md](context/conventions.md) |
| convention bundle manifest | [context/conventions-bundle.json](context/conventions-bundle.json) |
| work status | [context/jobs.md](context/jobs.md) |
| active efforts | [context/efforts.md](context/efforts.md) |
| plans | [context/plans.md](context/plans.md) |
| logs | [context/logs.md](context/logs.md) |
| reports | [context/reports.md](context/reports.md) |
| environment | [ENVIRONMENT.md](ENVIRONMENT.md) |
| readme | [README.md](README.md) |
| changelog | [CHANGELOG.md](CHANGELOG.md) |
| source | [src/+nrrd](src/+nrrd/) |
| tests | [tests](tests/) |
