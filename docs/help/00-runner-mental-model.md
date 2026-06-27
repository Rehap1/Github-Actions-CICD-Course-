# Runner Mental Model

## Purpose

This file explains one GitHub Actions idea that often feels mysterious at first:

What is a runner?

## Short Answer

A runner is the machine that performs the job steps in a workflow.

For this course, use this simple model:

- workflow = the full automation plan
- job = one group of work
- step = one action inside that job
- runner = the machine doing that work

## What `runs-on` Means

In our workflow files, you will see:

`runs-on: ubuntu-latest`

That means GitHub starts a Linux machine for that job.

If you want a slightly wider view after the main course, also read [Runner Types](05-runner-types.md).

## The Most Important Thing to Remember

The runner is not your laptop.

That is why workflows often include steps like:

- check out repository
- set up Python
- run tests

The runner needs those instructions because it starts as a fresh machine for the job.

## Why This Helps

This idea explains several beginner questions:

### Why do we need `actions/checkout`?

Because the runner does not automatically have the repository files.

### Why do we need `setup-python`?

Because the workflow should prepare the machine it is running on.

### Why can GitHub Actions behave differently from my laptop?

Because the workflow is running on a separate machine with its own environment.

## What You Should Picture in Your Mind

When a workflow starts, picture this story:

1. GitHub starts a fresh machine
2. the job begins on that machine
3. the steps run one by one
4. the logs show what happened

That mental model is enough for this course.

## Related Help

- [How to Read Actions Logs](01-how-to-read-actions-logs.md)
- [Troubleshooting](02-troubleshooting.md)
- [Glossary](03-glossary.md)
- [Runner Types](05-runner-types.md)
