# EX-06: CI Then Build Artifact With `needs`

## Use This After

- [LAB-03: Build Artifact Workflow](../labs/LAB-03-build-artifact-workflow.md)
- preferably [EX-05: Build Artifact with Buildx](EX-05-build-artifact-with-buildx.md)

## Workflow To Modify

- `.github/workflows/03-build-artifact.yml`

## Goal

Strengthen the build workflow so it shows two clear phases:

1. verify runs first
2. packaging runs second

The build job must wait for CI by using `needs`.

This exercise keeps the same packaging story from `LAB-03`, but makes the workflow structure more explicit.

## Guided Note

This is the stronger build-workflow exercise for Day 2.

## Challenge

Continue modifying `.github/workflows/03-build-artifact.yml`.

If you already completed `EX-05`, keep the Buildx version and extend that same file.

## Requirements

- The workflow should have one verification job and one packaging job.
- The verification job should reuse the same test idea from Lab 03.
- The packaging job should wait for CI by using `needs`.
- The packaging job should use a fixed matrix for Python `3.11` and `3.12`.
- Each package should use the matching Python base image.
- Each artifact name should stay unique.

## Acceptance Criteria

- The Actions view shows verification first and packaging second.
- Packaging does not start before CI succeeds.
- After CI passes, packaging fans out into one run per Python version.
- The artifact names are unique.
- The changes still live inside `.github/workflows/03-build-artifact.yml`.
- You can explain what `needs` changed in the workflow behavior.
