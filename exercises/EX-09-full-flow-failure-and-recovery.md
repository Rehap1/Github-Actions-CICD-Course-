# EX-09: Full Flow Failure and Recovery

## Use This After

- [LAB-05: Full CI/CD Flow](../labs/LAB-05-full-cicd-flow.md)

## Goal

Break the full story on purpose, then recover it.

This exercise proves that the pipeline should stop at `verify` when the change is not safe.

This exercise reuses the same core workflows from `LAB-05` instead of creating a new workflow file.

## Files to Reuse

This exercise uses the core course files:

- `app/app.py`
- `.github/workflows/02-ci.yml`
- `.github/workflows/03-build-artifact.yml`
- `.github/workflows/04-deploy.yml`

## Requirements

- Make one very small change in `app/app.py` that breaks the tests.
- Commit the change and watch `02 CI Workflow` fail.
- Confirm that the later story does not continue.
- Fix the change.
- Commit again and repeat the same flow from `LAB-05`:
  run CI, start the build workflow manually, then watch deploy run automatically.

Safe example:

change the health payload from `ok` to another word, then change it back.

Optional safer alternative:

temporarily set `FORCE_UNHEALTHY=true` in the deploy container run path if your instructor wants a controlled deployment-side failure instead of a code-level failure.

For the main version of this exercise, keep the simpler code-level CI failure example first.

## Acceptance Criteria

- `02 CI Workflow` fails after the breaking change.
- The later story does not continue from a failed verification path.
- After the fix, the same `CI -> manual build -> automatic deploy` path becomes healthy again.
- You can explain why the story stops at `verify`.
- You can explain what changed after the fix.
