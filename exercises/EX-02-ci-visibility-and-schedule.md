# EX-02: CI Visibility and Schedule

## Use This After

- [LAB-02: Real CI Workflow](../labs/LAB-02-real-ci-workflow.md)

## Workflow To Modify

- `.github/workflows/02-ci.yml`

## Goal

Keep the same CI check, but make the workflow more visible.

The goal is to prove three things clearly:

- the repository files were pulled onto the runner after checkout
- the Python version came from `actions/setup-python`
- the runner calculates time in a way that matters later for `schedule`

This exercise keeps the same CI test step from `LAB-02` and adds visibility around it.

## Challenge

Modify `.github/workflows/02-ci.yml`.

## Requirements

- Keep the project test step from Lab 02.
- Keep the same push and manual trigger story from `LAB-02`.
- Add visibility steps that show the checked-out repository files on the runner after `actions/checkout`.
- Add a step that prints the Python version prepared by `actions/setup-python`.
- Add a step that prints the runner's current time.
- Keep `workflow_dispatch` so the workflow can be started on purpose.
- Add `schedule` as a second trigger so the workflow also demonstrates a time-based start.

## Important Note

For `schedule`, remember:

- GitHub uses UTC
- the workflow file must be on the default branch
- the run may start later than the exact minute

For this exercise, a manual run is enough.

You do not need to wait for the scheduled run to happen during class.

## Acceptance Criteria

- The logs show that the repository files were pulled onto the runner, not just that the job ran.
- The logs show which Python version `actions/setup-python` prepared for this workflow run.
- The logs show the runner's current time.
- The workflow is still recognizably the same `02-ci.yml` file from the lab.
- You can explain why runner time matters when learning `schedule`.
- You can explain why `workflow_dispatch` is still useful even when `schedule` exists.
