# Finding and Reusing GitHub Actions

## Purpose

This page explains:

- what an action is
- how to find actions in GitHub
- how actions are reused in workflows
- how reusable workflows are different

This is a next-step topic, not part of the main beginner labs.

## What an Action Is

An action is a reusable building block for a workflow.

Instead of writing every setup step yourself, you can use an existing action that already knows how to do one job well.

In simple words:

- workflow = the full automation plan
- job = one group of work
- step = one action or command
- action = a reusable building block often used inside a step

## How to Spot an Action in a Workflow

When you see `uses:`, that usually means the workflow is using an action.

Examples from this course:

```yaml
uses: actions/checkout@v6
uses: actions/setup-python@v6
uses: actions/upload-artifact@v4
uses: actions/download-artifact@v4
```

These are reusable actions.

They save us from rewriting common setup and packaging logic again and again.

## What We Already Use in This Course

### `actions/checkout`

This action brings the repository files onto the runner.

Without it, the runner would not have the project files to work with.

### `actions/setup-python`

This action prepares Python on the runner.

It helps the workflow use the Python version we want.

### `actions/upload-artifact`

This action saves a workflow output so it can be used later.

### `actions/download-artifact`

This action retrieves a saved artifact from an earlier workflow run.

### `docker/setup-buildx-action`

This action prepares Docker Buildx on the runner.

It is useful when a workflow wants a more reusable build flow than a raw `docker build` command.

### `docker/build-push-action`

This action can build, tag, load, export, or push Docker images.

In this course, it is a good next-step example because it can replace a raw Docker build command while keeping the same packaging story.

## How to Find Actions

There are two beginner-friendly places to find them.

### 1. In the GitHub workflow editor

GitHub's workflow editor includes a sidebar that can help you browse actions.

That is useful when:

- you want to search for a common action
- you want to see featured actions
- you want a quick insert experience

### 2. In GitHub Marketplace

GitHub Marketplace is the main place to browse published actions.

When you open an action listing, look for:

- what problem the action solves
- the `uses:` line
- required inputs under `with:`
- example workflow syntax
- whether the creator is trusted or verified

## How to Search for the Right Action

Start with the problem you are trying to solve.

Good beginner search examples:

- `checkout repository github action`
- `setup python github action`
- `upload artifact github action`
- `download artifact github action`
- `docker login github action`

Better search habit:

search for the task first, not for random action names.

That keeps your workflow focused on the problem instead of on memorizing Marketplace listings.

## How to Pick a Good Action

When you find more than one action, check these things:

### 1. Is the creator familiar or trusted?

For beginner use, prefer:

- official GitHub actions such as `actions/checkout`
- widely used actions with clear documentation
- creators marked as verified when possible

### 2. Is the purpose clear?

A good action page should tell you:

- what it does
- when to use it
- what inputs it needs
- what example syntax looks like

### 3. Is the example easy to copy?

If the usage example is confusing, it may be a bad first choice for a beginner lab.

### 4. Does it add clarity or complexity?

Use an action when it makes the workflow easier to understand.

Do not add an action just because it exists.

## How to Use an Action

Once you choose an action, look for the example usage on its documentation or Marketplace page.

Most of the time, you will copy a step that looks like this:

```yaml
- name: Check out repository
  uses: actions/checkout@v6
```

If the action needs inputs, you will usually see `with:`

Example:

```yaml
- name: Set up Python
  uses: actions/setup-python@v6
  with:
    python-version: "3.12"
```

So the basic pattern is:

1. find the action
2. copy the example `uses:` line
3. add any required `with:` inputs
4. keep the step name readable

## How to Get the Proper Action Syntax

The safest beginner method is:

1. open the action page
2. go to the example or installation section
3. copy the workflow syntax shown there
4. paste it into your workflow as a new step
5. adjust only the small inputs you understand

Do not invent the `uses:` syntax from memory if the page already gives you the correct example.

Short rule:

Copy the action version from the official docs or action page you are using now.

Do not guess the version from memory.

## Simple Beginner Safety Rules for Using Actions

Prefer actions that:

- solve one clear problem
- have simple documentation
- show a small example
- do not require secrets unless you already understand why
- use a clear version in `uses:`

Be careful with actions that:

- need many credentials
- hide too much logic for a beginner course
- solve a problem you are not actually trying to solve yet

## Action Search Examples From This Course

If you want to find the actions we already use, search like this:

### Find checkout

Search:

`github actions checkout action`

Result you want:

`actions/checkout`

### Find Python setup

Search:

`github actions setup python`

Result you want:

`actions/setup-python`

### Find artifact upload

Search:

`github actions upload artifact`

Result you want:

`actions/upload-artifact`

### Find artifact download

Search:

`github actions download artifact`

Result you want:

`actions/download-artifact`

### Find Docker Buildx setup

Search:

`github actions docker buildx setup`

Result you want:

`docker/setup-buildx-action`

### Find Docker build and push

Search:

`github actions docker build push action`

Result you want:

`docker/build-push-action`

## Simple Safety Rules for Beginners

When you look at an action, ask:

1. what job is this action solving?
2. do I understand where it fits in the workflow?
3. does the documentation show a simple example?
4. does it require secrets or credentials?
5. is it adding clarity or just more complexity?

For this course, prefer actions that make the workflow clearer, not more advanced.

## One Useful Course Example

In the core build lab, we use a plain `docker build` command because it is easier to teach first.

After that, `EX-05` shows how a reusable Docker action can replace that raw command:

- plain command path: read the build logic directly
- Buildx action path: reuse a ready-made building block

You can build that example yourself in:

- [EX-05: Build Artifact with Buildx](../../exercises/EX-05-build-artifact-with-buildx.md)

If your instructor reveals a reference solution, it lives in the instructor repository.

## Reusable Actions versus Reusable Workflows

These are related, but they are not the same.

### Reusable Action

A reusable action is usually used inside a step.

Example:

```yaml
- name: Check out repository
  uses: actions/checkout@v6
```

Think of it as:

"Use this ready-made building block for one part of the job."

### Reusable Workflow

A reusable workflow is a whole workflow file that can be called by another workflow.

It is larger than a single action.

Think of it as:

"Use this ready-made workflow shape instead of copying the same jobs again."

Reusable workflows are a later topic because they add more structure and more abstraction.

## Easy Memory Rule

Use this short rule:

- action = reusable building block inside a step
- reusable workflow = reusable workflow file called by another workflow

## What Matters for This Course

The most important beginner idea is this:

GitHub Actions workflows do not need to be written from scratch every time.

Teams often reuse:

- setup steps
- checkout steps
- artifact steps
- deployment helpers

That is why `uses:` appears so often in workflow files.

## What Not to Overthink Yet

For this course, you do not need to:

- create your own custom action
- publish an action
- create a reusable workflow
- compare many Marketplace actions in depth

The beginner goal is only to understand what `uses:` means and where these reusable pieces come from.

## Related Pages

- [Trigger Reference](06-trigger-reference.md)
- [YAML Cheatsheet for GitHub Actions](04-yaml-cheatsheet.md)
- [Glossary](03-glossary.md)
- [Next Steps: Matrix and Secrets](../06-next-steps-matrix-and-secrets.md)

## Reference

Official GitHub Docs:

- [Using pre-written building blocks in your workflow](https://docs.github.com/en/actions/learn-github-actions/finding-and-customizing-actions)
- [Reuse workflows](https://docs.github.com/en/actions/using-workflows/reusing-workflows)
