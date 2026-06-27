# EX-01: Hello Trigger and PR Merge

## Use This After

- [LAB-01: First Workflow](../labs/LAB-01-first-workflow.md)

## Workflow To Modify

- `.github/workflows/01-hello.yml`

## Goal

Take the tiny hello workflow and change the trigger story.

Instead of reacting to a simple direct change, make it react to a pull request being merged into `main`.

This exercise keeps the tiny workflow from `LAB-01` and changes only when it should run.

## Challenge

Modify `.github/workflows/01-hello.yml`.

Do not create a second hello workflow file.

## Requirements

- Keep the same tiny hello workflow shape from `LAB-01`.
- The workflow should react to pull requests that target `main`.
- The workflow should clearly distinguish between a pull request that was only closed and a pull request that was really merged.
- The workflow should still include `workflow_dispatch` so it can be started safely during class.

## Acceptance Criteria

- The workflow starts for the correct pull request event against `main`.
- The workflow does not treat every closed pull request as a merged pull request.
- You can explain why this trigger is different from `LAB-01`.
- You can explain why `workflow_dispatch` is still useful here.
