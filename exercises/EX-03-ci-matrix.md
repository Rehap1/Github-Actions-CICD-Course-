# EX-03: CI Matrix

## Use This After

- [LAB-02: Real CI Workflow](../labs/LAB-02-real-ci-workflow.md)
- preferably [EX-02: CI Visibility and Schedule](EX-02-ci-visibility-and-schedule.md)

## Workflow To Modify

- `.github/workflows/02-ci.yml`

## Goal

Run the same CI job on Python `3.11` and `3.12` without copying the whole job twice.

This exercise keeps the same CI story from `LAB-02` and changes only how many versions the job runs against.

## Challenge

Continue modifying `.github/workflows/02-ci.yml`.

If you already completed `EX-02`, keep those extra visibility steps and build on them.

## Requirements

- Keep the same CI story from Lab 02.
- Use a matrix so the job runs for Python `3.11` and `3.12`.
- Do not copy the whole job twice.

## Acceptance Criteria

- The Actions view shows one CI run for Python `3.11`.
- The Actions view shows one CI run for Python `3.12`.
- The workflow keeps the same job shape instead of duplicating the whole job.
- The matrix change still lives inside `.github/workflows/02-ci.yml`.
- You can explain what repeated and what stayed the same.
