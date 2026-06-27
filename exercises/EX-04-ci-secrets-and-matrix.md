# EX-04: CI Secrets and Matrix Patterns

## Use This After

- [LAB-02: Real CI Workflow](../labs/LAB-02-real-ci-workflow.md)
- preferably [EX-03: CI Matrix](EX-03-ci-matrix.md)

## Workflow To Modify

- `.github/workflows/02-ci.yml`

## Goal

Practice two advanced GitHub Actions patterns:

1. build a matrix from one stored secret
2. keep a fixed matrix and look up a different secret in each run

This exercise extends `LAB-02`.

It does not replace the base CI workflow. It compares two more advanced matrix patterns.

## Important Note

This exercise is for learning GitHub Actions behavior.

It is not the normal way to store simple values like Python versions.

## Challenge

Continue modifying `.github/workflows/02-ci.yml`.

Keep this as one same-file exercise:

- Pattern A is the required version
- Pattern B is the optional comparison version on that same file after Pattern A works

## Requirements

### Pattern A: Matrix From One Secret

- Replace the fixed matrix in `.github/workflows/02-ci.yml`.
- Store the whole version list in one secret.
- Use one job to read that secret and publish a normal output.
- Use a second job that turns that output into a matrix with `fromJSON(...)`.
- Complete this pattern first.
- Ask your instructor to review it before you move on to Pattern B.

### Pattern B: Fixed Matrix with Secret Lookup

- After Pattern A works, you may adapt the same `.github/workflows/02-ci.yml` file to try the fixed-matrix secret-lookup version.
- Keep the matrix fixed in the YAML.
- Put a secret name in each matrix item.
- Read the real value with `secrets[matrix.version_secret]`.
- Treat Pattern B as an optional comparison on the same workflow file, not as a second required exercise workflow.

## Acceptance Criteria

- Pattern A clearly shows one job preparing the matrix values and another job fanning out into multiple CI runs.
- You keep working in `.github/workflows/02-ci.yml` instead of splitting into extra exercise workflow files.
- Pattern B, if you try it, clearly shows that the matrix is already known in the YAML and each run resolves a different secret during the job.
- You can explain why Pattern A needs two jobs.
- You can explain why Pattern B can stay in one job even though Pattern A cannot.
- You can explain which pattern is simpler when the matrix is already known.
