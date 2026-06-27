# EX-10: PR-Based CI/CD with Branch Protection

## Use This After

- [LAB-02: Real CI Workflow](../labs/LAB-02-real-ci-workflow.md)
- [LAB-05: Full CI/CD Flow](../labs/LAB-05-full-cicd-flow.md)
- preferably [EX-09: Full Flow Failure and Recovery](EX-09-full-flow-failure-and-recovery.md)

## Workflows To Modify

- `.github/workflows/02-ci.yml`
- `.github/workflows/03-build-artifact.yml`
- keep `.github/workflows/04-deploy.yml` as the delivery step that still reacts to the build workflow

## Goal

Finish the course with a real team workflow:

- CI runs on pull requests to `main`
- branch protection requires CI to pass
- the build-and-deploy story continues only after the pull request is merged

This exercise keeps the full flow idea from `LAB-05` and changes the trigger model to a team-style PR path.

Use the existing lab workflows as your starting point.

## Challenge

Do not start a separate PR exercise track.

Keep extending the same integrated flow from `LAB-05`.

## Requirements

### Part A: Evolve `02-ci.yml` for PR CI

- Start from the same verification shape you already used in `.github/workflows/02-ci.yml`.
- Add pull request triggers for `main`.
- The workflow should run when the pull request is opened, updated, or reopened.
- Keep the same core verification steps from `LAB-02`: check out the repository, set up Python, and run the project tests.
- Use one stable job name such as `verify` so branch protection can require it.

### Part B: Evolve `03-build-artifact.yml` for after-merge packaging

- Keep the same build workflow from `LAB-03`.
- Keep `workflow_dispatch` so the workflow is still safe to run on purpose.
- Add a trigger so the build workflow also starts on pushes to `main`.
- The push to `main` should happen after a pull request is merged.
- Keep the same packaging story: verify first, then build the exact package.

### Part C: Keep the existing delivery step

- Keep `.github/workflows/04-deploy.yml` as the delivery step.
- Let it continue reacting to the build workflow after the merged code reaches `main`.
- The important idea is that the existing delivery story continues after the trusted merge path.

### Branch Protection

- Configure `main` so changes come through pull requests.
- Configure `main` so the CI check must pass before merge.
- If your GitHub plan allows it, also block direct pushes to `main`.

## Suggested Flow

1. create a feature branch
2. make one safe change
3. open a pull request to `main`
4. watch PR CI run
5. confirm merge is blocked until CI passes
6. merge the pull request
7. watch the build workflow run on `main`
8. watch the deploy workflow follow that build

## Acceptance Criteria

- Opening a pull request to `main` starts the PR CI workflow.
- The PR CI workflow clearly reuses the same verification idea from `.github/workflows/02-ci.yml`.
- The PR shows the CI result clearly before merge.
- Merge stays blocked until the required CI check passes.
- Merging the pull request leads to the same `package -> deliver` story through the existing build and deploy workflows.
- Closing a pull request without merging does not continue the later build-and-deploy story.
- You can explain why branch protection turns CI into a real team rule.
