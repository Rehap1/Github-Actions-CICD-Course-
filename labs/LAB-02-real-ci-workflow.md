# LAB-02: Real CI Workflow

## Goal

Your goal is to see a real CI workflow run the project tests.

## What Makes This Different from Lab 01

In Lab 01, the workflow only printed a message.

In this lab, the workflow checks the repository and runs tests automatically.

That is closer to what teams use CI for in real work.

## File for This Lab

Open this file in your repository:

`.github/workflows/02-ci.yml`

## What This Workflow File Contains

This workflow adds the first real CI ideas:

- `on` includes the triggers for code and test changes
- `actions/checkout` brings the repository onto the runner
- `actions/setup-python` prepares Python on the runner
- `Run tests` is the verification step that gives the main CI result

## Step 1: Read the Workflow File

Read the file once before doing anything else.

You should be able to find:

- when the workflow runs
- the job name
- the step that runs the tests

## Step 2: Run the Workflow Manually Once

Open the `Actions` tab.

Open `02 CI Workflow`.

Use the `Run workflow` button to start the workflow manually.

This is the easiest safe first run.

## Step 3: Open the Run and Read the Steps

Open the new workflow run.

Look for these steps:

- `Check out repository`
- `Set up Python`
- `Run tests`

Then open the logs and confirm that the tests passed.

## Step 4: Trigger the CI Workflow with a Code Change

Now make one tiny safe change in `app/app.py`.

Find this line:

```python
print("Server running on http://0.0.0.0:8000")
```

Change it to:

```python
print("Server is running on http://0.0.0.0:8000")
```

This change does not affect the endpoint behavior.

## Step 5: Commit the Change

Commit the change in GitHub with a simple message like:

`Update startup message`

## Step 6: Watch CI Run on Push

Open the `Actions` tab again.

You should now see a new run of `02 CI Workflow`.

Open it and confirm it passes.

## What You Should Notice

This workflow is real CI because:

- it runs automatically after a code change
- it verifies the project with tests
- it gives feedback without waiting for a person to run checks manually

## If the Workflow Fails

Do these checks first:

1. make sure you changed only the text shown above
2. open the failed step
3. read the log message slowly
4. compare your file with the example in this lab

Use [How to Read Actions Logs](../docs/help/01-how-to-read-actions-logs.md) if you need help.

## Success Check

You are done when:

- you have one manual CI run
- you have one push-triggered CI run
- you can point to the `Run tests` step
- you can explain why this workflow is more useful than Lab 01

## Reflection

After the lab, try to answer these questions:

- Why is this workflow closer to real CI?
- What is the value of running tests automatically on push?
- Which step gives the main verification result?

## Optional Extension Exercise

After the core lab is complete, you can practice small safe workflow edits.

These exercises are meant to help you get more comfortable reading and changing CI steps without changing the main purpose of the workflow.

Use the same file:

`.github/workflows/02-ci.yml`

### Version 1: Add One Visibility Step

Goal:

Add one step that shows which Python version the runner is using.

Add this step after `Set up Python`:

```yaml
      - name: Show Python version
        run: python --version
```

What to notice:

- the workflow still verifies the change
- the logs now show more environment information
- small extra steps can make CI easier to understand

### Version 2: Show Repository Files

Goal:

Add one step that shows the repository files on the runner.

Add this step after `Check out repository`:

```yaml
      - name: List repository files
        run: ls -R
```

What to notice:

- checkout brings the repository onto the runner
- the runner can now see the project files
- the logs help you understand what the workflow machine is using

### Version 3: Add Helpful CI Visibility Steps

Goal:

Add three small steps that make the workflow easier to inspect:

1. list repository files
2. show the Python version
3. show the runner time

This is the recommended full exercise version.

Add these steps:

```yaml
      - name: List repository files
        run: ls -R

      - name: Show Python version
        run: python --version

      - name: Show runner time
        run: date
```

### Version 4: Add a Scheduled Trigger

Goal:

Add a `schedule` trigger so the workflow can also run automatically at a specific UTC time.

Example:

If the runner time you observed is `10:15 AM UTC` and you want the workflow to be scheduled for `10:25 AM UTC`, add this:

```yaml
  schedule:
    - cron: "25 10 * * *"
```

That cron expression means:

- minute = `25`
- hour = `10`
- every day of the month
- every month
- every day of the week

Important notes:

- GitHub Actions schedules use UTC
- the workflow may start a little later than the exact minute if GitHub is busy
- this is an optional trigger example, not a required part of the core Lab 02 path

If you add this trigger, the full `on` block would look like this:

```yaml
on:
  push:
    paths:
      - "app/**"
      - "tests/**"
      - ".github/workflows/02-ci.yml"
  workflow_dispatch:
  schedule:
    - cron: "25 10 * * *"
```

## Exercise Workflow Version

If you want one full example workflow version for the extension exercise, use this:

```yaml
# This is the first real CI workflow in the course.
# It verifies a change by running tests on a fresh runner.
name: 02 CI Workflow

on:
  push:
    paths:
      - "app/**"
      - "tests/**"
      - ".github/workflows/02-ci.yml"
  workflow_dispatch:
  schedule:
    - cron: "25 10 * * *"

jobs:
  run-tests:
    runs-on: ubuntu-latest

    steps:
      - name: Check out repository
        uses: actions/checkout@v6

      - name: List repository files
        run: ls -R

      - name: Set up Python
        uses: actions/setup-python@v6
        with:
          python-version: "3.12"

      - name: Show Python version
        run: python --version

      - name: Show runner time
        run: date

      - name: Run tests
        run: python -m unittest discover -s tests -v
```

## Success Check for the Extension

You are done when:

- the workflow still passes
- you can find the file-list step in the logs
- you can find the Python version in the logs
- you can find the runner time in the logs
- you can explain what `25 10 * * *` means in UTC
- you can explain why these steps are helpful even though they do not change the app behavior
