# Trigger Reference

## Purpose

This page gives a simple reference for common GitHub Actions triggers.

It is not a new lab.

Use it after the core course if you want a wider view.

## Trigger Used Most in This Course: `push`

`push` starts a workflow after a commit reaches GitHub.

In this course, that is how students first see CI respond to a change.

## Manual Trigger: `workflow_dispatch`

`workflow_dispatch` lets you start a workflow from the `Actions` tab.

That is why it is a good beginner tool:

- it lowers risk
- it helps you start a run on purpose
- it is useful for learning

Workflows can also use inputs with `workflow_dispatch`, but we do not need that in the core labs.

## Workflow-to-Workflow Trigger: `workflow_run`

`workflow_run` starts one workflow after another workflow finishes.

In this course, deploy uses that pattern after the build workflow.

## Why This Course Uses Different Trigger Types

The trigger choices in this course are intentional:

- `01 Hello Workflow` can be run manually so the first experience feels safe
- `02 CI Workflow` uses `push` because code changes should trigger verification
- `03 Build Artifact Workflow` is manual so Day 2 packaging stays controlled and easy to follow
- `04 Deploy Workflow` uses `workflow_run` because delivery should start only after build succeeds

The goal is not to show every trigger.

The goal is to match the trigger to the problem we are solving.

## Pull Request Trigger: `pull_request`

`pull_request` starts a workflow when code is proposed for review.

Teams often use it for:

- testing before merge
- review checks
- policy checks

We do not need it in the core beginner labs because the browser-first course flow uses direct commits for simplicity.

## Scheduled Trigger: `schedule`

`schedule` runs a workflow automatically on a time pattern.

Teams often use it for:

- nightly checks
- cleanup jobs
- regular reports

Important note:

Schedules use UTC time.

## API Trigger: `repository_dispatch`

`repository_dispatch` lets an external system start a workflow through the GitHub API.

This is useful in bigger automation setups, but it is beyond the beginner core of this course.

## Branch Filtering

Branch filtering lets a workflow run only for specific branches.

Example idea:

- run only on `main`
- run only on `feature/*`

## Path Filtering

Path filtering lets a workflow run only when specific files change.

In this course, we use path filtering to keep runs focused on the relevant files.

## Simple Memory Rule

Use this short rule:

- `push` = code reached GitHub
- `workflow_dispatch` = person started the run manually
- `workflow_run` = another workflow finished first
- `pull_request` = proposed change for review
- `schedule` = time-based run
- `repository_dispatch` = external system asked GitHub to run it

## Related Help

- [YAML Cheatsheet for GitHub Actions](04-yaml-cheatsheet.md)
- [Runner Types](05-runner-types.md)
- [Next Steps: Matrix and Secrets](../06-next-steps-matrix-and-secrets.md)
