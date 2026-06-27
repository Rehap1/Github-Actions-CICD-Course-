# GitHub Actions Foundations

## Purpose

Use this page on Day 1 before or between the first labs.

It puts the main GitHub Actions ideas in one simple order so the hands-on work feels connected.

## Day 1 Sequence

Use this sequence:

1. understand the delivery problem
2. understand what CI/CD means
3. understand why GitHub working habits still matter
4. understand the shape of a workflow
5. run a first workflow
6. run a real CI workflow
7. complete the matching exercises after each lab

## What GitHub Actions Is

GitHub Actions is GitHub's workflow automation system.

In this course, we use it to express beginner CI/CD ideas in a visible way.

## What a Workflow Is

A workflow is the full automation file.

The smallest useful shape looks like this:

```yaml
name: Example Workflow

on:
  workflow_dispatch:

jobs:
  example-job:
    runs-on: ubuntu-latest
    steps:
      - name: Say hello
        run: echo "Hello"
```

Simple reading rule:

- `name` = visible title
- `on` = when the workflow starts
- `jobs` = groups of work
- `runs-on` = the runner machine
- `steps` = the actions inside the job

## Trigger Types

Core course triggers:

- `workflow_dispatch`
- `push`
- `workflow_run`

Challenge or next-step triggers:

- `pull_request`
- `schedule`

Also remember:

- `paths` narrows when a workflow should run
- `paths-ignore` helps avoid noisy runs

## Jobs, Steps, Actions, and Reusable Actions

Read these terms like this:

- workflow = the full automation
- job = one group of work
- step = one action inside a job
- action = a reusable building block used with `uses:`

Examples already used in this repo:

- `actions/checkout`
- `actions/setup-python`
- `actions/upload-artifact`
- `actions/download-artifact`

## Environment Variables and GitHub Variables

`env` gives a reusable name to a value inside the workflow file.

GitHub Actions also supports `vars`, which are normal non-secret values stored in repository settings.

Simple rule:

- workflow-level `env` can be reused by many jobs
- job-level `env` is only for one job
- `vars` comes from `Settings -> Secrets and variables -> Actions -> Variables`

Quick comparison:

- `env` = value written in the YAML file
- `vars` = value stored in GitHub settings
- `secrets` = protected sensitive value stored in GitHub settings

Later, some teams also store normal values under specific GitHub environments.

For this course, the simple starting idea is:

`vars` = normal values from GitHub repo settings

## `needs`, Matrix, and Secrets

These are important, but they are not all part of the beginner core path.

- `needs` makes job order explicit
- matrix repeats one job across multiple values
- secrets hold protected values in GitHub settings

In this repo:

- the core labs focus first on workflow shape and CI verification
- the exercises introduce matrix and secret patterns after the related lab
- the larger optional workflows make `needs` easier to see

## Day 1 Course Path

1. [LAB-01: First Workflow](../labs/LAB-01-first-workflow.md)
2. [EX-01: Hello Trigger and PR Merge](../exercises/EX-01-hello-trigger-and-pr-merge.md)
3. [How to Read Actions Logs](help/01-how-to-read-actions-logs.md)
4. [LAB-02: Real CI Workflow](../labs/LAB-02-real-ci-workflow.md)
5. [EX-02: CI Visibility and Schedule](../exercises/EX-02-ci-visibility-and-schedule.md)
6. [EX-03: CI Matrix](../exercises/EX-03-ci-matrix.md)
7. [EX-04: CI Secrets and Matrix Patterns](../exercises/EX-04-ci-secrets-and-matrix.md)

## Related Pages

- [Engineering Problems, CI/CD, and Branching Strategy](09-engineering-problems-cicd-and-branching.md)
- [Exercises Index](../exercises/README.md)
- [Trigger Reference](help/06-trigger-reference.md)
- [YAML Cheatsheet for GitHub Actions](help/04-yaml-cheatsheet.md)
- [Finding and Reusing GitHub Actions](help/07-finding-and-reusing-actions.md)
