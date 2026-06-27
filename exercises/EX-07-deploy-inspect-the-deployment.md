# EX-07: Deploy and Inspect the Deployment

## Use This After

- [LAB-04: Deploy Workflow](../labs/LAB-04-deploy-workflow.md)

## Workflow To Modify

- `.github/workflows/04-deploy.yml`

## Goal

Keep the same deployment flow from Lab 04, but inspect it more deeply after startup.

This exercise keeps the same deploy path from `LAB-04` and adds inspection after the container starts.

## Challenge

Modify `.github/workflows/04-deploy.yml`.

## Requirements

- Keep the same build-triggered deploy flow from Lab 04.
- Keep using the saved artifact from the build run.
- Show the exact date-plus-run-id image tag the deploy workflow recreates from the build run.
- After startup, show the running containers with `docker ps`.
- After startup, print the `/health` response body.

## Acceptance Criteria

- The workflow still uses the same saved package from the build run.
- The logs show the exact recreated image tag used for this deploy run.
- The logs show the running container list after startup.
- The logs show the `/health` response body.
- The changes still live inside `.github/workflows/04-deploy.yml`.
- You can explain why this is still the same deploy story, not a new deployment system.
