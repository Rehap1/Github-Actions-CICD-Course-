# YAML Cheatsheet for GitHub Actions

## Purpose

This page gives the smallest YAML guide you need for the course.

Use it when a workflow file looks confusing or indentation feels risky.

## Rule 1: Indentation Matters

YAML uses spaces to show structure.

In this course, the safest habit is:

- keep related lines aligned
- do not mix tabs and spaces
- change one small part at a time

## Maps

A map is a set of key-value pairs.

Example:

```yaml
name: 02 CI Workflow
```

That means:

- key = `name`
- value = `02 CI Workflow`

## Lists

A list uses `-`.

Example:

```yaml
paths:
  - "app/**"
  - "tests/**"
```

That means there are multiple path values under `paths`.

## Nested Structure

GitHub Actions workflows often look like this:

```yaml
jobs:
  run-tests:
    runs-on: ubuntu-latest
```

That means:

- `jobs` contains job entries
- `run-tests` is one job
- `runs-on` belongs to that job

## Multiline Scripts

When one step needs multiple shell commands, use `|`.

Example:

```yaml
run: |
  echo "Start"
  python -m unittest discover -s tests -v
```

## Environment Variables

An environment variable gives a name to a value the workflow can use.

Example:

```yaml
env:
  APP_PORT: "8000"
```

That does not make the value secret.

It only gives it a reusable name.

You can place `env` at more than one level.

Example:

```yaml
env:
  APP_NAME: tiny-health-app

jobs:
  run-tests:
    env:
      PYTHON_VERSION: "3.12"
```

Simple rule:

- workflow-level `env` can be reused by many jobs
- job-level `env` is only for that one job

GitHub Actions also supports repository variables from settings.

Example:

```yaml
env:
  BASE_IMAGE: ${{ vars.PYTHON_BASE_IMAGE }}
  APP_PORT: ${{ vars.APP_PORT }}
```

Use that when the value should live in GitHub settings instead of directly in the workflow file.

`vars` comes from GitHub settings; `env` is written inside the YAML file.

## Safe Beginner Habits

- edit one block at a time
- compare indentation carefully
- read comments in the workflow file
- if the file breaks, compare it with the course example

## Related Help

- [How to Read Actions Logs](01-how-to-read-actions-logs.md)
- [Troubleshooting](02-troubleshooting.md)
- [Glossary](03-glossary.md)
